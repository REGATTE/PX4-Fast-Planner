# Manual Setup

## Models

### Models

We would need custom Drone's with Depth Sensing Camera's to work on this project. We are going to add a custom **`Gazebo Camera Plugin`** of a **Depth Sensing Camera** on an existing PX4 drones.

Copy Paste all folders under **[Models](/custom_model/models)** to `PX4-Autopilot/Tools/sitl-gazebo/models/`. 

Additional Steps

1. **[IRIS_DS](/Documentation/IRIS_DepthSensing.md)**

2. **[TYPHOON 480](/Documentation/Typhoon_480_DepthSensing.md)**

### Worlds

1. Add **[World File](custom_model/worlds/outdoor_village.world)** to `PX4-Autopilot/Tools/sitl-gazebo/worlds/`. 

2. Under `PX4-Autopilot/platforms/posix/cmake/sitl_target.cmake`, add **`outdoor_village`** under `set(worlds`.