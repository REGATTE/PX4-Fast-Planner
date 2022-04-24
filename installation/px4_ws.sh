#! /bin/sh
# workspace
cd
echo "----- Build Workspace -----"

mkdir -p ~/px4_ros_com_ros2/src
git clone https://github.com/PX4/px4_ros_com.git ~/px4_ros_com_ros2/src/px4_ros_com
git clone https://github.com/PX4/px4_msgs.git ~/px4_ros_com_ros2/src/px4_msgs
git clone -b foxy https://github.com/ros2/rviz.git ~/px4_ros_com_ros2/rviz

# copy main Ppx4_fast_planner to px4_ros_com_ros2
cp -R ~/Documents/PX4-Fast-Planner/px4_fast_planner ~/px4_ros_com_ros2/src
# copy fast_planner to px4_ros_com_ros2
cp -R ~/Documents/PX4-Fast-Planner/FAST_PLANNER/ROS2_WS/. ~/px4_ros_com_ros2/src
# copy custom messages
cp -R ~/Documents/PX4-Fast-Planner/custom_messages ~/px4_ros_com_ros2/src

cd ~/px4_ros_com_ros2/src/px4_ros_com/scripts
source clean_all.bash
source build_ros2_workspace.bash

cd
cd

echo "source ~/px4_ros_com_ros2/install/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "Done building Workspace, you can now start developing."
