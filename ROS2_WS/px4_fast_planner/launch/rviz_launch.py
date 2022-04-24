import os
import sys 

from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():

    base_path = os.chdir("~/px4_ros_com_ros2/src/px4_fast_planner")
    rviz_path = base_path + "/rviz/rviz.rviz"

    ld = LaunchDescription()
    rviz_launch = Node(
        name="rvizvisualisation",
        output="log",
        package="rviz2",
        executable="rviz2",
        arguments=['-d', str(rviz_path)]
    )

    ld.add_action(rviz_launch)

    return ld


