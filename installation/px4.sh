#! /bin/sh
cd
echo "Installing PX4 Autopilot"
cd Desktop

# Clone the repo
git clone https://github.com/PX4/PX4-Autopilot.git --recursive 

# installs Java JDK 11
bash ./PX4-Autopilot/Tools/setup/ubuntu.sh  
echo " Done Installing PX4 Autopilot"

echo "Build px4 fmu-v5x"
# build px4 firmware for FMU_v5x
# this builds a new BUILD folder in PX4-Autopilot root directory and stores the firmware there.
cd PX4-Autopilot
make px4_fmu-v5x_default 
echo "Done Building px4 fmu-v5x"
# make px4_fmu-v5x_default

cd