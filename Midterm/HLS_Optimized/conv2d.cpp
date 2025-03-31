#include <ap_int.h>
#include <stdint.h>
#include <stdio.h>
#include "conv2d.h"


inline TFXP FXP_Mult(TFXP a, TFXP b, uint32_t decimalBits = DECIMALS)
{
  //return a*b;
  // We need a wider data type to correctly capture the result of the multiplication.
  TFXP_MULT res = (TFXP_MULT)a * (TFXP_MULT)b;
  res = res >> decimalBits;
  return res;
}


void Conv2D_HW(TFXP *input, TFXP * output, TFXP * coeffs, TFXP *biases,
      ap_uint<32> numChannels, ap_uint<32> numFilters,
      ap_uint<32> inputWidth, ap_uint<32> inputHeight,
      ap_uint<32> convWidth, ap_uint<32> convHeight, ap_uint<1> apply_relu)

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


	for (ap_uint<32> iFilter = 0; iFilter < numFilters; ++ iFilter) { // loop over each output channel
		TFXP coeff_cache[MAX_CHANNELS][3][3]; // local cache

		// adding a new loop to load coefficients for the filter
		for (ap_uint<32> iChannel = 0; iChannel < numChannels; ++iChannel) {
    		for (ap_uint<32> cy = 0; cy < convHeight; ++cy) {
      			for (ap_uint<32> cx = 0; cx < convWidth; ++cx) {
					// assign values using the same syntax as the original application originally loaded the filter values
        			coeff_cache[iChannel][cy][cx] =
          					*(coeffs + iFilter * numChannels * convHeight * convWidth +
                    		iChannel * convHeight * convWidth +
                    		cy * convWidth + cx);
      			}
    		}
  		}


		// the x and y loops are essentially the position of the "window" moving across and down (x and y)
		// so first along the height (rows - y), then across the width (columns - x)
	    for (ap_uint<32> y = 0; y < (inputHeight-2); ++y) {
	    	TFXP row_buffer[3][MAX_CHANNELS][MAX_WIDTH]; // initialize buffer for three rows

	    	// then, now caching the rows (y), we move along each row and store accordingly
	    	for (ap_uint<32> cy = 0; cy < convHeight; ++cy) {
	    		ap_uint<32> iy = y + cy;
	    		// ...which we do for each channel
	    		for (ap_uint<32> iChannel = 0; iChannel < numChannels; ++iChannel) {
	    			//...and each component of the row, which of course moves in the x direction
	    			for (ap_uint<32> x = 0; x < inputWidth; ++x) {
	    				row_buffer[cy][iChannel][x] = *(input + iChannel*inputWidth*inputHeight + iy*inputWidth + x);
	    			}
	    		}
	    	}

	    	// after that brief interlude, we go back to the moving of the window
	    	for (ap_uint<32> x = 0; x < (inputWidth-2); ++ x) {
	    		TFXP acc = 0;

	    		// and again, we do this for each output channel
	    		for (ap_uint<32> iChannel = 0; iChannel < numChannels; ++ iChannel) {

	    			// ...moving along the y components of the convolution window
	    			for (ap_uint<32> cy = 0; cy < convHeight; ++ cy) { // this and the next line is the loop over convolution filter window
				
	    				//...and naturally the x components as well
	    				for (ap_uint<32> cx = 0; cx < convWidth; ++cx) {
	    					//filterValue = *(coeffs + iFilter*numChannels*convHeight*convWidth + iChannel*convHeight*convWidth + cy*convWidth + cx);
	    					TFXP filterValue = coeff_cache[iChannel][cy][cx]; // still assigning filter value based on coefficients

	    					//pixelValue = *(input + iChannel*inputWidth*inputHeight + (y+cy)*inputWidth + (x+cx));
	    					TFXP pixelValue = row_buffer[cy][iChannel][x + cx];
	    					acc += FXP_Mult(filterValue, pixelValue, DECIMALS);
	    				}
	    			}
	    		}
	        // add bias for this output filter
	        acc += biases[iFilter];

	        if (apply_relu && acc < 0) // check if we want to use relu here
	            acc = 0;

	        // store result
	        *(output + iFilter * (inputHeight-2)*(inputWidth-2) + y*(inputWidth-2) + x) = acc;
	      }
	    }
	  }
}
