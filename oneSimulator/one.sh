#! /bin/sh
java -Xmx4G -Djava.util.logging.config.file=/Users/stevenjacobs/asterix/data_generator/oneSimulator/logging.properties -cp target:lib/ECLA.jar:lib/DTNConsoleConnection.jar core.DTNSim $*
