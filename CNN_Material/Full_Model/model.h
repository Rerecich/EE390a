#ifndef MODEL_H
#define MODEL_H
#include "CAccelDriver.hpp" 
#include "CConv2DDriver.hpp"

const uint32_t DECIMALS = 20;
typedef int32_t TFXP;     // Parameters and activations
typedef int64_t TFXP_MULT;// Intermmediate results of multiplications
typedef int32_t TFXP_ACC; // Convolution accumulators

const uint32_t NUM_LAYERS = 7; // 5 conv + 2 dense
const uint32_t LayerShapes[NUM_LAYERS][2] = { // [[input_size, output_size], ... ]
  {3, 32}, {32, 64}, {64, 128}, {128, 256}, {256, 64},
  {2304, 512}, {512, 1}
};
typedef enum {CONV = 0, DENSE = 1} TLayerType;
const TLayerType LayerTypes[NUM_LAYERS] = {
  CONV, CONV, CONV, CONV, CONV, DENSE, DENSE
};

struct TTimes {
  uint64_t timeConv[NUM_LAYERS];
  uint64_t timeMaxPool[NUM_LAYERS];
  uint64_t timeDense[NUM_LAYERS];
  uint64_t timeFlatten;
  uint64_t timeSigmoid;
};

uint64_t CalcTimeDiff(const struct timespec & time2, const struct timespec & time1);

bool LoadFloatWeights(const uint32_t numLayers, float ** weights, CAccelDriver &accelDriver);
bool ConvertWeightsToFxP(const uint32_t numLayers, float ** floatWeights, TFXP ** fxpWeights, CAccelDriver &accelDriver);
bool LoadFloatBiases(const uint32_t numLayers, float ** biases, CAccelDriver &accelDriver);
bool ConvertBiasesToFxP(const uint32_t numLayers, float ** floatBiases, TFXP ** fxpBiases, CAccelDriver &accelDriver);
void FreeParams(const uint32_t numLayers, void ** params);
void FreeParamsHW(uint32_t numLayers, void **params, CAccelDriver &accelDriver);

bool LoadModelInFxP(TFXP ** fxpWeights, TFXP ** fxpBiases, CAccelDriver &accelDriver);
bool LoadImageInFxp(const char * fileName, TFXP * inputImageFxp, uint8_t * inputImageRGB, uint32_t inputSize, CAccelDriver &accelDriver);
TFXP Inference(TFXP * inputImageFxp, TFXP * buffer0, TFXP * buffer1, TFXP ** fxpWeights, TFXP ** fxpBiases, TTimes & times);

inline TFXP Float2Fxp(float value, uint32_t decimalBits = DECIMALS)
{
  //return value;
  return ((value) * (float)(1 << (decimalBits)));
}

inline float Fxp2Float(TFXP value, uint32_t decimalBits = DECIMALS)
{
  //return value;
  return ((value) / (float)(1 << (decimalBits)));
}

inline TFXP FXP_Mult(TFXP a, TFXP b, uint32_t decimalBits = DECIMALS)
{
  //return a*b;
  TFXP_MULT res = (TFXP_MULT)a * (TFXP_MULT)b;
  res = res >> decimalBits;
  return res;
}

#endif

