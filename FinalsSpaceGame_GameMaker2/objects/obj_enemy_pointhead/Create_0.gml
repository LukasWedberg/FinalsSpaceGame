/// @description Insert description here
// You can write your code in this editor

global.enemy_type_pointhead = "pointhead";
enemy_type = global.enemy_type_pointhead;




global.enemy_state_calm = "calm";
global.enemy_state_bracing_for_battle = "bracing";
global.enemy_state_attacking = "attacking";

current_state = global.enemy_state_calm;


x_vel = 0;
y_vel = 0;



//Some tunables!

damage_dealt = 1;


pointy_gravity = .08;




move_speed = 2;

jump_force = -1;

grounded = false;


aggro_countdown_time = room_speed * .5;
aggro_countdown_timer = 0;

franticness = .01;



aggro_distance = 150 * 5; 

attacking_distance = 75;

attacking_start_lag_time = room_speed * .5;
attacking_start_lag_timer = 0; 



target_x = 0;
target_y = 0;



maximum_hp = 1;
current_hp = maximum_hp;
invincibility_frames = room_speed * .5;
invincibility_timer = 0;
currently_invincible = false;


player = global.astronaut;



parts = part_system_create_layer("Instances", false);
part_system_depth(parts, -1000000);

giblets = part_type_create();
part_type_shape(giblets, pt_shape_ring); 
part_type_size(giblets, .05 * 2, .25 * 2, 0, .05 * 2);
part_type_speed(giblets, 4 * 2, 8 * 2, -0.20 * 2, 0);
part_type_direction(giblets, 45, 135, 0,20);
part_type_colour3(giblets, c_red, c_red, c_black);
part_type_life(giblets, 30, 40);