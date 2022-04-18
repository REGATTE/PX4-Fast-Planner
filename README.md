# PX4-Fast-Planner

Integrating [Fast Planner](https://github.com/HKUST-Aerial-Robotics/Fast-Planner) with [PX4-Autopilot](https://github.com/PX4/PX4-Autopilot) to build a fast paced obstacle avoidance drone in complex environments.

The **`Fast planner`** would be modified as per requirement without loosing acuracy and functionality, and will be updated to ROS2-Foxy, using Fast-RTPS Bridge and [PX4-MSGS](https://github.com/PX4/px4_msgs)


*`note`*
```
This is a personal project, and functionality is not gauranteed. The author is not liable to any damages incurred by the user.
```

## Installation

Use the bash files in [Installation Folder](/installation). Will only run on **Ubuntu 20.04**.

Run [Main.sh] to install all the requirements. If you want/need to do it individually, given below is the functionality of each file.

1. [PX4.sh](/installation/px4.sh): This file install [PX4-Autopilot](https://github.com/PX4/PX4-Autopilot) and installs other requirements like `Gazebo` and other support software.

2. [FastRTPS_DDS.sh](/installation/FastRTPS_DDS.sh): This file installs the FastRTPS Bridge, with all its dependencies with *`Gradle 6.3`* & *`sdkman`*.

3. [ROS2_FOXY.sh](/installation/ROS2_FOXY.sh): This file installs ROS2 Foxy & sources to `~./bashrc`.

4. [PX4_WS.sh](/installation/px4_ws.sh): This file builds a ROS2 WS called **`px4_ros_com_ros2`** and install [px4_msgs](https://github.com/PX4/px4_msgs) & [px4_ros_com](https://github.com/PX4/px4_ros_com) to talk to PX4 over ROS2.

## Custom Models

We would need custom Drone's with Depth Sensing Camera's to work on this project. We are going to add a custom **`Gazebo Camera Plugin`** of a **Depth Sensing Camera** on an **IRIS** Drone. 

Steps to add Custom model to PX4-Autopilot

1. Copy Paste [IRIS_DS](/custom_model/IRIS_DepthSensing/IRIS_DS) folder to `PX4-Autopilot/Tools/sitl/gazebo/models/`. This folder holds the 3D files and structuring of the drone, and how it'll look in the SITL.

2. Copy Paste [Airframe](/custom_model/IRIS_DepthSensing/Airframe/1001_iris_ds) to `PX4-Autopilot/ROMFS/px4fmu_common/init.d-posix/airframes/`. This file holds data about the airframe, and how each motor works. 

3. In the same folder i.e., `PX4-Autopilot/ROMFS/px4fmu_common/init.d-posix/airframes/` open *CMakeLists.txt* and add **`1001_iris_ds`** to the list under `px4_add_romfs_files(`.

4. Under `PX4-Autopilot/platforms/posix/cmake/sitl_target.cmake`, add **`iris_ds`** under `set(models`.

Now open `PX4-Autopilot` in a Terminal window and run 

```make px4_sitl gazebo_iris_ds```

This will spawn the new model in gazebo.