# Firmware

[Printer Information](./../README.md#printer)  

## Build

We have to build fancy Open Source firmware. :)

[Really helpful guide that I stole from](https://3dprinting.stackexchange.com/a/19618)

1. Download the latest [Marlin](https://marlinfw.org/) (or [Github](https://github.com/MarlinFirmware/Marlin) releases) firmware.
2. Obtain the example configuration from [Github](https://github.com/MarlinFirmware/Configurations). Download all files in the directory.
	- Path: `/config/examples/Creality/Ender-3/CrealityV422`
3. Copy the configuration files (step 2) to the `Marlin` folder (step 1).
4. Use [Visual Studio Code](https://code.visualstudio.com/) with the [Auto Build Marlin](https://marlinfw.org/docs/basics/auto_build_marlin.html) extension.
5. Update the `Configuration.h` file from step 2 with the following:
	- **Comment** out the `Z_MIN_PROBE_USES_Z_MIN_ENDSTOP_PIN` setting, because BLTouch is using a different pin.
	- **Uncomment** `USE_PROBE_FOR_Z_HOMING` so we don't lose the Z Homing.
	- **Uncomment** `Z_MIN_PROBE_PIN` and set it to `PB1`. This is the BLTouch connection point.
	- **Uncomment** `BLTOUCH` to enable BLTouch.
	- **Uncomment** `AUTO_BED_LEVELING_UBL` and `ENABLE_LEVELING_AFTER_G28` to enable auto bed leveling.
	- **Uncomment** `Z_SAFE_HOMING`.
	- **Uncomment** `LCD_BED_LEVELING`.
	- **Uncomment** `PREHEAT_BEFORE_LEVELING`.
	- **Uncomment** `INDIVIDUAL_AXIS_HOMING_MENU`.
	- **Adjust** `NOZZLE_TO_PROBE_OFFSET` to account for the position the BLTouch mounts in. The standard bracket should match close the values below. Notice the Z value isn't set at all. This should be done on the printer.
	- 
		```c++
		// #define Z_MIN_PROBE_USES_Z_MIN_ENDSTOP_PIN
		#define USE_PROBE_FOR_Z_HOMING
		#define Z_MIN_PROBE_PIN PB1
		#define BLTOUCH
		#define AUTO_BED_LEVELING_UBL
		#define ENABLE_LEVELING_AFTER_G28
		#define Z_SAFE_HOMING
		#define LCD_BED_LEVELING
		#define PREHEAT_BEFORE_LEVELING
		#define INDIVIDUAL_AXIS_HOMING_MENU
		#define NOZZLE_TO_PROBE_OFFSET { -44, -9, 0}
		```
6. Update the `Configuration_adv.h` file with the following:
	- **Uncomment** `PROBE_OFFSET_WIZARD`.
	- 
		```c++
			#define PROBE_OFFSET_WIZARD
		```
7. Open the `Auto Marlin Build` extension.
8. Click `Show ABM Panel`.
9. Build the **first** environment (`STM32F103RE_creality (512K)`).
10. Copy the resulting firmware file to the root of the SD card. While the printer is off, insert the SD card. Upon power on you should see your new Marlin Firmware start up. 
11. Configuring your BLTouch for auto bed leveling.