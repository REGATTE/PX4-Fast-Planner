# camera, map, range, path, traj, cmd
# /vins_estimator/camera_pose
# rosbag record /pcl_render_node/camera_pose /sdf_map/occupancy_inflate /sdf_map/update_range /planning_vis/topo_path /planning_vis/trajectory /planning/state 
# rosbag record -o ~/ -a -x "(.*)theora(.*)|(.*)compressed(.*)"
# rosbag record -o ~/ -a -x "(.*)theora(.*)|(.*)compressed(.*)|(.*)global_position(.*)|(.*)imu(.*)|(.*)geometric_controller(.*)|(.*)reference(.*)"
rosbag record -o ~/ -a -x "(.*)theora(.*)|(.*)compressed(.*)|(.*)global_position(.*)|(.*)imu(.*)|(.*)geometric_controller(.*)|(.*)reference(.*)|(.*)setpoint_raw(.*)|(.*)rgb_camera(.*)|(.*)stereo_module(.*)"
