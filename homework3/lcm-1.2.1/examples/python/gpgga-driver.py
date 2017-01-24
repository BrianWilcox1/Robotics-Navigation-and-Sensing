import lcm
import time
import serial
import utm

from exlcm import gpgga_data

lc = lcm.LCM()

ser = serial.Serial('/dev/ttyUSB0', 4800, timeout=1)

initial = time.time()
elapsed = 0
while elapsed < 600:
	line = ser.readline()
	line=line.split(',')
	if line[0] == "$GPGGA":
		msg = gpgga_data()
        	msg.timestamp = float(line[1])
        	msg.latitude = float(line[2])
        	msg.direction1 = line[3]
        	msg.longitude = float(line[4])
        	msg.direction2 = line[5]
		msg.altitude = float(line[9])
		u = utm.from_latlon(msg.latitude, msg.longitude)
                msg.utm_x = long(u[0])
		msg.utm_y = long(u[1])
		lc.publish("GPGGA", msg.encode())
	elapsed = initial - time.time() 

