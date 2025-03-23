############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Vitis_CNN_HW
add_files SW_TEST_CONV2D_SW_AND_HW/CAccelDriver.cpp
add_files SW_TEST_CONV2D_SW_AND_HW/CAccelDriver.hpp
add_files SW_TEST_CONV2D_SW_AND_HW/CConv2DDriver.cpp
add_files SW_TEST_CONV2D_SW_AND_HW/CConv2DDriver.hpp
add_files SW_TEST_CONV2D_SW_AND_HW/util.cpp
add_files SW_TEST_CONV2D_SW_AND_HW/util.hpp
add_files -tb SW_TEST_CONV2D_SW_AND_HW/conv2DTestbench.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg400-1}
create_clock -period 10 -name default
#source "./Vitis_CNN_HW/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
