/// @description Insert description here
// You can write your code in this editor


switch(global.death_current_state){

	case global.death_state_alive:
	
		
		if(!global.astronaut.alive){
			global.death_current_state = global.death_state_fading;

		}
	
	break;
	
	
	
	case global.death_state_fading:
		image_alpha = lerp(image_alpha, 1, fade_lerp_speed);	
	
		if(image_alpha > .95){
			image_alpha = 1;
			
			global.death_current_state = global.death_state_jumpscare;
			
			
			
			//Jumpscare noises go here!
			
		}
	break;
	
	case global.death_state_jumpscare:
	
		draw_jumpscare = true;
		
		if(jumpscare_persistence_timer < jumpscare_persistence){
			jumpscare_persistence_timer++
		
		}else{
			
			jumpscare_persistence_timer = 0;
			
			draw_jumpscare = false;
			
			draw_restart_message = true;
			
			global.death_current_state = global.death_state_continue;
		
		}
	
	break;
	
	
	case global.death_state_continue:
	
		if(keyboard_check_released(vk_space)){
			room_goto(rm_level);
		}
	
	break;


}

