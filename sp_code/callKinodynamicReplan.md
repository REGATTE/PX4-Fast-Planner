
```c++
// kino_replan_fsm.cpp
bool KinoReplanFSM::callKinodynamicReplan() {
  bool plan_success =
      planner_manager_->kinodynamicReplan(start_pt_, start_vel_, start_acc_, end_pt_, end_vel_);

  if (plan_success) {

    planner_manager_->planYaw(start_yaw_);

    auto info = &planner_manager_->local_data_;

    /* publish traj */
    plan_manage::Bspline bspline;
    bspline.order      = 3;
    bspline.start_time = info->start_time_;
    bspline.traj_id    = info->traj_id_;

    Eigen::MatrixXd pos_pts = info->position_traj_.getControlPoint();

    for (int i = 0; i < pos_pts.rows(); ++i) {
      geometry_msgs::Point pt;
      pt.x = pos_pts(i, 0);
      pt.y = pos_pts(i, 1);
      pt.z = pos_pts(i, 2);
      bspline.pos_pts.push_back(pt);
    }

    Eigen::VectorXd knots = info->position_traj_.getKnot();
    for (int i = 0; i < knots.rows(); ++i) {
      bspline.knots.push_back(knots(i));
    }

    Eigen::MatrixXd yaw_pts = info->yaw_traj_.getControlPoint();
    for (int i = 0; i < yaw_pts.rows(); ++i) {
      double yaw = yaw_pts(i, 0);
      bspline.yaw_pts.push_back(yaw);
    }
    bspline.yaw_dt = info->yaw_traj_.getInterval();

    bspline_pub_.publish(bspline);

    /* visulization */
    auto plan_data = &planner_manager_->plan_data_;
    visualization_->drawGeometricPath(plan_data->kino_path_, 0.075, Eigen::Vector4d(1, 1, 0, 0.4));
    visualization_->drawBspline(info->position_traj_, 0.1, Eigen::Vector4d(1.0, 0, 0.0, 1), true, 0.2,
                                Eigen::Vector4d(1, 0, 0, 1));

    return true;

  } else {
    cout << "generate new traj fail." << endl;
    return false;
  }
}
```
