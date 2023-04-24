/// @description this gets the average height of the two players, presuming they're onscreen. If a player has to be offscreen(they died), then the point halfway up the level is factored in instead.

elevation_one = idle_camera_elevation;

elevation_two = idle_camera_elevation;

if(subject_one.onscreen){
	elevation_one = subject_one.y;
}


if(subject_two.onscreen){
	elevation_two = subject_two.y;
}


averaged_player_elevation = (elevation_one + elevation_two)/2;

cam_height = camera_get_view_height(view_camera[0]);

y_point_to_lerp_to = clamp(averaged_player_elevation - cam_height/2, cam_maximum_elevation, cam_minimum_elevation - cam_height);

//y_point_to_lerp_to = average_player_height - cam_height/2;


camera_set_view_pos(view_camera[0]
, 0
, lerp(camera_get_view_y(view_camera[0]),y_point_to_lerp_to, cam_lerp_speed)
)



