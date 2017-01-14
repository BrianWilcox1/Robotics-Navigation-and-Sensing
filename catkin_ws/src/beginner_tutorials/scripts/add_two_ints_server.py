#! /usr/bin/env python
import roslib; roslib.load_manifest('beginner_tutorials')
from beginner_tutorials.srv import *
import rospy

def handle_add_two_ints(req):
    print "Returning [%s + %s = %s] (Next Time just use a Calculator)"%(req.a, req.b, (req.a + req.b))
    return AddTwoIntsResponse(req.a + req.b)

def add_two_ints_server():
    rospy.init_node('add_two_ints_server')
    s = rospy.Service('add_two_ints', AddTwoInts, handle_add_two_ints)
    print "Ready to add two ints. Is this really a good use of ROS?"
    rospy.spin()

if __name__ == "__main__":
    add_two_ints_server()

