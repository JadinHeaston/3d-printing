# 3D Printing

## Other Documents

- [Firmware](./firmware/README.md)

## Folder Structure

- All file names are lowercase.
- Underscores (`_`) are used to replace spaces.
- Organizational folders are prefixed with an underscore (`_`).

**NOTE:** The Ender 3 Pro looks for `.bin` (or `.BIN`) files/*folders* in the root and will attempt to update the firmware using them.

### Copying Script

The [printer_export.sh](./printer_export.sh) file can be used to copy the prints folder to an external drive (micro SD card).  
I recommend using Git Bash. :)

**NOTE:** Git Bash seems to automatically create a `$RECYCLE.BIN` file when deleting files. A check was added to delete this.

**NOTE:** The destination folder will be **WIPED** before the copying occurs. **Be careful!!!**

- The first argument is a source folder, and the second is the destination.
- The folder structure is maintained.
- Only the `.gcode` files are copied over.

Example command (assuming the removable media is the `D:\` drive):

```sh
sh printer_export.sh prints /d/
```

## Printer

[Ender 3 Pro](https://www.creality.com/products/ender-3-pro-3d-printer) with [BL Touch](https://www.creality3dofficial.com/products/creality-bl-touch) for bed-leveling.  
Board V4.2.2
Current Firmware: `Marlin 2.1.2.2`