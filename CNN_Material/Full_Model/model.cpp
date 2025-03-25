#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdint.h>
#include <inttypes.h>
#include <string.h> // memcpy
#include <stdexcept> // For std::runtime_error


#include "model.h"
#include "cnn.h"
#include "CAccelDriver.hpp"
#include "CConv2DDriver.hpp"

const uint32_t MAP_SIZE = 64*1024; // Size of address range mapped to the adder registers
const uint32_t CONV2D_HW_ADDR = 0x40000000; // From Vivado's address editor


bool ConvertWeightsToFxP(const uint32_t numLayers, float ** floatWeights, TFXP ** fxpWeights, CAccelDriver &accelDriver)
{
  printf("\n");
  printf("============================================\n");
  printf("==============ConvertWeightsToFxp===========\n");
  printf("============================================\n\n");
  
  float * pFloat;
  TFXP * pFxp;

  //CAccelDriver accelDriver;
  //if (accelDriver.Open(CONV2D_HW_ADDR, MAP_SIZE) != CAccelDriver::OK) {
  //  printf("Error opening hardware accelerator driver.\n");
  //  return -1;
  //}
  //else {
  //  printf("Hardware accelerator driver open\n\n");
  //}
  
  
  for (uint32_t iLayer = 0; iLayer < numLayers; ++ iLayer) {
    pFloat = floatWeights[iLayer];
    uint32_t layerSize = LayerTypes[iLayer] == CONV ? LayerShapes[iLayer][0] * LayerShapes[iLayer][1] * 3*3 : LayerShapes[iLayer][0] * LayerShapes[iLayer][1];
    if ( (fxpWeights[iLayer] = (TFXP*)accelDriver.AllocDMACompatible(layerSize * sizeof(TFXP))) == NULL ) {
      printf("Error allocating %" PRIu32 " bytes for FxP weights in layer %u\n", (uint32_t)(layerSize*sizeof(TFXP)), iLayer);
      return false;
    }
    printf("fxpWeights memory allocated\n");
    pFxp = fxpWeights[iLayer];
    for (uint32_t iFilter = 0; iFilter < LayerShapes[iLayer][1]; ++ iFilter) {
      for (uint32_t iChannel = 0; iChannel < LayerShapes[iLayer][0]; ++ iChannel) {
        if (LayerTypes[iLayer] == CONV) {
          for (uint32_t iWeight = 0; iWeight < 9; ++ iWeight) {
            *pFxp = Float2Fxp(*pFloat, DECIMALS);
            ++ pFxp;
            ++ pFloat;
          }
        } else {
          *pFxp = Float2Fxp(*pFloat, DECIMALS);
          ++ pFxp;
          ++ pFloat;
        }
      }
    }
  }
  printf("Converison complete. \n");

  //if (fxpWeights != NULL)
    //accelDriver.FreeDMACompatible(fxpWeights);
  //if (fxpWeights != NULL) {
  //  for (uint32_t iLayer = 0; iLayer < numLayers; ++iLayer) {
  //        if (fxpWeights[iLayer] != nullptr) {
  //            accelDriver.FreeDMACompatible(fxpWeights[iLayer]);
  //            fxpWeights[iLayer] = nullptr;
  //        }
  //  }
  //}
  return true;
}

void FreeParams(const uint32_t numLayers, void ** params)
{
  printf("\n");
  printf("============================================\n");
  printf("==================FreeParams================\n");
  printf("============================================\n\n");
  
  for (uint32_t ii = 0; ii < numLayers; ++ ii) {
    if (params[ii]) {
      free(params[ii]);
      params[ii] = NULL;
    }
  }
}

void FreeParamsHW(uint32_t numLayers, void **params, CAccelDriver &accelDriver)
{
    for (uint32_t i = 0; i < numLayers; ++i) {
        if (params[i] != nullptr) {
            accelDriver.FreeDMACompatible(params[i]);
            params[i] = nullptr;
        }
    }
}


bool LoadFloatWeights(const uint32_t numLayers, float **weights, CAccelDriver &accelDriver)
{
  printf("\n============================================\n");
  printf("==============LoadFloatWeights==============\n");
  printf("============================================\n\n");

  FILE *input = NULL;
  
  // Assume the driver is already open.
  printf("Hardware accelerator driver open\n");

  for (uint32_t iLayer = 0; iLayer < numLayers; ++iLayer) {
    //printf("Loop: \n");
    char title[256];
    snprintf(title, sizeof(title), "model/weights_%u.bin", iLayer);
    input = fopen(title, "rb");
    if (input == NULL) {
      printf("Error opening file [%s]\n", title);
      // Free any previously allocated standard memory for weights.
      for (uint32_t j = 0; j < iLayer; j++) {
         if (weights[j] != NULL) {
             free(weights[j]);
         }
      }
      return false;
    }
    // Calculate the number of float values to read.
    uint32_t layerSize = (LayerTypes[iLayer] == CONV) ? 
                         (LayerShapes[iLayer][0] * LayerShapes[iLayer][1] * 3 * 3) : 
                         (LayerShapes[iLayer][0] * LayerShapes[iLayer][1]);
    
    // Allocate DMA-compatible memory temporarily to read the file.
    //float *dmaBuffer = (float*) accelDriver.AllocDMACompatible(layerSize * sizeof(float));
    float *dmaBuffer = (float*) accelDriver.AllocDMACompatible(uint32_t(layerSize * sizeof(float)));
    if (dmaBuffer == NULL) {
      printf("Error allocating %" PRIu32 " bytes to read file [%s]\n", (uint32_t)(layerSize * sizeof(float)), title);
      fclose(input);
      for (uint32_t j = 0; j < iLayer; j++) {
         if (weights[j] != NULL) {
             free(weights[j]);
         }
      }
      return false;
    }
    // Read the weight data into the DMA buffer.
    if (fread(dmaBuffer, sizeof(float), layerSize, input) != layerSize) {
      printf("Error reading %u values from file [%s]\n", layerSize, title);
      fclose(input);
      accelDriver.FreeDMACompatible(dmaBuffer);
      for (uint32_t j = 0; j < iLayer; j++) {
         if (weights[j] != NULL) {
             free(weights[j]);
         }
      }
      return false;
    }
    fclose(input);
    
    // Allocate standard memory to store the weights.
    weights[iLayer] = (float*) malloc(layerSize * sizeof(float));
    //weights[iLayer] = (float*) accelDriver.AllocDMACompatible(layerSize * sizeof(float));
    if (weights[iLayer] == NULL) {
      printf("Error allocating standard memory for weights layer %u\n", iLayer);
      accelDriver.FreeDMACompatible(dmaBuffer);
      for (uint32_t j = 0; j < iLayer; j++) {
         if (weights[j] != NULL) {
             free(weights[j]);
         }
      }
      return false;
    }
    // Copy the data from the DMA buffer to standard memory.
    memcpy(weights[iLayer], dmaBuffer, layerSize * sizeof(float));
    // Immediately free the DMA buffer.
    accelDriver.FreeDMACompatible(dmaBuffer);
  }
  printf("Exit loop\n");
  return true;
}


bool ConvertBiasesToFxP(const uint32_t numLayers, float ** floatBiases, TFXP ** fxpBiases, CAccelDriver &accelDriver)
{
  printf("\n");
  printf("============================================\n");
  printf("==============ConvertBiasesToFxP============\n");
  printf("============================================\n\n");
  
  float * pFloat;
  TFXP * pFxp;
  
  //CAccelDriver accelDriver;
  //if (accelDriver.Open(CONV2D_HW_ADDR, MAP_SIZE) != CAccelDriver::OK) {
  //  printf("Error opening hardware accelerator driver.\n");
  //  return -1;
  //}

  for (uint32_t iLayer = 0; iLayer < numLayers; ++ iLayer) {
    pFloat = floatBiases[iLayer];
    uint32_t layerSize = LayerShapes[iLayer][1];
    if ( (fxpBiases[iLayer] = (TFXP*)accelDriver.AllocDMACompatible(layerSize * sizeof(TFXP))) == NULL ) {
      printf("Error allocating %" PRIu32 " bytes for FxP biases in layer %u\n", (uint32_t)(layerSize*sizeof(TFXP)), iLayer);
      return false;
    }
    pFxp = fxpBiases[iLayer];
    for (uint32_t iFilter = 0; iFilter < LayerShapes[iLayer][1]; ++ iFilter) {
          *pFxp = Float2Fxp(*pFloat, DECIMALS);
          ++ pFxp;
          ++ pFloat;
    }
  }
  printf("fxpBiases = %u\n", **fxpBiases);

  //if (fxpBiases != NULL) {
  //  for (uint32_t iLayer = 0; iLayer < numLayers; ++iLayer) {
  //        if (fxpBiases[iLayer] != nullptr) {
  //            accelDriver.FreeDMACompatible(fxpBiases[iLayer]);
  //            fxpBiases[iLayer] = nullptr;
  //        }
  //  }
  //}


  return true;
}

bool LoadFloatBiases(const uint32_t numLayers, float ** biases, CAccelDriver &accelDriver)
{
  printf("\n");
  printf("============================================\n");
  printf("===============LoadFloatBiases==============\n");
  printf("============================================\n\n");
  
  FILE * input = NULL;
  
  
  for (uint32_t iLayer = 0; iLayer < numLayers; ++iLayer) {
    char title[256];
    snprintf(title, sizeof(title), "model/bias_%u.bin", iLayer);
    input = fopen(title, "rb");
    if (input == NULL) {
      printf("Error opening file [%s]\n", title);
      // Free any previously allocated biases.
      for (uint32_t j = 0; j < iLayer; j++) {
        if (biases[j] != NULL) {
          free(biases[j]);
        }
      }
      return false;
    }
    
    // One bias per output filter.
    uint32_t layerSize = LayerShapes[iLayer][1];
    
    // Allocate a temporary DMA-compatible buffer.
    float *dmaBuffer = (float*) accelDriver.AllocDMACompatible(layerSize * sizeof(float));
    if (dmaBuffer == NULL) {
      printf("Error allocating %" PRIu32 " bytes to read file [%s]\n", (uint32_t)(layerSize * sizeof(float)), title);
      fclose(input);
      for (uint32_t j = 0; j < iLayer; j++) {
        if (biases[j] != NULL) {
          free(biases[j]);
        }
      }
      return false;
    }
    
    // Read the bias data into the DMA buffer.
    if (fread(dmaBuffer, sizeof(float), layerSize, input) != layerSize) {
      printf("Error reading %u values from file [%s]\n", layerSize, title);
      fclose(input);
      accelDriver.FreeDMACompatible(dmaBuffer);
      for (uint32_t j = 0; j < iLayer; j++) {
        if (biases[j] != NULL) {
          free(biases[j]);
        }
      }
      return false;
    }
    fclose(input);
    
    // Allocate standard memory for the biases.
    biases[iLayer] = (float*) malloc(layerSize * sizeof(float));
    if (biases[iLayer] == NULL) {
      printf("Error allocating standard memory for biases layer %u\n", iLayer);
      accelDriver.FreeDMACompatible(dmaBuffer);
      for (uint32_t j = 0; j < iLayer; j++) {
        if (biases[j] != NULL) {
          free(biases[j]);
        }
      }
      return false;
    }
    
    // Copy data from the DMA buffer to standard memory.
    memcpy(biases[iLayer], dmaBuffer, layerSize * sizeof(float));
    // Immediately free the DMA buffer.
    accelDriver.FreeDMACompatible(dmaBuffer);
  }
  
  // No need to free the biases array here since each biases[iLayer] now points to standard memory.
  return true;
}


bool LoadModelInFxP(TFXP **fxpWeights, TFXP **fxpBiases, CAccelDriver &accelDriver)
{
  float *floatWeights[NUM_LAYERS];
  float *floatBiases[NUM_LAYERS];

  printf("\n============================================\n");
  printf("==============LoadModelInFxp================\n");
  printf("============================================\n\n");

  printf("Initializing null pointers...\n");
  for (uint32_t ii = 0; ii < NUM_LAYERS; ++ii) {
    fxpWeights[ii] = NULL;
    floatWeights[ii] = NULL;
    fxpBiases[ii] = NULL;
    floatBiases[ii] = NULL;
  }


  if (!LoadFloatWeights(NUM_LAYERS, floatWeights, accelDriver)) {
    printf("Error reading the float weights.\n");
    FreeParams(NUM_LAYERS, (void**)floatWeights);
    return false;
  }
  ConvertWeightsToFxP(NUM_LAYERS, floatWeights, fxpWeights, accelDriver);
  if (floatWeights != NULL) {
    FreeParams(NUM_LAYERS, (void**)floatWeights);
  }

  printf("Loading float biases...");
  if (!LoadFloatBiases(NUM_LAYERS, floatBiases, accelDriver)) {
    printf("Error reading the float biases.\n");
    FreeParams(NUM_LAYERS, (void**)floatBiases);
    FreeParams(NUM_LAYERS, (void**)fxpWeights);
    return false;
  }
  printf("load float biases output = %f\n", **floatBiases);
  printf("Done\n\n");
  printf("Converting biases...");
  ConvertBiasesToFxP(NUM_LAYERS, floatBiases, fxpBiases, accelDriver);
  printf("fxpBiases output = %u\n", **fxpBiases);
  printf("Done\n\n");
  if (floatBiases != NULL) {
    FreeParams(NUM_LAYERS, (void**)floatBiases);
  }

  printf("Exiting LoadModelInFxP\n\n");
  return true;
}


bool LoadImageInFxp(const char * fileName,
                    TFXP * inputImageFxp,
                    uint8_t * inputImageRGB,
                    uint32_t inputSize,
                    CAccelDriver &accelDriver)
{
    printf("\n");
    printf("============================================\n");
    printf("================LoadImageInFxp==============\n");
    printf("============================================\n\n");

    bool debug = 0;

    if (!inputImageFxp) {
        printf("Invalid inputImageFxp pointer.\n");
        return false;
    }

    // 2) Open and read the image
    FILE *inputImageFile = fopen(fileName, "rb");
    if (inputImageFile == NULL) {
        printf("Error opening image file [%s]\n\n", fileName);
        return false;
    }

    printf("Successfully opened input image.\n\n");


    if (fread(inputImageRGB, 1, inputSize, inputImageFile) != inputSize) {
        printf("Error reading %u bytes from [%s]\n", inputSize, fileName);
        fclose(inputImageFile);
        return false;
    }
    else {
        printf("Successfully read %u bytes from [%s]\n\n", inputSize, fileName);
    }
    fclose(inputImageFile);
    printf("Image file closed.\n\n");

    if (debug) {
      printf("First 50 positions of image in RGB: ");
      for (uint32_t ii = 0; ii < 50; ii++) {
        printf("%u", inputImageRGB[ii]);
      }
    }

    // Convert each pixel from [0..255] to float [0..1], then to fixed-point.
    for (uint32_t i = 0; i < inputSize; i++) {
        float normalized = (float)inputImageRGB[i] / 255.0f;
        inputImageFxp[i] = Float2Fxp(normalized, DECIMALS);
    }
    
    printf("Image converted to FxP.\n\n");

    return true;
}


TFXP Inference(TFXP * inputImageFxp,
               TFXP * buffer0,
               TFXP * buffer1,
               TFXP ** fxpWeights,
               TFXP ** fxpBiases,
               TTimes & times)
{
  printf("\n");
  printf("============================================\n");
  printf("==================Inference=================\n");
  printf("============================================\n\n");
  
  uint32_t iLayer, size;
  struct timespec start, end;
  CConv2DDriver convolver(true);
  bool debug = 1;
  
  if (convolver.Open(CONV2D_HW_ADDR, MAP_SIZE) != CAccelDriver::OK) {
    printf("Error opening hardware accelerator driver.\n");
    return -1;
  }

  buffer0 = (TFXP *)convolver.AllocDMACompatible(4129024 * sizeof(TFXP));
  buffer1 = (TFXP *)convolver.AllocDMACompatible(1032256 * sizeof(TFXP));
  
  if(debug) {
    printf("\n\nInitial Values\n");
    printf("inputImageFxp (first element) = %u\n", *inputImageFxp);
    printf("buffer0 (first element) = %u\n", *buffer0);
    printf("buffer1 (first element) = %u\n", *buffer1);
    printf("fxpWeights[0] (first element) = %u\n", *fxpWeights[0]);
    printf("fxpBiases[0] (first element) = %u\n", *fxpBiases[0]);
    printf("=============================\n");
  }

  uint32_t inc = 0;

  //=============================Size256=============================//

  iLayer = 0, size = 256;
  if (debug) {
    printf("Size = %u, Layer = %u\n", size, iLayer);
  }
  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  convolver.Conv2D_HW(inputImageFxp, buffer0, fxpWeights[iLayer],
                      LayerShapes[iLayer][1],
                      LayerShapes[iLayer][0],
                      size, size);
  size -= 2;
  if (debug) {
    printf("Conv2D %u: buffer0[0] = %u\n", inc, buffer0[0]);
    printf("Conv2D %u: buffer1[0] = %u\n", inc, buffer1[0]);
  }

  AddBiases(buffer0, fxpBiases[iLayer], LayerShapes[iLayer][1], size, size);
  if (debug) { 
    printf("AddBiases %u: buffer0[0] = %u\n", inc, buffer0[0]);
  }

  ReLU(buffer0, LayerShapes[iLayer][1], size, size);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeConv[iLayer] = CalcTimeDiff(end, start);
  if (debug) {
    printf("ReLU %u: buffer0[0] = %u\n", inc, buffer0[0]);
  }

  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  MaxPool(buffer0, buffer1, LayerShapes[iLayer][1], size, size);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeMaxPool[iLayer] = CalcTimeDiff(end, start);
  if (debug) {
    printf("MaxPool %u: buffer0[0] = %u\n", inc, buffer0[0]);
    printf("MaxPool %u: buffer1[0] = %u\n", inc, buffer1[0]);
    ++inc;
    printf("\n\n");
  }

  ++iLayer;

  //=============================Size127=============================//
  size = 127;
  if (debug) {
    printf("Size = %u, Layer = %u\n", size, iLayer);
  }

  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  convolver.Conv2D_HW(buffer1, buffer0,
                      fxpWeights[iLayer],
                      LayerShapes[iLayer][1],
                      LayerShapes[iLayer][0],
                      size, size);
  size -= 2;
  if (debug) {
    printf("Conv2D %u: buffer0[0] = %u\n", inc, buffer0[0]);
    printf("Conv2D %u: buffer1[0] = %u\n", inc, buffer1[0]);
  }

  AddBiases(buffer0, fxpBiases[iLayer], LayerShapes[iLayer][1], size, size);
  if (debug) {
    printf("AddBiases %u: buffer0[0] = %u\n", inc, buffer0[0]);
  }

  ReLU(buffer0, LayerShapes[iLayer][1], size, size);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeConv[iLayer] = CalcTimeDiff(end, start);
  if (debug) {
    printf("ReLU %u: buffer0[0] = %u\n", inc, buffer0[0]);
  }

  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  MaxPool(buffer0, buffer1, LayerShapes[iLayer][1], size, size);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeMaxPool[iLayer] = CalcTimeDiff(end, start);
  if (debug) {
    printf("MaxPool %u: buffer0[0] = %u\n", inc, buffer0[0]);
    printf("MaxPool %u: buffer1[0] = %u\n", inc, buffer1[0]);
    ++inc;
    printf("\n\n");
  }

  ++iLayer;

  //=============================Size62==============================//

  size = 62;
  if (debug) {
    printf("Size = %u, Layer = %u\n", size, iLayer);
  }

  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  convolver.Conv2D_HW(buffer1, buffer0,
                      fxpWeights[iLayer],
                      LayerShapes[iLayer][1],
                      LayerShapes[iLayer][0],
                      size, size);
  size -= 2;
  if (debug) {
    printf("Conv2D %u: buffer0[0] = %u\n", inc, buffer0[0]);
    printf("Conv2D %u: buffer1[0] = %u\n", inc, buffer1[0]);
  }

  AddBiases(buffer0, fxpBiases[iLayer], LayerShapes[iLayer][1], size, size);
  if (debug) {
    printf("AddBiases %u: buffer0[0] = %u\n", inc, buffer0[0]);
  }

  ReLU(buffer0, LayerShapes[iLayer][1], size, size);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeConv[iLayer] = CalcTimeDiff(end, start);
  if (debug) {
    printf("ReLU %u: buffer0[0] = %u\n", inc, buffer0[0]);
  }

  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  MaxPool(buffer0, buffer1, LayerShapes[iLayer][1], size, size);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeMaxPool[iLayer] = CalcTimeDiff(end, start);
  if (debug) {
    printf("MaxPool %u: buffer0[0] = %u\n", inc, buffer0[0]);
    printf("MaxPool %u: buffer1[0] = %u\n", inc, buffer1[0]);
    ++inc;
    printf("\n\n");
  }

  ++iLayer;

  //=============================Size30==============================//

  size = 30;
  if (debug) {
    printf("Size = %u, Layer = %u\n", size, iLayer);
  }

  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  convolver.Conv2D_HW(buffer1, buffer0,
                      fxpWeights[iLayer],
                      LayerShapes[iLayer][1],
                      LayerShapes[iLayer][0],
                      size, size);
  size -= 2;
  if(debug) {
    printf("Conv2D %u: buffer0[0] = %u\n", inc, buffer0[0]);
    printf("Conv2D %u: buffer1[0] = %u\n", inc, buffer1[0]);
  }

  AddBiases(buffer0, fxpBiases[iLayer], LayerShapes[iLayer][1], size, size);
  if(debug) {
      printf("AddBiases %u: buffer0[0] = %u\n", inc, buffer0[0]);
  }
  
  ReLU(buffer0, LayerShapes[iLayer][1], size, size);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeConv[iLayer] = CalcTimeDiff(end, start);
  if (debug) {
    printf("ReLU %u: buffer0[0] = %u\n", inc, buffer0[0]);
  }

  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  MaxPool(buffer0, buffer1, LayerShapes[iLayer][1], size, size);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeMaxPool[iLayer] = CalcTimeDiff(end, start);
  if(debug) {
    printf("MaxPool %u: buffer0[0] = %u\n", inc, buffer0[0]);
    printf("MaxPool %u: buffer1[0] = %u\n", inc, buffer1[0]);
    ++inc;
    printf("\n\n");
  }

  ++iLayer;

  //=============================Size14==============================//
  size = 14;

  if(debug) {
    printf("Size = %u, Layer = %u\n", size, iLayer);
  }  
  
  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  convolver.Conv2D_HW(buffer1, buffer0,
                      fxpWeights[iLayer],
                      LayerShapes[iLayer][1],
                      LayerShapes[iLayer][0],
                      size, size);
  size -= 2;
  if(debug) {
    printf("Conv2D %u: buffer0[0] = %u\n", inc, buffer0[0]);
    printf("Conv2D %u: buffer1[0] = %u\n", inc, buffer1[0]);
  }

  AddBiases(buffer0, fxpBiases[iLayer], LayerShapes[iLayer][1], size, size);
  if(debug) {
      printf("AddBiases %u: buffer0[0] = %u\n", inc, buffer0[0]);
  }

  ReLU(buffer0, LayerShapes[iLayer][1], size, size);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeConv[iLayer] = CalcTimeDiff(end, start);
  if (debug) {
    printf("ReLU %u: buffer0[0] = %u\n", inc, buffer0[0]);
  }

  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  MaxPool(buffer0, buffer1, LayerShapes[iLayer][1], size, size);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeMaxPool[iLayer] = CalcTimeDiff(end, start);
  if(debug) {
    printf("MaxPool %u: buffer0[0] = %u\n", inc, buffer0[0]);
    printf("MaxPool %u: buffer1[0] = %u\n", inc, buffer1[0]);
    ++inc;
    printf("\n\n");
  }

  //=============================Size6==============================//
  uint32_t incf = 0;
  uint32_t incd = 0;

  size = 6;
  if(debug) {
    printf("Size = %u, Layer = %u\n", size, iLayer);
    printf("Beginning operations Flatten, Dense, and Sigmoid\n\n");
  }  

  // Flatten the output for the next dense layer: [row, col, filter]
  // From [64, 6, 6] to [2304]
  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  Flatten(buffer1, buffer0, LayerShapes[iLayer][1], size, size);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeFlatten = CalcTimeDiff(end, start);
  if (debug) {
    printf("Flatten %u: buffer0[0] = %u\n", incf, buffer0[0]);
    ++ incf;
    printf("\n\n");
  }

  ++iLayer;
  //------------Layer Increase ---------//
  if(debug) {
    printf("Size = %u, Layer = %u\n", size, iLayer);
  }

  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  Dense(buffer0, buffer1, LayerShapes[iLayer][0], LayerShapes[iLayer][1],
        fxpWeights[iLayer], fxpBiases[iLayer]);
  ReLU(buffer1, 1, LayerShapes[iLayer][1], 1);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeDense[iLayer] = CalcTimeDiff(end, start);
  if (debug) {
    printf("Dense %u: buffer0[0] = %u\n", incd, buffer0[0]);
    printf("Dense %u: buffer1[0] = %u\n", incd, buffer1[0]);
    ++ incd;
    printf("ReLU %u: buffer1[0] = %u\n\n", inc, buffer0[0]);
    ++ inc;
    printf("\n\n");
  }

  ++iLayer;
//------------Layer Increase ---------//

  if(debug) {
    printf("Size = %u, Layer = %u\n", size, iLayer);
  }

  // Output is now an array of 512 values. Goes to the final fully-connected layer.
  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  Dense(buffer1, buffer0, LayerShapes[iLayer][0], LayerShapes[iLayer][1],
        fxpWeights[iLayer], fxpBiases[iLayer]);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeDense[iLayer] = CalcTimeDiff(end, start);
  if (debug) {
      printf("Dense %u: buffer0[0] = %u\n", incd, buffer0[0]);
      printf("Dense %u: buffer1[0] = %u\n", incd, buffer1[0]);
      ++ incd;
  }

  clock_gettime(CLOCK_MONOTONIC_RAW, &start);
  Sigmoid(buffer0, 1);
  clock_gettime(CLOCK_MONOTONIC_RAW, &end);
  times.timeSigmoid = CalcTimeDiff(end, start);
  if (debug) {
    printf("Sigmoid buffer0[0] = %u\n\n", buffer0[0]);
    printf("\n\n");
  }

  if (buffer1 != NULL)
	  convolver.FreeDMACompatible(buffer1);
  
  return buffer0[0];
}


//uint64_t CalcTimeDiff(const struct timespec & time2, const struct timespec & time1)
//{
//  return time2.tv_sec == time1.tv_sec ?
//    time2.tv_nsec - time1.tv_nsec :
 //   (time2.tv_sec - time1.tv_sec - 1) * 1e9 + (1e9 - time1.tv_nsec) + time2.tv_nsec;
//}




