/// @description Insert description here
// You can write your code in this editor

target_x = 0;
target_y = 0;

cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);

screen_shroud = global.screen_shroud;


stars = instance_find(obj_stars,0);




//Some tunables here!

cam_lerp_speed = .2;

x_offset = 0;
y_offset = -100;







//Setting the camera so it starts at the player's position.

target_x = global.astronaut.x + x_offset;
target_y = global.astronaut.y + y_offset;

cam_x_pos = camera_get_view_x(view_camera[0]);
cam_y_pos = camera_get_view_y(view_camera[0]);

cam_x_new_pos = target_x-cam_width/2;
cam_y_new_pos =  target_y - cam_height/2;


camera_set_view_pos(view_camera[0], cam_x_new_pos, cam_y_new_pos);

screen_shroud.x = cam_x_new_pos + cam_width/2;
screen_shroud.y = cam_y_new_pos + cam_height/2;

draw_hearts_x = 0;
draw_hearts_y = 0;
heart_x_padding = 64;