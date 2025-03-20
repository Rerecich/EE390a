// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xadder.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XAdder_CfgInitialize(XAdder *InstancePtr, XAdder_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XAdder_Set_a(XAdder *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdder_WriteReg(InstancePtr->Control_BaseAddress, XADDER_CONTROL_ADDR_A_DATA, Data);
}

u32 XAdder_Get_a(XAdder *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdder_ReadReg(InstancePtr->Control_BaseAddress, XADDER_CONTROL_ADDR_A_DATA);
    return Data;
}

void XAdder_Set_b(XAdder *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XAdder_WriteReg(InstancePtr->Control_BaseAddress, XADDER_CONTROL_ADDR_B_DATA, Data);
}

u32 XAdder_Get_b(XAdder *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdder_ReadReg(InstancePtr->Control_BaseAddress, XADDER_CONTROL_ADDR_B_DATA);
    return Data;
}

u32 XAdder_Get_res(XAdder *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdder_ReadReg(InstancePtr->Control_BaseAddress, XADDER_CONTROL_ADDR_RES_DATA);
    return Data;
}

u32 XAdder_Get_res_vld(XAdder *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XAdder_ReadReg(InstancePtr->Control_BaseAddress, XADDER_CONTROL_ADDR_RES_CTRL);
    return Data & 0x1;
}

