## Setting up typhoon_480_ds custom model into PX4

Steps to add Custom typhoon_480_ds model to PX4-Autopilot

1. Copy Paste [Airframe](/custom_model/Airframes/1002_typhoon_480_ds) to `PX4-Autopilot/ROMFS/px4fmu_common/init.d-posix/airframes/`. This file holds data about the airframe, and how each motor works. 

2. In the same folder i.e., `PX4-Autopilot/ROMFS/px4fmu_common/init.d-posix/airframes/` open *CMakeLists.txt* and add **`1002_typhoon_480_ds`** to the list under `px4_add_romfs_files(`.

3. Under `PX4-Autopilot/platforms/posix/cmake/sitl_target.cmake`, add **`typhoon_480_ds`** under `set(models`.

Now open `PX4-Autopilot` in a Terminal window and run 

```make px4_sitl gazebo_typhoon_480_ds```

This will spawn the new model in gazebo.

