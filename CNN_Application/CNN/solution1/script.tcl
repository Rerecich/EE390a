############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
############################################################
open_project CNN
add_files ../Conv2D_HW_InitVersion_Examples/Conv2D_HW_InitVersion_Students/SW_TEST_CONV2D_ONLY_SW/util.cpp
add_files ../Conv2D_HW_InitVersion_Examples/Conv2D_HW_InitVersion_Students/SW_TEST_CONV2D_ONLY_SW/util.hpp
add_files -tb ../Conv2D_HW_InitVersion_Examples/Conv2D_HW_InitVersion_Students/HLS/conv2DTestbench.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg400-1}
create_clock -period 10 -name default
#source "./CNN/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
