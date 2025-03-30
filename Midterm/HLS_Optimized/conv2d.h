#ifndef CONV2D_H
#define CONV2D_H

#include <ap_int.h>

const ap_uint<32> DECIMALS = 20;
typedef int32_t TFXP;     // Parameters and activations
typedef int64_t TFXP_MULT;// Intermmediate results of multiplications

void Conv2D_HW(TFXP *input, TFXP * output, TFXP * filters, TFXP *biases,
      ap_uint<32> numChannels, ap_uint<32> numFilters,
      ap_uint<32> inputWidth, ap_uint<32> inputHeight,
      ap_uint<32> convWidth = 3, ap_uint<32> convHeight = 3, ap_uint<1> apply_relu = 1);

#endif // CONV2D_H

