#!/bin/bash

./cleanup.sh
./gen-types.sh
sudo python gpgga-driver.py &
sudo ./../lcm-spy/buildjar.sh 
sudo ./../lcm-spy/runspy.sh &
lcm-logger -s data/gpgga-%F-%T &


