/// @description Insert description here
// You can write your code in this editor

global.enemy_state_calm = "calm";
global.enemy_state_bracing_for_battle = "bracing";
global.enemy_state_attacking = "attacking";

current_state = global.enemy_state_calm;






//Some tunables!
bullets_per_second = room_speed * 2;

bullet_timer = bullets_per_second;



aggro_distance = 32 * 10; 

aggro_levitation_height = y - 16;

aggro_levitation_lerp_speed = .1; //Ranges from 0-1. The lower this is, the slower the enemy rises.


calm_height = y;

calm_distance = 32 * 15;


target_x = 0;
target_y = 0;



maximum_hp = 3;
current_hp = maximum_hp;
invincibility_frames = room_speed * .5;
invincibility_timer = 0;
currently_invincible = false;


player = global.astronaut;