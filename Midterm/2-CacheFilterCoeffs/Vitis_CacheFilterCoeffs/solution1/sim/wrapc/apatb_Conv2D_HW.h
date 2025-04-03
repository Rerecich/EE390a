// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================

extern "C" void AESL_WRAP_Conv2D_HW (
volatile void* input_r,
volatile void* output_r,
volatile void* coeffs,
volatile void* biases,
int numChannels,
int numFilters,
int inputWidth,
int inputHeight,
int convWidth,
int convHeight,
char apply_relu);
