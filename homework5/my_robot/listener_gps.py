import lcm

from exlcm import gpgga_data

def my_handler(channel, data):
    msg = gpgga_data.decode(data)
    print("Received message on channel \"%s\"" % channel)
    print("   timestamp   = %s" % str(msg.timestamp))
    print("   latitude = %s" % str(msg.latitude))
    print("   latitude direction    = %s" % str(msg.direction1))
    print("   longitude    = %s" % str(msg.longitude))
    print("   longitude direction = %s" % str(msg.direction2))
    print("   altitude    = %s" % str(msg.altitude))
    print("   utm_x    = %s" % str(msg.utm_x))
    print("   utm_y    = %s" % str(msg.utm_y))
    print("")

lc = lcm.LCM()
subscription = lc.subscribe("GPGGA", my_handler)

try:
    while True:
        lc.handle()
except KeyboardInterrupt:
    pass

lc.unsubscribe(subscription)
