/// @description Insert description here
// You can write your code in this editor

global.ground_tiles = layer_tilemap_get_id("Tiles_1");







global.astronaut = self;

//State-based behavior
global.astronaut_state_falling = "falling";
global.astronaut_state_grounded = "grounded";
global.astronaut_state_jumping = "jumping";
global.astronaut_state_blocking = "blocking";
global.astronaut_state_knocked_out = "knocked out";
global.astronaut_state_respawning = "respawning";

global.astronaut_current_state = global.astronaut_state_falling;






//This is empty, but only for now. It will hold a reference to the type of enemy that knocked out the player, so that we can enagegthe appropriae jumpscare.
oogly_boogly_type = "";





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

respawn_time = room_speed * 8;
respawn_timer = 0;





//I thought some particles might be fun for when the astronaut goes into bubble mode

parts = part_system_create_layer("Instances", false);
part_system_depth(parts, -1000000);

bubble_bit = part_type_create();
part_type_shape(bubble_bit, pt_shape_flare);
part_type_size(bubble_bit, .5, .25, 0, 0);
part_type_speed(bubble_bit, 4, 8, -0.10, 0);
part_type_direction(bubble_bit, 0, 360, 0,10);
part_type_colour3(bubble_bit, c_white, c_white, #31A2F2);
part_type_life(bubble_bit, 7, 15);


giblets = part_type_create();
part_type_shape(giblets, pt_shape_ring); 
part_type_size(giblets, .05, .25, 0, .05);
part_type_speed(giblets, 4, 8, -0.20, 0);
part_type_direction(giblets, 45, 135, 0,20);
part_type_colour3(giblets, c_red, c_red, c_black);
part_type_life(giblets, 30, 40);