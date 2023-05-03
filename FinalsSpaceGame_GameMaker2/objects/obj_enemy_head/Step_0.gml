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
				
		
		var player_dist = point_distance(player.x, player.y, x, y );
		
		if(bullet_timer < bullets_per_second){
			bullet_timer++;
			
			var move_direction = sign(player.x - x);
				
			if(move_direction != 0){
				image_xscale = abs(image_xscale) * -move_direction;
			}
			
			if(point_distance(player.x, player.y, x, y ) > attacking_distance){
		
				sprite_index = spr_head_walk;
				
				
				
				//The next few lines are commented out, but only optionally. They give the pointhead more of a "lurch-y" walk.
				
				//var walk_alpha = (sin(current_time*franticness) + 1)/2
				//image_speed = walk_alpha;
		
				x += (move_speed * move_direction)// * walk_alpha;
				
				
			}
			
		
		}else{ //if(player_dist <= attacking_distance) {
			//show_debug_message("PEW PEW: " + string(current_time));
			
			if(point_distance(player.x, player.y, x, y ) > calm_distance || !player.alive) {
		
				//Play calm noises or make sprite changes here!
			
		
				current_state = global.enemy_state_calm;
				
				bullet_timer = bullets_per_second;
			}else{
				
				if(sprite_index != spr_head_attack){
					sprite_index = spr_head_attack
				
				
				}else {
				
				
					if(image_index > image_number-1){
						
						target_x = global.astronaut.x;
						target_y = global.astronaut.y;
				
						//play bullet noises or make sprite changes here!
						make_bullets(self, x, y, target_x, target_y, global.bullet_technique_standard);
			
						bullet_timer = 0;
						
						sprite_index = spr_head_idle;
			
					}
				
				
				}
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
	
	part_particles_create(parts, x, y + 80, giblets, 10);

}