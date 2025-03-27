#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <inttypes.h>
#include <stdexcept> // For std::runtime_error


#include "model.h"
#include "CAccelDriver.hpp"
#include "CConv2DDriver.hpp"

const uint32_t MAP_SIZE = 64*1024; // Size of address range mapped to the adder registers
const uint32_t CONV2D_HW_ADDR = 0x40000000; // From Vivado's address editor

const uint32_t INPUT_SIZE = (256*256*3);

TFXP * weights[NUM_LAYERS];
//TFXP *weights = nullptr;
TFXP * biases[NUM_LAYERS];
//TFXP *biases = nullptr;
TTimes times;
uint8_t inputImage[INPUT_SIZE];   // RGB pixel data separated in planes.
TFXP *inputImageFxp = nullptr;
TFXP *buffer0 = nullptr;
TFXP *buffer1 = nullptr;

void InitTimes(TTimes & times);
void PrintTimes(TTimes & times, uint32_t numLayers);
//void CheckDMAAllocations(TFXP* inputImageFxp, TFXP* buffer0, TFXP* buffer1);


int main(int argc, char ** argv)
{
  //CConv2DDriver convolver(true);
  CConv2DDriver convolver(true);
  uint32_t debug = 1;
  
if (argc != 2) {
    printf("Usage: cnnSolver image.rgba.planar\n");
    return -1;
  }
  else {
    printf("Initializing model and converting to FxP...");
  }

  ///////////////////////////////////////////////////
  
  //printf("Opening hardware accelerator...");
  if (convolver.Open(CONV2D_HW_ADDR, MAP_SIZE) != CAccelDriver::OK) {
    printf("Error opening hardware accelerator driver.\n");
    return -1;
  }
  //else {
    //printf("....SUCCESS\n");
  //}

  ///////////////////////////////////////////////////
  //uint32_t testSize = 4*1024*1024 * 4;
  //printf("Test size = %u\n", testSize);
  //uint32_t * input1 = (uint32_t *)accelDriver.AllocDMACompatible(4*1024*1024 * 4); 
  //printf("Input1: Virtual address: 0x%08X (%u)\n", (uint32_t)input1, (uint32_t)input1);
  //TFXP * inputImageFxp = (TFXP *)accelDriver.AllocDMACompatible(uint32_t(INPUT_SIZE * sizeof(TFXP)));
  //TFXP * inputImageFxp = (TFXP *)accelDriver.AllocDMACompatible(INPUT_SIZE);
  //buffer0 = (TFXP *)accelDriver.AllocDMACompatible(4129024 * sizeof(TFXP));
 
  //buffer1 = (TFXP *)accelDriver.AllocDMACompatible(1032256 * sizeof(TFXP));
  //buffer1 = (TFXP *)accelDriver.AllocDMACompatible(1032256);
  //CheckDMAAllocations(inputImageFxp, buffer0, buffer1);

  ///////////////////////////////////////////////////
  if (debug) {
    printf("Loading CNN model and converting to FxP...\n");
  }

  if (!LoadModelInFxP(weights, biases, convolver)) {
    printf("--> Error loading the CNN model and converting to FxP!\n");
    return -1;
  }
  //else {
  //  printf("....SUCCESS\n");
  //}
  if (debug) {
    printf("After LoadModelInFxp: \n");
    printf("Weights = %u\n", **weights);
    printf("Biases = %u\n", **biases);
  }
  ///////////////////////////////////////////////////

  printf("Loading image file in FxP...");
  
  inputImageFxp = (TFXP *)convolver.AllocDMACompatible(INPUT_SIZE * sizeof(TFXP));
  if (!inputImageFxp) {
    printf("Error: could not allocate inputImageFxp DMA buffer.\n");
    return -1;
  }

  if (!LoadImageInFxp(argv[1], inputImageFxp, inputImage, INPUT_SIZE, convolver)) {
    printf("Error loading the image file.\n");
    FreeParams(NUM_LAYERS, (void**)weights);
    FreeParams(NUM_LAYERS, (void**)biases);
    return -1;
  }
  //else {
   // printf("....SUCCESS\n");
  //}
  if (debug) {
    printf("\nAfter LoadImageInFxp: \n");
    for (uint32_t i = 0; i < 50; i++) 
    printf("inputImageFxp = %u\n", inputImageFxp[i]);
    //printf("inputImageFxP = %u/n", *inputImageFxp);
  }

 // if (inputImageFxp != NULL)
	//  accelDriver.FreeDMACompatible(inputImageFxp);
  ///////////////////////////////////////////////////
  printf("Calling InitTimes.......\n");
  InitTimes(times);
  printf("Times initialized, calling Inference...\n");
  //printf("biases input to Inference = %u\n", **biases);

  buffer0 = (TFXP *)convolver.AllocDMACompatible(4129024 * sizeof(TFXP));
  buffer1 = (TFXP *)convolver.AllocDMACompatible(1032256 * sizeof(TFXP));
  TFXP finalPrediction = Inference(inputImageFxp, buffer0, buffer1, weights, biases, times, convolver);
  printf("OUTPUT: %0.8lf --> %s\n", Fxp2Float(finalPrediction, DECIMALS),
    Fxp2Float(finalPrediction) < 0.5 ? "CAT" : "DOG");
  PrintTimes(times, NUM_LAYERS);

  printf("Freeing weights and biases\n");
  FreeParamsHW(NUM_LAYERS, (void**)weights, convolver);
  FreeParamsHW(NUM_LAYERS, (void**)biases, convolver);
  




  if (buffer1 != nullptr) {
    printf("Freeing buffer 1\n");
	  convolver.FreeDMACompatible(buffer1);
  }

  if (buffer0 != nullptr) {
    printf("Freeing buffer 0\n");
	  convolver.FreeDMACompatible(buffer0);
  }

  if (inputImageFxp != nullptr) {
    printf("Freeing inputImageFxp\n");
    	convolver.FreeDMACompatible(inputImageFxp);
  }
  
  
  return Fxp2Float(finalPrediction) < 0.5 ? 0 : 1;;

}


void InitTimes(TTimes & times)
{
  for (uint32_t ii = 0; ii < NUM_LAYERS; ++ ii) {
    times.timeConv[ii] = 0;
    times.timeMaxPool[ii] = 0;
    times.timeDense[ii] = 0;
  }
  times.timeFlatten = 0;
  times.timeSigmoid = 0;
}

void PrintTimes(TTimes & times, uint32_t numLayers)
{
  uint64_t accConv = 0, accMaxPool = 0, accDense = 0;
  double totalTime;

  for (uint32_t ii = 0; ii < numLayers; ++ ii) {
    if (times.timeConv[ii] != 0) {
      printf("Conv %u --> %" PRIu64 " ns (%0.3lf s)\n", ii, times.timeConv[ii], times.timeConv[ii]/1e9);
      accConv += times.timeConv[ii];
    }
  }

  for (uint32_t ii = 0; ii < numLayers; ++ ii) {
    if (times.timeMaxPool[ii] != 0) {
      printf("MaxPool %u --> %" PRIu64 " ns (%0.3lf s)\n", ii, times.timeMaxPool[ii], times.timeMaxPool[ii]/1e9);
      accMaxPool += times.timeMaxPool[ii];
    }
  }

  for (uint32_t ii = 0; ii < numLayers; ++ ii) {
    if (times.timeDense[ii] != 0) {
      printf("Dense %u --> %" PRIu64 " ns (%0.3lf s)\n", ii, times.timeDense[ii], times.timeDense[ii]/1e9);
      accDense += times.timeDense[ii];
    }
  }

  totalTime = accConv + accMaxPool + accDense + times.timeFlatten + times.timeSigmoid;
  printf("Total Conv time: %" PRIu64 " ns (%0.3lf s) %0.1lf %%\n", accConv, accConv/1e9, (accConv/totalTime)*100);
  printf("Total MaxPool time: %" PRIu64 " ns (%0.3lf s) %0.1lf %%\n", accMaxPool, accMaxPool/1e9, (accMaxPool/totalTime)*100);
  printf("Total Dense time: %" PRIu64 " ns (%0.3lf s) %0.1lf %%\n", accDense, accDense/1e9, (accDense/totalTime)*100);
  printf("Total Flatten time: %" PRIu64 " ns (%0.3lf s) %0.1lf %%\n", times.timeFlatten, times.timeFlatten/1e9, (times.timeFlatten/totalTime)*100);
  printf("Total Sigmoid time: %" PRIu64 " ns (%0.3lf s) %0.1lf %%\n", times.timeSigmoid, times.timeSigmoid/1e9, (times.timeSigmoid/totalTime)*100);

  printf("Total time: %" PRIu64 " ns (%0.3lf s) %0.1lf %%\n", (uint64_t)totalTime, totalTime/1e9, (totalTime/totalTime)*100); // :-)







}

void CheckDMAAllocations(TFXP* inputImageFxp, TFXP* buffer0, TFXP* buffer1)
{
    if (inputImageFxp != nullptr) {
        printf("inputImageFxp allocated at %p. First element: %d\n", (void*)inputImageFxp, inputImageFxp[0]);
    } else {
        printf("ERROR: inputImageFxp allocation failed. Value: %p\n", (void*)inputImageFxp);
    }

    if (buffer0 != nullptr) {
        printf("buffer0 allocated at %p. First element: %d\n", (void*)buffer0, buffer0[0]);
    } else {
        printf("ERROR: buffer0 allocation failed. Value: %p\n", (void*)buffer0);
    }

    if (buffer1 != nullptr) {
        printf("buffer1 allocated at %p. First element: %d\n", (void*)buffer1, buffer1[0]);
    } else {
        printf("ERROR: buffer1 allocation failed. Value: %p\n", (void*)buffer1);
    }

    if (inputImageFxp && buffer0 && buffer1) {
        printf("✅ All DMA buffers allocated successfully!\n");
    } else {
        printf("❌ DMA allocation issue detected — check above errors.\n");
        throw std::runtime_error("DMA allocation failure, terminating");
    }
}


