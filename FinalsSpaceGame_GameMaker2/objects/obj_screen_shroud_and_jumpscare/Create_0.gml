/// @description Insert description here
// You can write your code in this editor

global.death_state_alive = "alive";
global.death_state_fading = "fading";
global.death_state_jumpscare = "jumpscare";
global.death_state_continue = "continue";

global.death_current_state = global.death_state_alive;


global.screen_shroud = self;


fade_lerp_speed = .08;

intro_lerp_speed = .01;


draw_jumpscare = false;

jumpscare_persistence = room_speed * 3;
jumpscare_persistence_timer = 0;



draw_restart_message = false;

