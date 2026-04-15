# 2026-02-19T16:54:43.997572100
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis_workspace")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "kd240_platform",hw_design = "$COMPONENT_LOCATION/../../k24_kd240_design_wrapper.xsa",os = "standalone",cpu = "psu_cortexa53_0",domain_name = "standalone_psu_cortexa53_0",generate_dtb = False,advanced_options = advanced_options,architecture = "64-bit",compiler = "gcc")

platform = client.get_component(name="kd240_platform")
status = platform.build()

comp = client.create_app_component(name="hello_bldc",platform = "$COMPONENT_LOCATION/../kd240_platform/export/kd240_platform/kd240_platform.xpfm",domain = "standalone_psu_cortexa53_0",template = "hello_world")

status = platform.build()

comp = client.get_component(name="hello_bldc")
comp.build()

