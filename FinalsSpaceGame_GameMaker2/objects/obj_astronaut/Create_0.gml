/// @description Insert description here
// You can write your code in this editor

global.astronaut = self;

//State-based behavior
global.astronaut_state_falling = "falling";
global.astronaut_state_grounded = "grounded";
global.astronaut_state_jumping = "jumping";
global.astronaut_state_blocking = "blocking";
global.astronaut_state_knocked_out = "knocked out";
global.astronaut_state_respawning = "respawning";

global.astronaut_current_state = global.astronaut_state_falling;





//This will be the current velocity of the player
x_vel = 0;

y_vel = 0;



jump_hold_timer = 0; 



//Tunables
player_gravity = 0.1;

jump_force = -7/3;

move_speed = 5;

ground_friction = .1;

//the player will be able to jump higher by holding the button. 
//This variable deictates exactly how long they can hold it for. 
jump_hold_frames_in_seconds = room_speed * 1;



bullets_per_second = room_speed * .5;
bullet_timer = bullets_per_second;
bullet_speed = 3;



maximum_hp = 3;
current_hp = maximum_hp;
alive = true;

respawn_time = room_speed * 3;
respawn_timer = 0;