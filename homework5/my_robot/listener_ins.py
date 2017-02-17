import sys
import lcm

from exlcm import gpgga_data

if len(sys.argv) < 2:
    sys.stderr.write("usage: read-log <logfile>\n")
    sys.exit(1)

log = lcm.EventLog(sys.argv[1], "r")
for event in log:
    if event.channel == "GPGGA":
        msg = vnimu_data.decode(event.data)
    print("Received message on channel \"%s\"" % channel)
    print("   Yaw    = {}".format (msg.Yaw))
    print('   Pitch  = {}'.format(msg.Pitch))
    print('   Roll   = {}'.format(msg.Roll))
    print("   magX   = {}".format (msg.magX))
    print('   magY  = {}'.format(msg.magY))
    print('   mayZ   = {}'.format(msg.magZ))
    print("   accelX    = {}".format (msg.accelX))
    print('   accelY  = {}'.format(msg.accelY))
    print('   accelZ   = {}'.format(msg.accelZ))
    print("   gyroX    = {}".format (msg.gyroX))
    print('   gyroY  = {}'.format(msg.gyroY))
    print('   gyroZ   = {}'.format(msg.gyroZ))
    print("")

