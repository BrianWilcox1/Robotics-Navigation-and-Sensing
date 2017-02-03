#!/usr/bin/env python 
import roslib
roslib.load_manifest('learning_tf')
import rospy
import math
import tf
import turtlesim.msg
import turtlesim.srv
from geometry_msgs.msg import Twist
from geometry_msgs.msg import Vector3

if __name__ == '__main__':
    rospy.init_node('tf_turtle')

    listener = tf.TransformListener()

    rospy.wait_for_service('spawn')
    spawner = rospy.ServiceProxy('spawn', turtlesim.srv.Spawn)
    spawner(4, 2, 0, 'turtle2')

    turtle_vel = rospy.Publisher('turtle2/cmd_vel', Twist)

    rate = rospy.Rate(10.0)
    while not rospy.is_shutdown():
        try:
        	now = rospy.Time.now()
            	past = now - rospy.Duration(5.0)
            	listener.waitForTransformFull("/turtle2", now,
                                      "/turtle1", past,
                                      "/world", rospy.Duration(1.0))
            	(trans, rot) = listener.lookupTransformFull("/turtle2", now,
                                      "/turtle1", past,
                                      "/world")

	except (tf.Exception, tf.LookupException, tf.ConnectivityException):
	  	continue
	linear = Vector3(trans[0],trans[1],trans[2]);
	angular = Vector3(rot[0],rot[1],rot[2]);
        turtle_vel.publish(Twist(linear,angular))

        rate.sleep()
