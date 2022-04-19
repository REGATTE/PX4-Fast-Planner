## Setting up iris_Ds custom model into PX4

Steps to add Custom iris_ds model to PX4-Autopilot

1. Copy Paste [IRIS_DS](/custom_model/IRIS_DepthSensing/IRIS_DS) folder to `PX4-Autopilot/Tools/sitl/gazebo/models/`. This folder holds the 3D files and structuring of the drone, and how it'll look in the SITL.

2. Copy Paste [Airframe](/custom_model/IRIS_DepthSensing/Airframe/1001_iris_ds) to `PX4-Autopilot/ROMFS/px4fmu_common/init.d-posix/airframes/`. This file holds data about the airframe, and how each motor works. 

3. In the same folder i.e., `PX4-Autopilot/ROMFS/px4fmu_common/init.d-posix/airframes/` open *CMakeLists.txt* and add **`1001_iris_ds`** to the list under `px4_add_romfs_files(`.

4. Under `PX4-Autopilot/platforms/posix/cmake/sitl_target.cmake`, add **`iris_ds`** under `set(models`.

Now open `PX4-Autopilot` in a Terminal window and run 

```make px4_sitl gazebo_iris_ds```

This will spawn the new model in gazebo.