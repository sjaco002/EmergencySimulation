#! /bin/sh
./generatedata.sh
python ./convertToADM.py
runAsterixCommands.sh
