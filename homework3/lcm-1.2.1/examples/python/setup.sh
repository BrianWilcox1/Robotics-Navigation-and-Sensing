#!/bin/bash

./cleanup.sh
./gen-types.sh
python gpgga-driver.py &
lcm-spy & 
lcm-logger -s data/gpgga-sline 


