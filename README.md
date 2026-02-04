# DWG Batch Transform

A lightweight automation tool to move and rotate AutoCAD (`.dwg`) files from large map coordinates to a local origin (0,0,0) using **AutoCAD Core Console**.

## Features
- **Batch Processing:** Processes an entire folder of DWGs in seconds.
- **Unit Awareness:** Automatically detects if the drawing is in Millimeters or Meters and scales the translation vector accordingly.
- **Large Coordinate Support:** Handles coordinate values in the billions (avoids LISP scientific notation errors).
- **Headless Execution:** Runs in the background without opening the AutoCAD GUI.

## Usage
1. Configure your map coordinates (`mapX`, `mapY`) in `transform_coordinates.scr`.
2. Check the `accoreconsole.exe` path in `run_batch.bat`.
3. Place both files in the folder with your DWGs.
4. Run `run_batch.bat`.
