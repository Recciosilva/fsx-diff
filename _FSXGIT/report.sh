echo starting...
DATADIR="_FSXGIT/data"
find ./Effects/  > "$DATADIR/ls-effects.txt"
find ./ -maxdepth 1  > "$DATADIR/ls-root.txt"
find ./ -name "*.cfg" > "$DATADIR/ls-config.txt"
find ./SimObjects/Airplanes/ -name "aircraft.cfg" > "$DATADIR/ls-aircraft-cfg.txt"
find ./Gauges/ -name "*.gau" > "$DATADIR/ls-gauges.txt"
find ./modules/  > "$DATADIR/ls-modules.txt"
find ./Addon\ Scenery/ -type d > "$DATADIR/ls-addonscenery.txt"
find ./scenery/World/Scenery/ -type f > "$DATADIR/ls-sceneryworld.txt"
find ./SimObjects/Rotorcraft/ -name "aircraft.cfg" > "$DATADIR/ls-rotorcraft-cfg.txt"
find ./SimObjects/Misc/ -name "aircraft.cfg" > "$DATADIR/ls-misc-cfg.txt"
find ./Sound/  > "$DATADIR/ls-sound.txt"
find ./Texture/  > "$DATADIR/ls-texture.txt"
DISPLAYDATE=`date +%Y-%m-%d`
tar -czf "_FSXGIT/bkups/backup-$DISPLAYDATE.tar.gz" _FSXGIT/data/
echo done