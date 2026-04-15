# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "D:\\Vivado\\KRIA_bldc_test\\vitis_workspace\\kd240_platform\\psu_cortexa53_0\\standalone_psu_cortexa53_0\\bsp\\include\\sleep.h"
  "D:\\Vivado\\KRIA_bldc_test\\vitis_workspace\\kd240_platform\\psu_cortexa53_0\\standalone_psu_cortexa53_0\\bsp\\include\\xiltimer.h"
  "D:\\Vivado\\KRIA_bldc_test\\vitis_workspace\\kd240_platform\\psu_cortexa53_0\\standalone_psu_cortexa53_0\\bsp\\include\\xtimer_config.h"
  "D:\\Vivado\\KRIA_bldc_test\\vitis_workspace\\kd240_platform\\psu_cortexa53_0\\standalone_psu_cortexa53_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
