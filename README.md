# PX4-Fast-Planner

Integrating [Fast Planner](https://github.com/HKUST-Aerial-Robotics/Fast-Planner) with [PX4-Autopilot](https://github.com/PX4/PX4-Autopilot) to build a fast paced obstacle avoidance drone in complex environments.

The **`Fast planner`** would be modified as per requirement without loosing acuracy and functionality, and will be updated to ROS2-Foxy, using Fast-RTPS Bridge and [PX4-MSGS](https://github.com/PX4/px4_msgs)


*`note`*
```
This is a personal project, and functionality is not gauranteed. The author is not liable to any damages incurred by the user.
```

## Installation

Use the bash files in [Installation Folder](/installation). Will only run on **Ubuntu 20.04**.

Run [Main.sh](/installation/main.sh) to install all the requirements.
```
$ cd installation
$ sh main.sh
```
If you want/need to do it individually, given below is the functionality of each file.

1. [PX4.sh](/installation/px4.sh): This file install [PX4-Autopilot](https://github.com/PX4/PX4-Autopilot) and installs other requirements like `Gazebo` and other support software.

2. [FastRTPS_DDS.sh](/installation/FastRTPS_DDS.sh): This file installs the FastRTPS Bridge, with all its dependencies with *`Gradle 6.3`* & *`sdkman`*.

3. [ROS2_FOXY.sh](/installation/ROS2_FOXY.sh): This file installs ROS2 Foxy & sources to `~./bashrc`.

4. [PX4_WS.sh](/installation/px4_ws.sh): This file builds a ROS2 WS called **`px4_ros_com_ros2`** and install [px4_msgs](https://github.com/PX4/px4_msgs) & [px4_ros_com](https://github.com/PX4/px4_ros_com) to talk to PX4 over ROS2.

## Custom Models

We would need custom Drone's with Depth Sensing Camera's to work on this project. We are going to add a custom **`Gazebo Camera Plugin`** of a **Depth Sensing Camera** on an existing PX4 drones.

1. **[IRIS_DS](/Documentation/IRIS_DepthSensing.md)**

2. **[TYPHOON 480](/Documentation/Typhoon_480_DepthSensing.md)**