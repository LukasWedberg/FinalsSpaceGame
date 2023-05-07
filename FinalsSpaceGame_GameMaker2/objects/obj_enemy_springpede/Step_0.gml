/// @description Insert description here
// You can write your code in this editor

y_vel += current_springy_gravity;


switch(current_state){

	case global.enemy_state_calm:
	
		sprite_index = spr_springpede_idle;
	
		if(point_distance(x,y, player.x, player.y) < aggro_distance and player.alive){
			current_state = global.enemy_state_bracing_for_battle;
			
			aggro_countdown_timer = aggro_countdown_time;
		}
	
	break;

	
	case global.enemy_state_bracing_for_battle:
		if(aggro_countdown_timer != 0){
			aggro_countdown_timer--; 
		

		}else {
			
			aggro_countdown_timer = aggro_countdown_time;
			current_state = global.enemy_state_attacking;
		}
	
	break;


	case global.enemy_state_attacking:
		
		
		if(player.alive){
			
			
			
			player_distance = point_distance(x,y, player.x, player.y);
		
			if(player_distance < attacking_distance){
				
				current_state = global.enemy_state_leaping;
				
				
				
			}else{
			
				var move_direction = sign(player.x - x);
				
				if(move_direction != 0){
					image_xscale = abs(image_xscale) * -move_direction;
				}
		
				sprite_index = spr_springpede_walk;
				
				
				
				//The next few lines are commented out, but only optionally. They give the springpede more of a "lurch-y" walk.
				
				//var walk_alpha = (sin(current_time*franticness) + 1)/2
				//image_speed = walk_alpha;
		
				x_vel = (move_speed * move_direction)// * walk_alpha;
				
				
				
			}
		
		}
		else{
			current_state = global.enemy_state_calm;
		}
	
	break;
	
	case global.enemy_state_leaping:
		
		//show_debug_message("THROW THROW");				
				
		if(sprite_index != spr_springpede_attack){
			image_index = 0;
			sprite_index = spr_springpede_attack;
			image_index = 0;
					
			x_vel = 0;
			
			current_springy_gravity = 0;
			
			show_debug_message("Phase 1!");
					
					
		}
				
		if(attacking_start_lag_time > attacking_start_lag_timer){
			//wind-up animation
			
			attacking_start_lag_timer++;
			//attacking_start_lag_timer = attacking_start_lag_time + 1;
				
			//x_vel = lerp(x_vel, leaping_speed * -sign(image_xscale), .05);


			show_debug_message("Phase 2! " + string(image_index));
					
				
		}else if(!landed){
			//Flying noodle mode!					
			
			if(!airborn){
				airborn = true;
				
				
				angle_diff = -darctan2(y-player.y,x - player.x) + 270;
				
				show_debug_message("ANGLE: " + string(angle_diff));
				
				x_vel = dsin(angle_diff) * leaping_speed;
				y_vel = dcos(angle_diff) * leaping_speed;
				
				y_vel -= overshoot;
			
			
				current_springy_gravity = regular_springy_gravity;
				
				
				image_xscale = abs(image_xscale) * -sign(x_vel);
			
			
			
				show_debug_message("Phase 3!");
			
			}
				
				
			if(image_index > image_number-1){
				image_speed = 0; 
				
				show_debug_message("Phase 4!");
				
			}
					
			if(place_meeting(x + x_vel, y + y_vel, obj_astronaut)){
				
				image_speed = 0;
				
				image_index = image_number-1;
				x_vel = 0;
				landed = true
				
				current_springy_gravity = 0;
				
				
				if(global.astronaut_current_state != global.astronaut_state_blocking){					
					player.current_hp -= damage_dealt;
					
					player.invincibility_timer = player.invincibility_frames;
					
					player.oogly_boogly_type = global.enemy_type_springpede; 
					
					show_debug_message("POKEY-POKE!");
				}else{
					player.x_vel = sign(player.x - x) * 6;
				}
				
				
				y_vel = 0;
				
				show_debug_message("Phase 5!");
			
			}
					
					
				
		} else{
			
			if(position_meeting(x + (80) * -sign(image_xscale), y, player) || check_tile_collision(x  -sign(image_xscale), y, self, global.ground_tiles)){
				x_vel = 0;

				current_springy_gravity = 0;
				
				y_vel = 0;
				
				//show_debug_message("HEEEEEEEEHH");
			
			}else{
				current_springy_gravity = regular_springy_gravity;
			}
			
			
			if(stuck_timer < stuck_time){
				stuck_timer++;
			
				//show_debug_message("YEEEEEEEE");
			
			}else{
				
				attacking_start_lag_timer = 0;
				
				airborn = false;
				
				landed = false;
				
				current_state = global.enemy_state_calm;
				
				stuck_timer = 0;
				
				current_springy_gravity = regular_springy_gravity;
				
				y -= sprite_height/2;
				
				sprite_index = spr_springpede_idle;
			
				image_speed = 1;
				
				show_debug_message("Phase 6!");
			
			}
		
		}
				
	
	break;
	
	
	

}


if(invincibility_timer > 0){
	invincibility_timer--;
	currently_invincible = true;
	
	image_blend = c_red;

}else{
	currently_invincible = false;
	
	image_blend = c_white;
}

if(current_hp <= 0 ){
	part_particles_create(parts, x, y+100, giblets, 10);
	
	instance_destroy();

}



//show_debug_message("Springy state: " + current_state);







var dir = sign(y_vel); 
for (i = 0; i < abs(y_vel); i++){
		
	platform_collision = check_tile_collision(x, y+dir, self, global.ground_tiles);
	
	 if(platform_collision){
		//We've hit something the springpede collides with -- time to stop moving them.
		y_vel = 0;

		if(airborn && !landed){
			
			image_speed = 0;
			
			image_index = image_number-1;

			landed = true;
			
			current_springy_gravity = 0;
			
			x_vel = 0;
		}
	

		
		break;
		
	}else{
		y = y + dir;
		
		//If this is the final inch, we also have to add the remaining decimal numbers!
		if(dir < 0){
		
			if( floor(abs(y_vel)) == i){
				remaining_y = y_vel - floor(y_vel);
			
				y += remaining_y;
			}
		
		} else if(dir > 0){
			if( floor(abs(y_vel)) == i){
				remaining_y = y_vel - ceil(y_vel);
			
				y += remaining_y;
			}
			
		}
		
		
	}
}










//This for-loop is the same as the one above, but it works for the x axis instead of the y axis.
var dir = sign(x_vel); 
for (i = 0; i < abs(x_vel); i++){
		
	platform_collision = check_tile_collision(x + dir, y, self, global.ground_tiles);
	
	if(platform_collision){
			
		
		if(airborn && !landed){
			
			image_speed = 0;
			
			image_index = image_number-1;
			
			//show_debug_message("SPLORSHH");
			
			current_springy_gravity = 0;
			
			landed = true
			
			y_vel = 0;
	
		}
			
			
		//We've hit something the springpede collides with -- time to stop moving them.
		x_vel = 0;	
		
		//landed = true;
			
		break;
		
	}else{
		x = x + dir;
		
		//If this is the final inch, we also have to add the remaining decimal numbers!
		if(dir < 0){
		
			if( floor(abs(x_vel)) == i){
				remaining_x = x_vel - floor(x_vel);
			
				//show_debug_message(string(remaining_x));
	
				x += remaining_x;
			}
		
		} else if(dir > 0){
			if( floor(abs(x_vel)) == i){
				remaining_x = x_vel - ceil(x_vel);
			
				//show_debug_message(string(remaining_x));
	
				x += remaining_x;
			}
			
		}
		
		
	}
}

