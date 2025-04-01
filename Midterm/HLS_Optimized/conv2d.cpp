//#include <ap_int.h>
#include <stdint.h>
#include <stdio.h>
#include "conv2d.h"

#define PARALLEL_FILTERS 4  


inline TFXP FXP_Mult(TFXP a, TFXP b, uint32_t decimalBits = DECIMALS)
{
  //return a*b;
  // We need a wider data type to correctly capture the result of the multiplication.
  TFXP_MULT res = (TFXP_MULT)a * (TFXP_MULT)b;
  res = res >> decimalBits;
  return res;
}


void Conv2D_HW(TFXP *input, TFXP * output, TFXP * coeffs, TFXP *biases,
      uint32_t numChannels, uint32_t numFilters,
      uint32_t inputWidth, uint32_t inputHeight,
      uint32_t convWidth, uint32_t convHeight, uint32_t apply_relu)

{
	#pragma HLS INTERFACE s_axilite port=return
	#pragma HLS INTERFACE s_axilite port=numChannels
	#pragma HLS INTERFACE s_axilite port=numFilters
	#pragma HLS INTERFACE s_axilite port=inputWidth
	#pragma HLS INTERFACE s_axilite port=inputHeight
	#pragma HLS INTERFACE s_axilite port=convWidth
	#pragma HLS INTERFACE s_axilite port=convHeight
	#pragma HLS INTERFACE m_axi depth=200000 port=input offset=slave
	#pragma HLS INTERFACE m_axi depth=200000 port=output offset=slave
	#pragma HLS INTERFACE m_axi depth=200000 port=coeffs offset=slave
	#pragma HLS INTERFACE m_axi depth=200000 port=biases offset=slave

	#pragma HLS INTERFACE s_axilite port=apply_relu

	// loop over each output channel in parallel groups instead of individual channels
	for (uint32_t iFilterBase = 0; iFilterBase < numFilters; iFilterBase += PARALLEL_FILTERS) { 
		TFXP coeff_cache[PARALLEL_FILTERS][MAX_CHANNELS][3][3]; // local cache for multiple filters
		#pragma HLS ARRAY_PARTITION variable=coeff_cache complete dim=4

		// adding a new loop to load coefficients for the filters in parallel
		for (uint32_t pf = 0; pf < PARALLEL_FILTERS; ++pf) {
			uint32_t iFilter = iFilterBase + pf;
			if (iFilter >= numFilters) break; // you should really be doing checks like this more often

			// loop over all ze channels, and each pixel within the channel
    		for (uint32_t iChannel = 0; iChannel < numChannels; ++iChannel) {
      			for (uint32_t cy = 0; cy < convHeight; ++cy) {
        			for (uint32_t cx = 0; cx < convWidth; ++cx) {
						// assign values using the same-ish syntax as the original application originally loaded the filter values
        				coeff_cache[pf][iChannel][cy][cx] =
          					*(coeffs + iFilter * numChannels * convHeight * convWidth +
                    		iChannel * convHeight * convWidth +
                    		cy * convWidth + cx);
      				}
    			}
  			}
		}


		// the x and y loops are essentially the position of the "window" moving across and down (x and y)
		// so first along the height (rows - y), then across the width (columns - x)
	    for (uint32_t y = 0; y < (inputHeight-2); ++y) {
	    	TFXP row_buffer[3][4064]; // initialize buffer for TWO rows using the maximum product of the size and number of channels (but not the maximum size * maximum channels cuz pynq cannot handle it [BRAM related? i think?] and does weird things)
			#pragma HLS ARRAY_PARTITION variable=row_buffer complete dim=1

	    	// then, now caching the rows (y), we move along each row and store accordingly
	    	for (uint32_t cy = 0; cy < convHeight; ++cy) {
	    		uint32_t iy = y + cy;
	    		// ...which we do for each channel
	    		for (uint32_t iChannel = 0; iChannel < numChannels; ++iChannel) {
	    			//...and each component of the row, which of course moves in the x direction
	    			for (uint32_t x = 0; x < inputWidth; ++x) {
						#pragma HLS PIPELINE II=1
						// and we changed this slightly because now row_buffer has two dimensions instead of three
	    				row_buffer[cy][iChannel*inputWidth + x] = *(input + iChannel*inputWidth*inputHeight + iy*inputWidth + x);
	    			}
	    		}
	    	}

	    	// after that brief interlude, we go back to the moving of the window
	    	for (uint32_t x = 0; x < (inputWidth-2); ++ x) {
	    		TFXP acc[PARALLEL_FILTERS] = {0}; // initialize accumulator for each parallel filter

	    		// and again, we do this for each output channel
	    		for (uint32_t iChannel = 0; iChannel < numChannels; ++ iChannel) {

	    			// ...moving along the y components of the convolution window
	    			for (uint32_t cy = 0; cy < convHeight; ++ cy) { // this and the next line is the loop over convolution filter window
				
	    				//...and naturally the x components as well
	    				for (uint32_t cx = 0; cx < convWidth; ++cx) {
	    					TFXP pixelValue = row_buffer[cy][iChannel*inputWidth + x + cx];

							// compute multiply-accumulate for each parallel filter
							for (uint32_t pf = 0; pf < PARALLEL_FILTERS; ++pf) {
								uint32_t iFilter = iFilterBase + pf;
								if (iFilter >= numFilters) continue; // in case numFilters isn't a multiple of PARALLEL_FILTERS

								TFXP filterValue = coeff_cache[pf][iChannel][cy][cx]; // like before but with pf
								acc[pf] += FXP_Mult(filterValue, pixelValue, DECIMALS);
							}
	    				}
	    			}
	    		}

				// add bias for each output filter
				for (uint32_t pf = 0; pf < PARALLEL_FILTERS; ++pf) {
					uint32_t iFilter = iFilterBase + pf;
					if (iFilter >= numFilters) continue;

					acc[pf] += biases[iFilter]; 

					if (apply_relu && acc[pf] < 0) // check if we want to use relu here
						acc[pf] = 0;

					// store result
					*(output + iFilter * (inputHeight-2)*(inputWidth-2) + y*(inputWidth-2) + x) = acc[pf];
				}
	      }
	    }
	  }
}