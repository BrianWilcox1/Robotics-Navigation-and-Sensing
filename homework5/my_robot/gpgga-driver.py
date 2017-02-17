import lcm
import time
import serial
import utm
import sys
from exlcm import gpgga_data

lc = lcm.LCM()
serStr = str(sys.argv[1])
print(serStr)
ser = serial.Serial(serStr, 4800, timeout=1)

initial = time.time()
elapsed = 0
while elapsed < 75:
	raw = ser.readline()
	line=raw.split(',')
	if line[0] == "$GPGGA":
		#print(raw)
		msg = gpgga_data()
        	msg.timestamp = float(line[1])
        	msg.latitude = float(line[2])
		utm_lat = float(int(msg.latitude/100)+ (msg.latitude % 100)/60)
        	msg.direction1 = line[3]
		if line[3] == "S":
			utm_lat = utm_lat * -1
        	msg.longitude = float(line[4])
		utm_long = float(int(msg.longitude/100)+ (msg.longitude % 100)/60)
		msg.direction2 = line[5]
		if line[5] == "W":
			utm_long = utm_long * -1
		msg.altitude = float(line[9])
		u = utm.from_latlon(utm_lat, utm_long)
                msg.utm_x = long(u[0])
		msg.utm_y = long(u[1])
		lc.publish("GPGGA", msg.encode())
	elapsed = initial - time.time() 

