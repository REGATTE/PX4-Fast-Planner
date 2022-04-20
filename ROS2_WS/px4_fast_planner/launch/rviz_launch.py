import os
import sys 

from launch import LaunchDescription
from launch_ros.actions import Node

def generate_launch_description():
    return LaunchDescription({
        Node(
            name="rvizvisualisation",
            package="rviz",
            executable='rviz',
            output="log",
        )
    })

if __name__ == '__main__':
    generate_launch_description()