# drone_extend
`drone_extend` is an extension simulation of [px4_fast_planner](https://github.com/mzahana/px4_fast_planner). This repository is a version of `px4_fast_planner` with `D435i Depth Camera`.

* [Show simulation](#show-simulation)
* [Change PX4 Parameter](#change-px4-parameter)
* [Publish points](#publish-points)
* [Add and Change Parameter accordingly](#add-and-change-parameter-accordingly)
* [PlanningVisualization](#planning-visualization)
  
[Show simulation](#show-simulation)
=================

* To use max performance, you must enable `NVIDIA graphic driver`

<img src="https://user-images.githubusercontent.com/69444682/161436743-24bf3fba-152f-46b6-afeb-8c8111feed8b.png" width="425"> <img src="https://user-images.githubusercontent.com/69444682/161436744-ff26448c-d852-4861-832e-317c51d954ff.png" width="400">

* Check `/camera/imu` topic and view_frames. Type as below:
```shell
$ rosrun tf view_frames && evince frames.pdf
```
<img src="https://user-images.githubusercontent.com/69444682/161424850-f0777c14-0e91-49b4-b0b0-c5ebf77abcb6.png" width="325"> <img src="https://user-images.githubusercontent.com/69444682/161437262-020d612a-654a-4ffd-9b4d-45b3d327fdb7.png" width="490">
<img src="https://user-images.githubusercontent.com/69444682/161439279-d4dff821-48c1-4543-935a-9b57441047e7.png" width="550">

* Check camera info
```shell
$ rostopic echo /camera/color/camera_info
#
D: []
K: [462.266357421875, 0.0, 320.0, 0.0, 462.266357421875, 240.0, 0.0, 0.0, 1.0]
R: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
P: [462.266357421875, 0.0, 320.0, 0.0, 0.0, 462.266357421875, 240.0, 0.0, 0.0, 0.0, 1.0, 0.0]
#
$ rostopic echo /camera/depth/camera_info
#
D: []
K: [319.9348449707031, 0.0, 320.0, 0.0, 319.9348449707031, 240.0, 0.0, 0.0, 1.0]
R: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
P: [319.9348449707031, 0.0, 320.0, 0.0, 0.0, 319.9348449707031, 240.0, 0.0, 0.0, 0.0, 1.0, 0.0]
#
```

<img src="https://user-images.githubusercontent.com/69444682/161438532-848282e9-aa7e-4526-808d-4ad98a3bcee0.png" width="400"> <img src="https://user-images.githubusercontent.com/69444682/161438530-efd8c5ac-1aaa-498c-ac74-7f890c29b904.png" width="400">

[Change PX4 Parameter](#change-px4-parameter)
======================
* To use VIO, you must change some parameters.

| Param | Original | After |
| --- | --- | --- |
| EKF2_AID_MASK | 1 | 24 |
| EKF2_HGT_MODE | 0 | 3 |

<img src="https://user-images.githubusercontent.com/69444682/161434374-f3bc683e-49c7-4d66-aaef-a83267a49db8.png" width="500">

* source by using the initialization command
```shell
$ roslaunch px4 posix_sitl.launch
```
<img src="https://user-images.githubusercontent.com/69444682/161530544-b023f915-3580-463f-a39e-bc98b800d919.png" width="500">

[Publish points](#publish-points)
================

* To command the drone to fly to a target pose, publish a single message to the `/move_base_simple/goal` topic as follows
```shell
$ rostopic pub --once /move_base_simple/goal geometry_msgs/PoseStamped "header:
  seq: 0
  stamp:
    secs: 0
    nsecs: 0
  frame_id: ''
pose:
  position:
    x: 5.0
    y: 0.0
    z: 3.0
  orientation:
    x: 0.0
    y: 0.0
    z: 0.0
    w: 0.0" 
publishing and latching message for 3.0 seconds
```
* To command the drone to fly to a target pose when using `geometric_controller` node, publish a single message to the `/command/trajectory` topic as follows
```shell
rostopic pub --once /command/trajectory trajectory_msgs/MultiDOFJointTrajectory "header:  
  seq: 0
  stamp:
    secs: 0
    nsecs: 0
  frame_id: ''
joint_names:
- ''
points:
- transforms:
  - translation:
      x: 0.0
      y: 0.0
      z: 2.5
    rotation:
      x: 0.0
      y: 0.0
      z: 0.0
      w: 0.0
  velocities:
  - linear:
      x: 0.0
      y: 0.0
      z: 0.0
    angular:
      x: 0.0
      y: 0.0
      z: 0.0
  accelerations:
  - linear:
      x: 0.0
      y: 0.0
      z: 0.0
    angular:
      x: 0.0
      y: 0.0
      z: 0.0
  time_from_start:
    secs: 0
    nsecs: 0"
```

* Flight scenario with ivsr_planner World

| Flight scenario | 1st  | 2nd | 3rd | 4th |
| --- | --- | --- | --- | --- |
| Global waypoints number | 3 | 6 | 2 | 3 |
| 1 | (0;27.5;2) | (0;0;2) | (-9;9;5) | (-13;0;5) |
| 2 | (0;-26.5;2) | (14;-14;2) | (-6;0;2) | (12;0;5) |
| 3 | (0;0;2) | (7;10.5;2) |   | (-10;-10;5) |
| 4 |  | (7;-8.5;2) |   |   |
| 5 |  | (-10;14;2) |   |   |
| 6 |  | (-10;-11;2) |   |   |

```xml
    <!-- 1: use 2D Nav Goal to select goal  -->
    <!-- 2: use global waypoints below  -->
    <arg name="flight_type" value="2" />
    
    <!-- global waypoints -->
    <!-- If flight_type is set to 2, the drone will travel these waypoints one by one -->
    <arg name="point_num" value="3" />

    <arg name="point0_x" value="-13" />
    <arg name="point0_y" value="0.0" />
    <arg name="point0_z" value="5.0" />

    <arg name="point1_x" value="12.0" />
    <arg name="point1_y" value="0.0" />
    <arg name="point1_z" value="5.0" />

    <arg name="point2_x" value="-10.0" />
    <arg name="point2_y" value="-10.0" />
    <arg name="point2_z" value="5.0" />

    <!-- <arg name="point_num" value="2" />

    <arg name="point0_x" value="-9.0" />
    <arg name="point0_y" value="9.0" />
    <arg name="point0_z" value="5.0" />

    <arg name="point1_x" value="-6.0" />
    <arg name="point1_y" value="0.0" />
    <arg name="point1_z" value="2.0" />-->

    <!--<arg name="point_num" value="8" />

    <arg name="point0_x" value="0.0" />
    <arg name="point0_y" value="27.5" />
    <arg name="point0_z" value="2.0" />

    <arg name="point1_x" value="0.0" />
    <arg name="point1_y" value="-26.5" />
    <arg name="point1_z" value="2.0" />

    <arg name="point2_x" value="0.0" />
    <arg name="point2_y" value="0.0" />
    <arg name="point2_z" value="2.0" />

    <arg name="point3_x" value="14.0" />
    <arg name="point3_y" value="-14.0" />
    <arg name="point3_z" value="2.0" />

    <arg name="point4_x" value="7.0" />
    <arg name="point4_y" value="10.5" />
    <arg name="point4_z" value="2.0" />

    <arg name="point5_x" value="7" />
    <arg name="point5_y" value="-8.5" />
    <arg name="point5_z" value="2.0" />

    <arg name="point6_x" value="-10" />
    <arg name="point6_y" value="14" />
    <arg name="point6_z" value="2.0" />

    <arg name="point7_x" value="-10" />
    <arg name="point7_y" value="-11" />
    <arg name="point7_z" value="2.0" />-->
```

[Add and Change Parameter accordingly](#add-and-change-parameter-accordingly)
=====================================
```xml
          <param name="yaw_heading" value="3.14" />
```

```xml
          <param name="attctrl_constant" value="0.3" />
          <param name="normalizedthrust_constant" value="0.06" />
          <param name="normalizedthrust_offset" value="0.001" />
```

[Planning Visualization](#planning-visualization)
========================
* Path planner in Kino Planner 
<img src="https://user-images.githubusercontent.com/69444682/164940766-13d2923d-17a9-408a-8a8c-4d0a1b4a8337.png" width="750">

* Change parameter in visualization fuctions
<img src="https://user-images.githubusercontent.com/69444682/164914791-0e8b18e3-f7d7-4dee-a5dc-96f4da022f4a.png" width="750">

<img src="https://user-images.githubusercontent.com/69444682/164955847-b5ef98a2-e03b-413b-bad9-3c847ff63a15.png" width="750">
