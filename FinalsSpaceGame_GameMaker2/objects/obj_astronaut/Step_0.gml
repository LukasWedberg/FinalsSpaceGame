/// @description Insert description here
// You can write your code in this editor


//checking for input here!
jump_key_pressed = keyboard_check(vk_up);
left_key_pressed = keyboard_check(vk_left);
right_key_pressed = keyboard_check(vk_right);




x_vel *= ground_friction;


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



}

//Movement, here!
if(left_key_pressed){
	x_vel = -move_speed
}
if(right_key_pressed){
	x_vel = move_speed
}










//These next two for-loops tackle collision. 

//We start by getting the direction of our movement, using 'sign()'.
var dir = sign(y_vel); 

//We check the space ahead of the player pixel by pixel, until we get farther than the absolute value of 'y_speed' which is how far the player will move this frame. 
//With each open pixel we find, the player is gradually moved forward.



for (i = 0; i < abs(y_vel); i++){
	//Checking for tile set collisions works a bit differently than testing for objects. It's checking for objects right now because "testing."
	if(place_meeting(x,y+dir, obj_dummy_platform)){
		//We've hit something the player collides with -- time to stop moving them.
		y_vel = 0;
		
		
		//We'll need to watch this next line carefully! 
		//It works right now because we're only checkig for collisions with the floor
		//When tile sets are added, we'll have to check for the cieling seperately. 
		//Otherwise, the state would become 'grounded' upon collision with the cieling!
		global.astronaut_current_state = global.astronaut_state_grounded;
		
		break
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
	if(place_meeting(x + dir,y, obj_dummy_platform)){
		x_vel = 0;
		break
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