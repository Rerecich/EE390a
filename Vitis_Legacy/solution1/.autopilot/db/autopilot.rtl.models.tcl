set SynModuleInfo {
  {SRCNAME Conv2D_HW_Pipeline_VITIS_LOOP_37_4_VITIS_LOOP_38_5_VITIS_LOOP_39_6 MODELNAME Conv2D_HW_Pipeline_VITIS_LOOP_37_4_VITIS_LOOP_38_5_VITIS_LOOP_39_6 RTLNAME Conv2D_HW_Conv2D_HW_Pipeline_VITIS_LOOP_37_4_VITIS_LOOP_38_5_VITIS_LOOP_39_6
    SUBMODULES {
      {MODELNAME Conv2D_HW_mul_62s_62s_62_5_1 RTLNAME Conv2D_HW_mul_62s_62s_62_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME Conv2D_HW_mul_32ns_32ns_62_2_1 RTLNAME Conv2D_HW_mul_32ns_32ns_62_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME Conv2D_HW_mul_62s_32ns_62_5_1 RTLNAME Conv2D_HW_mul_62s_32ns_62_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME Conv2D_HW_mul_32s_32s_52_2_1 RTLNAME Conv2D_HW_mul_32s_32s_52_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME Conv2D_HW_flow_control_loop_pipe_sequential_init RTLNAME Conv2D_HW_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME Conv2D_HW_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME Conv2D_HW MODELNAME Conv2D_HW RTLNAME Conv2D_HW IS_TOP 1
    SUBMODULES {
      {MODELNAME Conv2D_HW_mul_32ns_32ns_64_2_1 RTLNAME Conv2D_HW_mul_32ns_32ns_64_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME Conv2D_HW_mul_32ns_64ns_96_5_1 RTLNAME Conv2D_HW_mul_32ns_64ns_96_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME Conv2D_HW_mul_32ns_33ns_65_2_1 RTLNAME Conv2D_HW_mul_32ns_33ns_65_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME Conv2D_HW_mul_32ns_33s_64_2_1 RTLNAME Conv2D_HW_mul_32ns_33s_64_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME Conv2D_HW_mul_64s_35s_64_5_1 RTLNAME Conv2D_HW_mul_64s_35s_64_5_1 BINDTYPE op TYPE mul IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME Conv2D_HW_gmem_m_axi RTLNAME Conv2D_HW_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME Conv2D_HW_control_s_axi RTLNAME Conv2D_HW_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
