#!/bin/bash
echo
echo FSX config monitor
echo -------------------------------------------------------------------

DATADIR="_FSXGIT/data"

if [ ! -f "fsx.exe" ]
then
	echo "fsx.exe not found. you must run this in the main FSX folder!"
	exit
fi

echo copying main FSX config/scenery files...
cp /cygdrive/c/ProgramData/Microsoft/FSX/Scenery.cfg "$DATADIR/programdata/"
cp "$APPDATA/microsoft/FSX/dll.xml" "$DATADIR/appdata/"
cp "$APPDATA/microsoft/FSX/fsx.cfg" "$DATADIR/appdata/"

echo
echo running file listings/comparisons...

find ./ -mtime -1 | grep -v "git" > "$DATADIR/mtime-1.txt"

find ./ -maxdepth 1  > "$DATADIR/ls-root.txt"
find ./Addon\ Modules/  > "$DATADIR/addon-modules.txt"
find ./Effects/  > "$DATADIR/ls-effects.txt"
find ./Gauges/ -name "*.gau" > "$DATADIR/ls-gauges.txt"
find ./modules/  > "$DATADIR/ls-modules.txt"
find ./scenery/World/Scenery/ -type f > "$DATADIR/ls-sceneryworld.txt"
find ./Sound/  > "$DATADIR/ls-sound.txt"
find ./Texture/  > "$DATADIR/ls-texture.txt"
find ./Addon\ Scenery/ -type d > "$DATADIR/ls-addonscenery.txt"
find ./SimObjects/Rotorcraft/ -name "aircraft.cfg" > "$DATADIR/ls-rotorcraft-cfg.txt"
find ./SimObjects/Misc/ -name "aircraft.cfg" > "$DATADIR/ls-misc-cfg.txt"
find ./SimObjects/Airplanes/ -name "aircraft.cfg" > "$DATADIR/ls-aircraft-cfg.txt"
find ./ -name "*.cfg" > "$DATADIR/ls-config.txt"

echo
echo archiving files/reports...
DISPLAYDATE=`date +%Y-%m-%d`
tar -czf "_FSXGIT/bkups/backup-$DISPLAYDATE.tar.gz" _FSXGIT/data/

echo
echo -------------------------------------------------------------------

echo done