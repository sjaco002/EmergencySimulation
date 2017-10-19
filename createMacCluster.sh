#!/bin/bash
cd ~/asterix/data_generator
rm -rf asterix-mgmt
mkdir asterix-mgmt
cd asterix-mgmt
unzip ~/asterix/asertixdb/asterixdb/asterix-installer/target/asterix-installer-0.9.3-SNAPSHOT-binary-assembly.zip
rm conf/asterix-configuration.xml
cp ../asterix-configuration.xml conf/
./bin/managix create -n local -c clusters/local/local.xml
cd ~/asterix/data_generator/scriptsAndResults
