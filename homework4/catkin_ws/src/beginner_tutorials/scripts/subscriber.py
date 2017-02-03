#!/usr/bin/env python
# Subscriber  that listens to std_msgs/Strings published 
# to the 'chatter' topic

import rospy
from std_msgs.msg import String

def callback(data):
    rospy.loginfo(rospy.get_caller_id() + 'ROS knows that  %s', data.data)

def listener():

    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber('chatter', String, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    listener()
