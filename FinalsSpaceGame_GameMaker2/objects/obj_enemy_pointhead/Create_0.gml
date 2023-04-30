/// @description Insert description here
// You can write your code in this editor


global.enemy_state_calm = "calm";
global.enemy_state_bracing_for_battle = "bracing";
global.enemy_state_attacking = "attacking";

current_state = global.enemy_state_calm;


x_vel = 0;
y_vel = 0;



//Some tunables!



pointy_gravity = .01;




move_speed = 1;

jump_force = -1;

grounded = false;


aggro_countdown_time = room_speed * .5;
aggro_countdown_timer = 0;

franticness = .01;



aggro_distance = 32 * 10; 

calm_distance = 32 * 15;

attacking_distance = 32;

attacking_start_lag_time = room_speed * .5;
attacking_start_lag_timer = 0; 



target_x = 0;
target_y = 0;



maximum_hp = 3;
current_hp = maximum_hp;
invincibility_frames = room_speed * .5;
invincibility_timer = 0;
currently_invincible = false;


player = global.astronaut;