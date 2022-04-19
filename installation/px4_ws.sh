#! /bin/sh
# workspace
cd
echo "----- Build Workspace -----"

mkdir -p ~/px4_ros_com_ros2/src
git clone https://github.com/PX4/px4_ros_com.git ~/px4_ros_com_ros2/src/px4_ros_com
git clone https://github.com/PX4/px4_msgs.git ~/px4_ros_com_ros2/src/px4_msgs
cd ~/px4_ros_com_ros2/src/px4_ros_com/scripts
source clean_all.bash
source build_ros2_workspace.bash
echo "source ~/px4_ros_com_ros2/install/setup.bash" >> ~/.bashrc
source ~/.bashrc

echo "Done building Workspace, you can now start developing."