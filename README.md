# CNN Accelerator: Dog vs Cat Classifier (Pynq Platform)

This repository contains the code and documentation for a CNN-based HW/SW co-design project that classifies images of dogs and cats on a Xilinx Pynq platform. **Exercise 03** introduces the core CNN application and a basic hardware accelerator, while **Exercise 04 (the Midterm)** expands on that design with performance optimizations.

## Overview

- **Goal**: Reduce inference time for a CNN (originally ~28 seconds in software) by offloading key computations (especially the convolutional layers) to hardware accelerators.
- **CNN Structure**: Five convolutional layers (each followed by pooling), two fully connected layers, and a final sigmoid output.
- **Data & Model**:
  - Model parameters (weights, biases) are provided in fixed-point (FxP) format (or converted to it) at runtime.
  - Input images are 256×256, planar RGB, normalized to [0,1].

## Exercises

### Exercise 03
- Implements a first version of the convolution accelerator in HLS.
- Integrates it with the existing C++ CNN code (`cnn.h`, `cnn.cpp`, `model.h`, `model.cpp`, etc.).
- Demonstrates basic HW/SW integration on the Pynq platform.

### Exercise 04 (Midterm)
- Builds on Exercise 03’s baseline accelerator to significantly improve performance.
- Optimizes the accelerator through:
  - **Caching Filter Coefficients**: Load convolution filters once per output filter.
  - **Caching Input Rows**: Store pixel rows in buffers to reduce redundant memory accesses.
  - **Parallelizing Output Filters**: Compute multiple output feature maps in parallel.
  - *Optional*: Reuse cached rows and overlap data transfers with computation for further speedup.
- Compares resource usage (LUTs, FFs, BRAMs, DSPs) and timing across different optimization levels.

## Repository Structure
- `Full_Model/` Main CNN source and inference logic
  - `CNN/` Honestly not sure, looks like a Vitis project
  - `images/` Test images in planar format
  - `model/` CNN model parameters (weights, biases) in floating point (converted to FxP for accelerator use).
- `HLS/` Hardware accelerator (convolution accelerator, testbench)
- `IP-catalog/` IP cores exported from Vitis HLS code (need to confirm which one is accurate)
- `project_1/` Vivado project files
- `Conv2D_SW_Test/` Testbench for 2D convolution (no hardware implementation, mainly for reference)
- `SW/` Software driver code (CAccelDriver, CConv2DDriver, testbench for hardware implementation of Conv2D_HW driver)
- `Vitis_CNN_HLS` Vitis project files 
