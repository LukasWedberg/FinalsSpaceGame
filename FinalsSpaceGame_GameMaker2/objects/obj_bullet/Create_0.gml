/// @description Insert description here
// You can write your code in this editor

sender = "";


target_x = 0;

target_y = 0;

bullet_direction = point_direction(target_x, target_y,x,y);

direction_x = dsin(bullet_direction);
direction_y = dcos(bullet_direction);




//Some tunables, down here!

bullet_speed = 3;

bullet_technique = global.bullet_technique_standard;