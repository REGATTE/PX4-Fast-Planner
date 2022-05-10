```xml
[ roll: -1.6593902, pitch: 0.0175478, yaw: -1.5639267 ]
[ x: 0.05071387, y: -0.11901028, z: -0.10727541]
```

```xml
  <!-- kino_algorithm.xml -->
  <!-- planner manager -->
    <param name="manager/max_vel" value="$(arg max_vel)" type="double"/>
    <param name="manager/max_acc" value="$(arg max_acc)" type="double"/>
    <param name="manager/max_jerk" value="4" type="double"/>
    <param name="manager/dynamic_environment" value="0" type="int"/>
    <param name="manager/control_points_distance" value="1" type="double"/>
```
```xml
  <!-- kino_replan.launch -->
  <!-- global parameters -->
  <arg name="max_vel" default="1" />
  <arg name="max_acc" default="2.5" />
```

```xml
  <!-- kino_replan.launch -->
    <!-- real.world -->

    <!-- 1: use 2D Nav Goal to select goal  -->
    <!-- 2: use global waypoints below  -->
    <arg name="flight_type" value="2" />
    
    <!-- global waypoints -->
    <!-- If flight_type is set to 2, the drone will travel these waypoints one by one -->
    <arg name="point_num" value="2" />

    <arg name="point0_x" value="5.0" />
    <arg name="point0_y" value="0.0" />
    <arg name="point0_z" value="3.0" />

    <!-- set more waypoints if you need -->
    <arg name="point1_x" value="0.0" />
    <arg name="point1_y" value="0.0" />
    <arg name="point1_z" value="3.0" />

    <arg name="point2_x" value="0.0" />
    <arg name="point2_y" value="0.0" />
    <arg name="point2_z" value="3.0" />
```
```xml
  <!-- geometric_controller.launch -->
  <node pkg="geometric_controller" type="geometric_controller_node" name="geometric_controller" output="screen">
          <param name="attctrl_constant" value="0.3" />
          <param name="normalizedthrust_constant" value="0.06" />
          <param name="normalizedthrust_offset" value="0.001" />
```
