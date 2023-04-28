/// @description Insert description here
// You can write your code in this editor


//checking for input here!
jump_key_pressed = keyboard_check(vk_up);
left_key_pressed = keyboard_check(vk_left);
right_key_pressed = keyboard_check(vk_right);
ranged_key_pressed = keyboard_check(ord("E"));
shield_key_pressed = keyboard_check(ord("W"));







switch(global.astronaut_current_state){

	case global.astronaut_state_falling:
		
		y_vel += player_gravity;
		
		
		
	break;

	case global.astronaut_state_grounded:
	
	
		if(jump_key_pressed){
	
	
			global.astronaut_current_state = global.astronaut_state_jumping;
			
		}
		
		
		//Checking just below, for a floor!
		if(!place_meeting(x,y+1, obj_dummy_platform)){
			
			show_debug_message(string(y_vel));
			global.astronaut_current_state = global.astronaut_state_falling;
		
		}
		


	break;



	case global.astronaut_state_jumping:
	
	
		if(jump_key_pressed){
	
			if(jump_hold_timer < jump_hold_frames_in_seconds){ 
	
				global.astronaut_current_state = global.astronaut_state_jumping;
	
				y_vel = jump_force;
		
				jump_hold_timer++;
		
			}else{
				global.astronaut_current_state = global.astronaut_state_falling;
				
				jump_hold_timer = 0;
			}
			
			
		}else{
			global.astronaut_current_state = global.astronaut_state_falling;
		}

	
	break;
	
	
	case global.astronaut_state_blocking:
	
		if(shield_key_pressed){
		
		
		}else{
			
			//this is where we switch back to non-bouncing mode!
			//Sprite changes and sounds go here!
			
			sprite_index = spr_proto_space_man;
			global.astronaut_current_state = global.astronaut_state_falling;
		}
	
	
	break;



}


if(global.astronaut_current_state != global.astronaut_state_knocked_out && global.astronaut_current_state != global.astronaut_state_blocking){
	
	bullet_timer++;
	x_vel *= ground_friction;
	
	
	
		//Movement, here!
	image_speed = 1;
	if(left_key_pressed){
		x_vel = -move_speed;
	
		image_xscale = -abs(image_xscale);
	
	}
	else if(right_key_pressed){
		x_vel = move_speed;
	
	
		image_xscale = abs(image_xscale);
	
	} else{
		image_speed = 0;
	}
	
	
	
	if(shield_key_pressed){
		
		
		//Sprite changes and sound effects go here! 
		
		sprite_index = spr_testing_shield;
		image_speed = 1;
		
		
		global.astronaut_current_state = global.astronaut_state_blocking;
		
		
	
	}else if(ranged_key_pressed){
		if(bullet_timer < bullets_per_second){
		
		}else{
			
			
			
			//Here, we make a bul5let! Put sound effects and animations here, too.
			
			var new_bullet = instance_create_depth(x,y, 0, obj_player_bullet);
			
			new_bullet.hspeed = bullet_speed * sign(image_xscale);
			
			bullet_timer = 0;		
		}
		
	
	}
	

}








//These next two for-loops tackle collision. 

//We start by getting the direction of our movement, using 'sign()'.
var dir = sign(y_vel); 

//We check the space ahead of the player pixel by pixel, until we get farther than the absolute value of 'y_speed' which is how far the player will move this frame. 
//With each open pixel we find, the player is gradually moved forward.



for (i = 0; i < abs(y_vel); i++){
	//Checking for tile set collisions works a bit differently than testing for objects. It's checking for objects right now because "testing."
	
	bullet_collision = instance_place(x,y+dir, obj_bullet);
	
	platform_collision = place_meeting(x,y+dir, obj_dummy_platform);
	
	if( (platform_collision || place_meeting(x,y+dir, obj_enemy) || bullet_collision) && global.astronaut_current_state == global.astronaut_state_blocking ){
			y_vel = -y_vel;
		
			y -= dir;
		
			show_debug_message("BOING: "  + string(current_time));
		
						
			if(bullet_collision){
				instance_destroy(bullet_collision);
			}
		
		
		}else if(platform_collision){
			
			//We've hit something the player collides with -- time to stop moving them.
			y_vel = 0;
			
			show_debug_message("PLATFORME:" + string(current_time));
		
		
			//We'll need to watch this next line carefully! 
			//It works right now because we're only checkig for collisions with the floor
			//When tile sets are added, we'll have to check for the cieling seperately. 
			//Otherwise, the state would become 'grounded' upon collision with the cieling!
			global.astronaut_current_state = global.astronaut_state_grounded;
		
		break;
	}else{
		//This is where we move the player -- the loop inches them along a pixel at a time.
		y = y + dir;
		
		
		//If this is the final inch, we also have to add the remaining decimal numbers!
		if(dir < 0){
		
			if( floor(abs(y_vel)) == i){
				remaining_y = y_vel - floor(y_vel);
			
				//show_debug_message(string(remaining_y));
	
				y += remaining_y;
			}
		
		} else if(dir > 0){
			if( floor(abs(y_vel)) == i){
				remaining_y = y_vel - ceil(y_vel);
			
				//show_debug_message(string(remaining_y));
	
				y += remaining_y;
			}
			
		}
		
	}
}



//This for-loop is the same as the one above, but it works for the x axis instead of the y axis.
var dir = sign(x_vel); 
for (i = 0; i < abs(x_vel); i++){
	
	bullet_collision = instance_place(x+dir,y, obj_bullet);
	
	platform_collision = place_meeting(x+dir,y, obj_dummy_platform);
	
	if( (platform_collision || place_meeting(x+dir,y, obj_enemy) || bullet_collision) && global.astronaut_current_state == global.astronaut_state_blocking ){
			//This first if-statement is for collisions when in bubble mode. 
			x_vel = -x_vel;
			
			x -= dir;
			
			
			show_debug_message("BOING: "  + string(current_time));
		
						
			if(bullet_collision){
				instance_destroy(bullet_collision);
			}
		
		
		}else if(platform_collision){
			
			//We've hit something the player collides with -- time to stop moving them.
			x_vel = 0;
			
			show_debug_message("PLATFORME: "  + string(current_time));
		
		
			//We'll need to watch this next line carefully! 
			//It works right now because we're only checkig for collisions with the floor
			//When tile sets are added, we'll have to check for the cieling seperately. 
			//Otherwise, the state would become 'grounded' upon collision with the cieling!
			global.astronaut_current_state = global.astronaut_state_grounded;
		
		break;
		
		}else if(platform_collision){
			
			//We've hit something the player collides with -- time to stop moving them.
			x_vel = 0;
		
		
			//We'll need to watch this next line carefully! 
			//It works right now because we're only checkig for collisions with the floor
			//When tile sets are added, we'll have to check for the cieling seperately. 
			//Otherwise, the state would become 'grounded' upon collision with the cieling!
			global.astronaut_current_state = global.astronaut_state_grounded;
		
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