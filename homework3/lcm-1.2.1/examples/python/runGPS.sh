#!/bin/bash

sudo python gpgga-driver.py &
sudo ./../lcm-spy/buildjar.sh 
./../lcm-spy/runspy.sh 
lcm-logger -s data/gpgga-tenminutes 


