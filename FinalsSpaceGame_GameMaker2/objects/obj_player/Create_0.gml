/// @description Here are some variables for later. Most of these determine how the physics will work!

sprite_index = player_sprite;

x_vel = 0;
y_vel = 0;

rx = 0;
ry = 0;

player_accel = 2.08;

bounce_vel = -23;

respawn_vel = -23;
respawn_time = 120;
respawn_timer = 150;
onscreen = true;

player_score = 0;

player_gravity = .3;


right_key = vk_right;
left_key = vk_left;

points_x_pos = room_width - 8;

if(sprite_index = spr_red_player){
	right_key = ord("D")
	left_key = ord("A")
	
	points_x_pos = 8;
}


