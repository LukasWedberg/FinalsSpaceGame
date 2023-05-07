/// @description Insert description here
// You can write your code in this editor


switch(global.death_current_state){

	case global.death_state_alive:
	
		image_alpha = lerp(image_alpha, 0, intro_lerp_speed);
		
		if(!global.astronaut.alive){
			global.death_current_state = global.death_state_fading;
		}
	
	break;
	
	
	
	case global.death_state_fading:
		image_alpha = lerp(image_alpha, 1, fade_lerp_speed);	
	
		if(image_alpha > .95){
			image_alpha = 1;
			
			
			
			if(jumpscare_countdown > 0 ){
				jumpscare_countdown--;
			
			}else{
				
				global.death_current_state = global.death_state_jumpscare;
			
				draw_jumpscare = true;
			
				image_xscale = .3;
				image_yscale = .3;
			
				center_x = x;
				center_y = y;
			
				switch(global.astronaut.oogly_boogly_type){
			
				case global.enemy_type_head:
			
					sprite_index = spr_jumpscare_head;

				
					//Jumpscare noises go here!
				
				
					audio_play_sound(snd_head_jumpscare,10,false);
			
				break;
			
				case global.enemy_type_pointhead:
			
					sprite_index = spr_jumpscare_pointhead;

				
					//Jumpscare noises go here!
				
					audio_play_sound(snd_pointhead_jumpscare,10,false);
			
				break;
			
				case global.enemy_type_springpede:
			
					sprite_index = spr_jumpscare_springpede;

				
					//Jumpscare noises go here!
				
					audio_play_sound(snd_springpede_jumpscare,10,false);
			
				break;
			
			
			
			
			}			
			
		}
		
		
		}
	break;
	
	case global.death_state_jumpscare:
	
		//draw_jumpscare = true;
		
		if(jumpscare_persistence_timer < jumpscare_persistence){
			jumpscare_persistence_timer++
		
			x = center_x + random(shakiness * choose(-1,1) * (1- (jumpscare_persistence_timer/jumpscare_persistence) ) );
			y = center_y + random(shakiness * choose(-1,1) * (1- (jumpscare_persistence_timer/jumpscare_persistence) ) );
		
			
		
		}else{
			
			jumpscare_persistence_timer = 0;
			
			//draw_jumpscare = false;
			
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

