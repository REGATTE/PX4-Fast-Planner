"""

This Python File listens to Transform and publishes a camera_pose. 
It is similar to a tf2  Listener
https://docs.ros.org/en/foxy/Tutorials/Tf2/Writing-A-Tf2-Listener-Py.html

"""

import rclpy
from rclpy.node import Node

from geometry_msgs.msg import PoseStamped

from tf2_ros import TransformException
from tf2_ros.buffer import Buffer
from tf2_ros.transform_listener import TransformListener

class CameraPosePublisher(Node):
    def __init__(self):
        super().__init__('camera_pose_publisher')

        # Declare and Get Parameters
        self.declare_parameter('parent_frame', '/map')
        self.declare_parameter('child_frame', 'camera_link')
        self.declare_parameter('pose_topic', '/camera/pose')

        self.parent_frame = self.get_parameter('parent_frame').get_parameter_value().string_value
        self.camera_frame = self.get_parameter('child_frame').get_parameter_value().string_value
        self.pose_topic = self.get_parameter('pose_topic').get_parameter_value().string_value

        # Publisher 
        # Message: PoseStamped
        # Topic: pose_topic: camera/pose
        self.pose_publisher = self.create_publisher(self.pose_topic, PoseStamped, 1)

        self.tf_buffer = Buffer()
        self.tf_listener = TransformListener(self.tf_buffer, self)
        
        

    
def main(args = None):
    rclpy.init(args = args)
    node = CameraPosePublisher()
    rclpy.spin(node)

    node.destroy_node()
    rclpy.shutdown

if __name__ == '__main__':
    main()

        
