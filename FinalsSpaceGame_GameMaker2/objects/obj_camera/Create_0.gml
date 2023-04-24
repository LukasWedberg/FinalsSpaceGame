/// @description Here are some tunables for the camera. After that, we also set the initial position.

cam_lerp_speed = .088;


cam_minimum_elevation = room_height;

cam_maximum_elevation = (room_height - 950) - 550;

idle_camera_elevation = room_height - 448; //This is roughly halfway up the level



points_vertical_padding = 40;

camera_set_view_pos(view_camera[0], 0, camera_get_view_height(view_camera[0]));

