import lcm
import time
import serial
import utm
import sys

from exlcm import vnimu_data

lc = lcm.LCM()
serStr = str(sys.argv[1])
print(serStr)
ser = serial.Serial(serStr, 115200, timeout=1)

initial = time.time()
elapsed = 0
while elapsed < 75:
	raw = ser.readline()
	line=raw.split(',')
	if line[0] == "$VNYMR":
		msg = vnimu_data()
        	msg.yaw = float(line[1])
        	msg.pitch = float(line[2])
        	msg.roll = float(line[3])
        	msg.magX = float(line[4])
        	msg.magY = float(line[5])
        	msg.magZ = float(line[6])
        	msg.accelX = float(line[7])
        	msg.accelY = float(line[8])
        	msg.accelZ = float(line[9])
        	msg.gyroX = float(line[10])
        	msg.gyroY = float(line[11])
		gyroZ = line[12].split('*')
        	msg.gyroZ = float(gyroZ[0])
		lc.publish("VNYMR", msg.encode())
	elapsed = initial - time.time() 

