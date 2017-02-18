import lcm

from exlcm import vnimu_data

def my_handler(channel, data):
    msg = vnimu_data.decode(data)
    print("Received message on channel \"%s\"" % channel)
    print("   Yaw    = {}".format (msg.yaw))
    print('   Pitch  = {}'.format(msg.pitch))
    print('   Roll   = {}'.format(msg.roll))
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

lc = lcm.LCM()
subscription = lc.subscribe("VNYMR", my_handler)

try:
    while True:
        lc.handle()
except KeyboardInterrupt:
    pass

lc.unsubscribe(subscription)
