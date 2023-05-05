/// @description Insert description here
// You can write your code in this editor

global.enemy_type_springpede = "springpede";
enemy_type = global.enemy_type_springpede;




global.enemy_state_calm = "calm";
global.enemy_state_bracing_for_battle = "bracing";
global.enemy_state_attacking = "attacking";
global.enemy_state_leaping = "leaping";


current_state = global.enemy_state_calm;


x_vel = 0;
y_vel = 0;

airborn = false;

landed = false;



//Some tunables!

damage_dealt = 2;


leaping_speed = 10;


//This adds upwards velocity to the springpede's leap, so that it has an arc.
overshoot = 2.5;



regular_springy_gravity = .1;

current_springy_gravity = regular_springy_gravity;





move_speed = 1;

jump_force = -1;

grounded = false;


aggro_countdown_time = room_speed * .5;
aggro_countdown_timer = 0;

franticness = .01;

stuck_time = room_speed * 10;
stuck_timer = 0;




aggro_distance = 150 * 5; 

calm_distance = 150 * 15;

attacking_distance = 150 * 2.5;

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

parts = part_system_create_layer("Instances", false);
part_system_depth(parts, -1000000);

giblets = part_type_create();
part_type_shape(giblets, pt_shape_ring); 
part_type_size(giblets, .05 * 2, .25 * 2, 0, .05 * 2);
part_type_speed(giblets, 4 * 2, 8 * 2, -0.20 * 2, 0);
part_type_direction(giblets, 45, 135, 0,20);
part_type_colour3(giblets, c_red, c_red, c_black);
part_type_life(giblets, 30, 40);