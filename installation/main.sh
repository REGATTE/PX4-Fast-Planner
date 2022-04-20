#! /bin/sh

echo "installation"

sudo apt install curl
sudo apt install git

echo "checking ubuntu version"
if [[ $(lsb_release -rs) == "20.04" ]]; then
    echo "Ubuntu Version 20.04"
    echo "Starting Installation"
    sh installation/px4.sh
    sh installation/FastRTPS_DDS.sh
    sh installation/ROS2_FOXY.sh
    sh installation/px4_ws.sh
    sh installation/setup.sh 
else
    echo "Ubuntu Version Not-Compatible"
    echo "Only uses Ubuntu 20.04"
fi