from socket import TCP_NODELAY
import rclpy
from rclpy.node import Node

from trajectory_msgs.msg import MultiDOFJointTrajectory, MultiDOFJointTrajectoryPoint
from geometry_msgs.msg import Transform, Twist
from px4_msgs.msg import PositionSetpoint

from util import quaternion_from_euler

class MessageConverter(Node):
    def __init__(self):
        super().__init__('message_converter')

        # Declare and Get Parameters
        self.declare_parameter('traj_pub_topic', '/command/trajectory')
        self.declare_parameter('fast_planner_traj_topic', '/planning/pos_cmd')
        
        self.traj_pub_topic = self.get_parameter('traj_pub_topic').get_parameter_value().string_value
        self.fast_planner_traj_topic = self.get_parameter('fast_planner_traj_topic').get_parameter_value().string_value
    
        # Create Publisher
        # Message: MultiDOFJointTrajectory
        # Topic: /command/trajectory
        self.traj_pub = self.create_publisher(self.traj_pub_topic, MultiDOFJointTrajectory, 1)

        # Create Subscriber
        self.create_subscription(self.fast_planner_traj_topic, PositionSetpoint, self.fastPlannerTrajCallback, TCP_NODELAY = True)

    def fastPlannerTrajCallback(self, msg):
        pose = Transform()
        pose.translation.x = msg.position.x
        pose.translation.y = msg.position.y
        pose.translation.z = msg.position.z
        q = quaternion_from_euler(0, 0, msg.yaw)
        pose.rotation.x = q[0]
        pose.rotation.y = q[1]
        pose.rotation.z = q[2]
        pose.rotation.w = q[3]

        # velocity
        vel = Twist()
        vel.linear = msg.velocaity

        # acceleration
        acc = Twist()
        acc.linear = msg.acceleration

        traj_point = MultiDOFJointTrajectoryPoint()
        traj_point.transforms.append(pose)
        traj_point.velocities.append(vel)
        traj_point.accelerations.append(acc)

        traj_msg = MultiDOFJointTrajectory()

        traj_msg.header = msg.header
        traj_msg.points.append(traj_point)

        self.traj_pub.publish(traj_msg)
    
def main(args = None):
    rclpy.init(args = args)
    node = MessageConverter()
    rclpy.spin(node)

    node.destroy_node()
    node.shutdown

if __name__ == '__main__':
    main()