#ifndef CCONV2D_HPP
#define CCONV2D_HPP

class CConv2DDriver : public CAccelDriver {
  protected:
    // Structure that mimics the layout of the peripheral registers.
    // Vitis HLS skips some addresses in the register file. We introduce
    // padding fields to create the right mapping to registers with our structure,
    /** @todo */
    struct TRegs {
      uint32_t control; // 0x00
      uint32_t gier, ier, isr; // 0x04, 0x08, 0x0C
      uint32_t input; // 0x10
      uint32_t padding0; // 0x14
      uint32_t padding0_r; // 0x18
      uint32_t output; // 0x1C
      uint32_t padding1; // 0x20
      uint32_t padding2_r; // 0x24

      uint32_t coeffs; // 0x28
      uint32_t padding3; // 0x2C
      uint32_t padding3_r; // 0x30
      uint32_t biases; // 0x34
      uint32_t paddingb; // 0x38
      uint32_t paddingb_r; // 0x3c
      uint32_t numChannels; // 0x40
      uint32_t padding4_r; // 0x44
      uint32_t numFilters; // 0x48
      uint32_t padding5_r; // 0x4c
      uint32_t inputWidth; // 0x50
      uint32_t padding6_r; // 0x54
      uint32_t inputHeight; // 0x58
      uint32_t padding7_r; // 0x5c
      uint32_t convWidth; // 0x60
      uint32_t padding8_r; // 0x64
      uint32_t convHeight; // 0x68
      uint32_t padding9_r; // 0x6c
      uint32_t apply_relu; // 0x70
      uint32_t padding10_r; //0x74
    };

  public:
    CConv2DDriver(bool Logging = false)
      : CAccelDriver(Logging) {}

    ~CConv2DDriver() {}

    uint32_t Conv2D_HW(void *input, void * output, void * coeffs, void * biases,
      uint32_t numChannels, uint32_t numFilters,
      uint32_t inputWidth, uint32_t inputHeight,
      uint32_t convWidth = 3, uint32_t convHeight = 3, uint32_t apply_relu = 1);
};

#endif  // CCONV2D_HPP

