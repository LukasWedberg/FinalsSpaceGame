/// @description Insert description here
// You can write your code in this editor

y_vel += pointy_gravity;


switch(current_state){

	case global.enemy_state_calm:
	
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
		
			if(player_distance < attacking_distance || attacking_start_lag_timer > 0 ){
				
				x_vel *= .8;	
				
				sprite_index = spr_pointhead_attack;
				
				if(attacking_start_lag_timer == 0){
					image_index = 0;			
				}
				
				if(image_index < image_number-1){
					
					attacking_start_lag_timer++;
					
					//image_angle = random(360);// I made the enemy spin (when winding up for an attack) just for testing purposes!
				
				}else{
					//Put attacking animations and sounds here!
					
					if(player_distance < attacking_distance && global.astronaut_current_state != global.astronaut_state_blocking){
				
						show_debug_message("BOO!: " + string(current_time) );	
				
						player.current_hp = 0;
						
						player.oogly_boogly_type = enemy_type;
					
					}
					
					attacking_start_lag_timer = 0;
				
					image_angle = 0;
					
					sprite_index = spr_pointhead_idle;
					
					x_vel = 0;
					
					current_state = global.enemy_state_bracing_for_battle;
					
					aggro_countdown_timer = aggro_countdown_time*1.5;
					
				}
		
			}else{
			
				var move_direction = sign(player.x - x);
				
				image_xscale = abs(image_xscale) * -move_direction;
		
				sprite_index = spr_pointhead_walk;
				
				
				
				//The next few lines are commented out, but only optionally. They give the pointhead more of a "lurch-y" walk.
				
				//var walk_alpha = (sin(current_time*franticness) + 1)/2
				//image_speed = walk_alpha;
		
				x_vel = (move_speed * move_direction)// * walk_alpha;
				
				
				
			}
	
		}else{
			current_state = global.enemy_state_calm;
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
	part_particles_create(parts, x, y+sprite_height/2, giblets, 10);
	
	instance_destroy();

}








grounded = false;
var dir = sign(y_vel); 
for (i = 0; i < abs(y_vel); i++){
		
	platform_collision = check_tile_collision(x, y+dir, self, global.ground_tiles);
	
	 if(platform_collision){
			
		//We've hit something the pointhead collides with -- time to stop moving them.
		y_vel = 0;
		
		grounded = true;
		
		break;
		
	}else{
		y = y + dir;
		
		//If this is the final inch, we also have to add the remaining decimal numbers!
		if(dir < 0){
		
			if( floor(abs(y_vel)) == i){
				remaining_y = y_vel - floor(y_vel);
			
				x += remaining_x;
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
			
		//We've hit something the pointhead collides with -- time to stop moving them.
		x_vel = 0;			
			
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

