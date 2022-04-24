from ctypes import util
import rclpy
from rclpy.node import Node

from trajectory_msgs.msg import MultiDOFJointTrajectory, MultiDOFJointTrajectoryPoint
from geometry_msgs.msg import Transform, Twist
from px4_msgs.msg import PositionSetpoint

from util import quaternion_from_euler

class MessageConverter(Node):
    def __init__(self):
        super().__init__('message_converter')

        