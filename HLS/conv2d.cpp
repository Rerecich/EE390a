#include <ap_int.h>
#include "conv2d.h"

inline TFXP FXP_Mult(TFXP a, TFXP b, uint32_t decimalBits = DECIMALS)
{
  //return a*b;
  // We need a wider data type to correctly capture the result of the multiplication.
  TFXP_MULT res = (TFXP_MULT)a * (TFXP_MULT)b;
  res = res >> decimalBits;
  return res;
}


void Conv2D_HW(TFXP *input, TFXP * output, TFXP * filters,
      ap_uint<32> numFilters, ap_uint<32> numChannels,
      ap_uint<32> inputWidth, ap_uint<32> inputHeight,
      ap_uint<32> convWidth, ap_uint<32> convHeight)


{

#pragma HLS INTERFACE m_axi depth=1024 port=filters offset=slave

  for (ap_uint<32> iFilter = 0; iFilter < numFilters; ++ iFilter) {
    for (ap_uint<32> y = 0; y < (inputHeight-2); ++y) {
      for (ap_uint<32> x = 0; x < (inputWidth-2); ++ x) {
        TFXP acc;
        acc = 0;
        for (ap_uint<32> iChannel = 0; iChannel < numChannels; ++ iChannel) {
          for (ap_uint<32> cy = 0; cy < convHeight; ++ cy) {
            for (ap_uint<32> cx = 0; cx < convWidth; ++cx) {
              //acc += filters[iFilter][iChannel][cy][cx] * input[iChannel][y+cy][x+cx];
              TFXP v, f;
              f = *(filters + iFilter*numChannels*convHeight*convWidth + iChannel*convHeight*convWidth + cy*convWidth + cx);
              v = *(input + iChannel*inputWidth*inputHeight + (y+cy)*inputWidth + (x+cx));
              acc += FXP_Mult(f, v, DECIMALS);
            }
          }
        }
        //output[iFilter][y][x] = acc;
        *(output + iFilter * (inputHeight-2)*(inputWidth-2) + y*(inputWidth-2) + x) = acc;
      }
    }
  }
}
