/// @description Insert description here
// You can write your code in this editor


target_x = global.astronaut.x + x_offset;
target_y = global.astronaut.y + y_offset;

cam_x_pos = camera_get_view_x(view_camera[0]);
cam_y_pos = camera_get_view_y(view_camera[0]);

cam_x_new_pos = lerp(cam_x_pos, target_x-cam_width/2, cam_lerp_speed);
cam_y_new_pos = lerp(cam_y_pos, target_y-cam_height/2, cam_lerp_speed);


camera_set_view_pos(view_camera[0], cam_x_new_pos, cam_y_new_pos);

screen_shroud.x = cam_x_new_pos + cam_width/2;
screen_shroud.y = cam_y_new_pos + cam_height/2;