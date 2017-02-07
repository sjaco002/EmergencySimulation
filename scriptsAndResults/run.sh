#! /bin/sh
./generatedata.sh
python ./convertToADM.py
python runAsterixCommands.sh
