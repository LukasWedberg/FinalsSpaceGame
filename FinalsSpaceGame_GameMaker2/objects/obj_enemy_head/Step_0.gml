/// @description Insert description here
// You can write your code in this editor

switch(current_state) {

	case global.enemy_state_calm:
		y = lerp(y, calm_height, aggro_levitation_lerp_speed);
		
		if(point_distance(player.x, player.y, x, y ) <= aggro_distance) {
		
			//Play noises or make sprite changes here!
		
			target_x = player.x;
			target_y = player.y;
			
		
			current_state = global.enemy_state_bracing_for_battle;
		}
	
	
	break;
	
	
	case global.enemy_state_bracing_for_battle:
		y = lerp(y, aggro_levitation_height, aggro_levitation_lerp_speed);
		
		if(abs(y-aggro_levitation_height) <= .1){
			current_state = global.enemy_state_attacking;
		}		
	
	break;
	
	
	case global.enemy_state_attacking:
		//show_debug_message("UNINTELLIGABLE SCREAMING");
		
		if(bullet_timer < bullets_per_second){
			bullet_timer++;
		
		}else{
			
			bullet_timer = 0;
			//show_debug_message("PEW PEW: " + string(current_time));
			
			if(point_distance(player.x, player.y, x, y ) > calm_distance) {
		
				//Play calm noises or make sprite changes here!
			
		
				current_state = global.enemy_state_calm;
				
				bullet_timer = bullets_per_second;
			}else{
				
				target_x = global.astronaut.x;
				target_y = global.astronaut.y;
				
				//play bullet noises or make sprite changes here!
				make_bullets(x,y, target_x, target_y, global.bullet_technique_standard);
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
	instance_destroy();

}