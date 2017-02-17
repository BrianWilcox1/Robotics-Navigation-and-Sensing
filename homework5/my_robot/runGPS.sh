#!/bin/bash
./gen_types.sh

export CLASSPATH=$PWD/exlcm

lcm-logger -s data/gpgga-tenminutes & 
lcm-spy & 
python gpgga-driver.py 

kill %1 %2
