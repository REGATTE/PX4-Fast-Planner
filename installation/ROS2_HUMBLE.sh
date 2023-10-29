#!/bin/sh

locale  # check for UTF-8

sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8

locale  # verify settings

echo "Insalling ROS2 - HUMBLE"
# Setup Sources
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# install ros2 packages
sudo apt update
sudo apt install ros-humble-desktop

#source repo's
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python3-colcon-common-extensions
sudo apt install ros-humble-eigen3-cmake-module
sudo pip3 install -U empy pyros-genmsg setuptools
sudo apt install ros-humble-gazebo-ros-pkgs

echo "Done installing ROS2-Humble"