#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <map>
#include "util.hpp"
#include "CAccelDriver.hpp"
#include "CConv2DDriver.hpp"

uint32_t CConv2DDriver::Conv2D_HW(void *input, void * output, void * coeffs,
      uint32_t numChannels, uint32_t numFilters,
      uint32_t inputWidth, uint32_t inputHeight,
      uint32_t convWidth, uint32_t convHeight)
{
  volatile TRegs * regs = (TRegs*)accelRegs;
  uint32_t phyInput, phyOutput, phyCoeffs;
  uint32_t status;
  struct timespec start, end;
  uint64_t elapsed = 0;

  if (logging)
    printf("CConv2DDriver::Conv2D_HW(Input=0x%08X, Output=0x%08X, Coeffes=0x%08X, "
          "NumChannels=%u, NumFilters=%u, Width=%u, Height=%u, FilterSize=%ux%u)\n", 
          (uint32_t)input, (uint32_t)output, (uint32_t)coeffs,
          numChannels, numFilters, inputWidth, inputHeight, convWidth, convHeight);

  if (accelRegs == NULL) {
    if (logging)
      printf("Error: Calling Conv2D_HW() on a non-initialized accelerator.\n");
    return DEVICE_NOT_INITIALIZED;
  }

  // We need to obtain the physical addresses corresponding to each of the virtual addresses passed by the application.
  // The accelerator uses only the physical addresses (and only contiguous memory).
  phyInput = GetDMAPhysicalAddr(input);
  if (phyInput == 0) {
    if (logging)
      printf("\n\nError: No physical address found for virtual address 0x%08X\n", (uint32_t)input);
    return VIRT_ADDR_NOT_FOUND;
  }
  phyOutput = GetDMAPhysicalAddr(output);
  if (phyOutput == 0) {
    if (logging)
      printf("\n\nError: No physical address found for virtual address 0x%08X\n", (uint32_t)output);
    return VIRT_ADDR_NOT_FOUND;
  }
  phyCoeffs = GetDMAPhysicalAddr(coeffs);
  if (phyCoeffs == 0) {
    if (logging)
      printf("\n\nError: No physical address found for virtual address 0x%08X\n", (uint32_t)coeffs);
    return VIRT_ADDR_NOT_FOUND;
  }

  // Write to registers (todo)
  //printf("You were supposed to add your code here...\n"); /** Program accel regs @todo */

  regs -> input = (uint32_t)phyInput;
  regs -> output = (uint32_t)phyOutput;
  regs -> coeffs = (uint32_t)phyCoeffs;

  regs -> numChannels = numChannels;
  regs -> numFilters = numFilters;
  regs -> inputWidth = inputWidth;
  regs -> inputHeight = inputHeight;
  regs -> convWidth = convWidth;
  regs -> convHeight = convHeight;

  if (logging)
    printf("\nStarting accel...\n");
  // Send start command to the accel
  //printf("You were supposed to add your code here...\n"); /** Send start command @todo */
  	clock_gettime(CLOCK_MONOTONIC_RAW, &start);

    status = regs->control;
    status |= 1;  // Set to 1 ap_start ; or operation, lowest bit gets one
    regs->control = status;


  // Wait for done signal from the accel
  //printf("You were supposed to add your code here...\n"); /** Wait for done signal @todo */
    do {
        status = regs->control;
      } while ( ( (status & 2) != 2) ); // wait until ap_done==1

      clock_gettime(CLOCK_MONOTONIC_RAW, &end);
      elapsed = CalcTimeDiff(end, start);


  return OK;
}

