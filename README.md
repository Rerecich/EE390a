# EE-390a CNN Hardware Acceleration Project – Final Submission

## Overview

This project contains the full hardware/software co-design flow for a Convolutional Neural Network (CNN) application, implemented across multiple development stages. Each stage incrementally improves the design and is organized into its own folder for clarity.

## Directory Structure

The root directory is organized as follows:

```
Midterm/
├── 0-InitialHW/
├── 1-AddBiasReLU/
├── 2-CacheFilterCoeffs/
├── 3-CacheRows/
├── 4-Parallelization/
├── Conv2D_SW_Test/
├── Functional_Bitstreams/
├── LegacyFiles/
├── Reports/
├── extractBitstream.sh
└── Midterm_Report.pdf
```

Each numbered folder (`0-InitialHW` to `4-Parallelization`) corresponds to a specific stage in the development of the CNN accelerator. These folders contain:

```
[Stage]/
├── CNN_Application/       # Full software-hardware integrated application
├── HLS/                   # High-Level Synthesis sources and configuration
├── IP-catalog/            # Exported IPs for reuse in Vivado/Vitis
├── SW/                    # Software interfaces
├── build_HLS_project.sh   # Script to generate the HLS project
├── build_Vivado_project.sh# Script to build the Vivado project
├── script.tcl             # General Vitis automation script
├── directives.tcl         # HLS optimization directives
└── Vivado_[Stage].tcl     # Vivado project generation script for this stage
```

## Other Folders

- **Conv2D_SW_Test/**: Contains test benches and reference C++ code for software validation of the convolutional layers.
- **Functional_Bitstreams/**: Stores functional bitstreams produced during development.
- **LegacyFiles/**: Backup of older or unused versions.
- **Reports/**: Design and performance evaluation documents used during development.
- **extractBitstream.sh**: Common utility to extract `.bit` files for deployment.
- **Midterm_Report.pdf**: Final design report detailing methodology, results, and conclusions.



Each step folder is self-contained and can be explored or executed independently to reproduce or test the design at that stage.
