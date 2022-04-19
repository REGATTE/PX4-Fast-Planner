#! /bin/sh
cd
# locale
locale  # check for UTF-8
sudo apt update && sudo apt install locales
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
locale  # verify settings

echo "Insalling ROS2 - FOXY"
# Setup Sources
sudo apt update && sudo apt install curl gnupg2 lsb-release 
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg 

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list 

# install ROS2 Packages
sudo apt update
sudo apt install ros-foxy-desktop
# source repo's
echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt install python3-colcon-common-extensions
sudo apt install ros-foxy-eigen3-cmake-module
sudo pip3 install -U empy pyros-genmsg setuptools
sudo apt install ros-foxy-gazebo-ros-pkgs

echo "Done installing ROS2 - FOXY"