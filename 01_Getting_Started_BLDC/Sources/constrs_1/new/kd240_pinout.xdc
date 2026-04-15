####################################################################################################
##################################### Motor Phase Gate Drivers #####################################
####################################################################################################
## HDA05 - Bank  26 VCCO - VCCO_HDA - IO_L2N_AD10N_26
set_property PACKAGE_PIN G9 [get_ports {motor_en[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {motor_en[0]}]

## HDA04 - Bank  26 VCCO - VCCO_HDA - IO_L2P_AD10P_26
set_property PACKAGE_PIN G10      [get_ports phaseC_0];
set_property IOSTANDARD  LVCMOS33 [get_ports phaseC_0];

## HDA03 - Bank  26 VCCO - VCCO_HDA - IO_L1N_AD11N_26
set_property PACKAGE_PIN H9       [get_ports phaseB_0];
set_property IOSTANDARD  LVCMOS33 [get_ports phaseB_0];

## HDA02 - Bank  26 VCCO - VCCO_HDA - IO_L1P_AD11P_26
set_property PACKAGE_PIN H10      [get_ports phaseA_0];
set_property IOSTANDARD  LVCMOS33 [get_ports phaseA_0];

####################################################################################################
####################################### Hall Sensor Inputs #########################################
####################################################################################################
## HDA11 - Bank  26 VCCO - VCCO_HDA - IO_L4N_AD8N_26
set_property PACKAGE_PIN E9       [get_ports hallA_0];
set_property IOSTANDARD  LVCMOS33 [get_ports hallA_0];

## HDA12 - Bank  26 VCCO - VCCO_HDA - IO_L7P_HDGC_AD5P_26
set_property PACKAGE_PIN F13      [get_ports hallB_0];
set_property IOSTANDARD  LVCMOS33 [get_ports hallB_0];

## HDA13 - Bank  26 VCCO - VCCO_HDA - IO_L7N_HDGC_AD5N_26
set_property PACKAGE_PIN E12      [get_ports hallC_0];
set_property IOSTANDARD  LVCMOS33 [get_ports hallC_0];


