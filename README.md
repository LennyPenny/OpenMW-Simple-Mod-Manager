# OpenMW Simple Mod Manager
Simple mod manager for OpenMW + Helper script to merge leveled lists

This automatically adds all folders from `C:\Users\[username]\Documents\My Games\OpenMW\mods` to your `openmw.cfg`. 

## Leveled list merger Helper
Also included is a helper script to help you merge your leveled lists

To use it you must first create a folder named `fakemw` in your `My Games\OpenMW` directory and then place tes3cmd.exe within it.
Also create a folder called `Data Files` within that directory.
Then simply run the merger script, which will place symlinks into the new fakemw directory
Now you can simply run `tes3cmd multipatch` in the `fakemw` directory to create your `multipatch.esp` which you can then copy out of `fakemw\Data Files` and put into your mod folder

## Installation

Go to the release section and download the `OpenMW-smm.zip`, then simply put all the .exe and .dll files into your `C:\Users\[username]\Documents\My Games\OpenMW` directory.
