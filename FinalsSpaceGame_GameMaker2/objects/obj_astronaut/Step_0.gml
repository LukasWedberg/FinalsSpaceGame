/// @description Insert description here
// You can write your code in this editor


//checking for input here!
jump_key_pressed = keyboard_check(vk_up);
left_key_pressed = keyboard_check(vk_left);
right_key_pressed = keyboard_check(vk_right);
ranged_key_pressed = keyboard_check(ord("E"));
shield_key_pressed = keyboard_check(ord("W"));
melee_key_pressed = keyboard_check(ord("Q"));

//show_debug_message(global.astronaut_current_state);



switch(global.astronaut_current_state){

	case global.astronaut_state_falling:
		
		y_vel += player_gravity;
		
		if(ranged_key_pressed){
			
			sprite_index = spr_player_jump_shoot;
			
		}else if(sword_active){
			sprite_index = spr_player_melee;	
			image_speed = 1;
		}else{
			sprite_index = spr_player_jump;
		
		}
		
		
		
	break;

	case global.astronaut_state_grounded:
	
	
		
		
		//Checking just below, for a floor!
		if(!check_tile_collision(x, y+2, obj_astronaut, global.ground_tiles)){
			
			show_debug_message(string(y_vel));
			global.astronaut_current_state = global.astronaut_state_falling;
			
			sprite_index = spr_player_jump;
		
		}else{
			
			if(abs(x_vel) > .3){

				if(ranged_key_pressed){
			
					sprite_index = spr_player_walk_shoot;
			
				}else{
					sprite_index = spr_player_walk;
				}
				
			}else if(ranged_key_pressed){
			
				sprite_index = spr_player_idle_shoot;
			
			}else{
				sprite_index = spr_player_idle;
				//show_debug_message("BOING: "  + string(current_time));
		
			}
		}
		
		if(jump_key_pressed){
	
	
			global.astronaut_current_state = global.astronaut_state_jumping;
			
			if(ranged_key_pressed){
			
				sprite_index = spr_player_jump_shoot;
			
			}else if(sword_active){
				sprite_index = spr_player_melee;	
				image_speed = 1;
			}
			
			else{
				sprite_index = spr_player_jump;
			}
			
			
			
		}


	break;



	case global.astronaut_state_jumping:
	
	
		if(jump_key_pressed){
	
			part_particles_create(parts, x - sign(image_xscale) * 15, y, jetpack, 5);			
			
	
			if(jump_hold_timer < jump_hold_frames_in_seconds){ 
	
				global.astronaut_current_state = global.astronaut_state_jumping;
	
				y_vel = jump_force;
		
				jump_hold_timer++;
		
			}else{
				global.astronaut_current_state = global.astronaut_state_falling;
				
				jump_hold_timer = 0;
			}
			
			if(ranged_key_pressed){
			
				sprite_index = spr_player_jump_shoot;
			
			}else if(sword_active){
				sprite_index = spr_player_melee;	
				image_speed = 1;
			}else{
				sprite_index = spr_player_jump;
		
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
			
			audio_sound_gain(snd_shield, 0, 500);
			
			sprite_index = spr_player_jump;
			global.astronaut_current_state = global.astronaut_state_falling;
		}
	
	
	break;


	case global.astronaut_state_knocked_out:
	
		if(respawn_timer < respawn_time){
			respawn_timer++;
		}else{
			respawn_timer = 0;
			
			
		
			show_debug_message("TIME TO GET UP: "  + string(current_time));

			
			global.astronaut_current_state = global.astronaut_state_respawning;
		}
	
	break;


	case global.astronaut_state_respawning:
	
			
	
	
	break;


}


if(alive && global.astronaut_current_state != global.astronaut_state_blocking){
	
	bullet_timer++;
	x_vel *= ground_friction;
	
	
	
	//Movement, here!
	//image_speed = 1;
	if(left_key_pressed){
		x_vel = -move_speed;
	
		image_xscale = -abs(image_xscale);
	
	}
	else if(right_key_pressed){
		x_vel = move_speed;
	
	
		image_xscale = abs(image_xscale);
	
	} else{
		//image_speed = 0;
	}
	
	
	
	if(shield_key_pressed && !sword_active){
		audio_sound_gain(snd_shield, 1, 0);
		audio_stop_sound(snd_shield);
		
		//Sprite changes and sound effects go here! 
		
		sprite_index = spr_shield;
		//image_speed = 1;
		
		if(!audio_is_playing(snd_shield)){
			
			audio_play_sound(snd_shield, 10, false,1);
		}
		
		global.astronaut_current_state = global.astronaut_state_blocking;
		
		
	
	}else if(ranged_key_pressed){
		if(bullet_timer < bullets_per_second){
		
		}else{
			
						
			
			//Here, we make a bullet! Put sound effects and animations here, too.
			
			audio_play_sound(snd_shoot, 10,false);
			
			var new_bullet = instance_create_depth(x,y-20, 0, obj_player_bullet);
			
			new_bullet.hspeed = bullet_speed * sign(image_xscale);
			
			new_bullet.image_xscale = sign(image_xscale);
			
			if(global.astronaut_current_state == global.astronaut_state_jumping || global.astronaut_current_state == global.astronaut_state_falling){
				sprite_index = spr_player_jump_shoot
			
			}else{
				sprite_index = spr_player_idle_shoot;
			}
			
			bullet_timer = 0;		
		}
		
	
	}else if(melee_key_pressed || sword_active){
		//
		sprite_index = spr_player_melee;	
		
		
		
		//if(image_index >= image_number){
			//image_index = 0;
		//}
	
		if(sword_frame_counter == 0){
			//image_speed = 1;
			image_index = 0;
		}
		
		sword_frame_counter++;
	
		//image_speed = 1;
		
		if(melee_key_pressed){
			sword_active = true;
		}
		
		//SO we can check for collisions using a timer or by using the image_index. 
		//I think it'll be better if we go with image_index, but that will be harder. 
		//Here goes nothing!
		
			
		
		if( (image_index >= image_number-1) ){// || (image_index == 0 && image_speed == -1) ){			
			enemy_struck = instance_place(x + sword_reach * sign(image_xscale),y, obj_enemy_parent);
			
			if(!audio_is_playing(snd_melee)){
				audio_play_sound(snd_melee, 10,false);
			}
			
			if(enemy_struck){
				enemy_struck.current_hp -=3;
				enemy_struck.invincibility_timer = enemy_struck.invincibility_frames;			
			}
			
			if(!melee_key_pressed){
				sword_active = false;
				sword_frame_counter = 0;
			}
		
			//image_speed = 0;
		
		}
		
		
		
		
		
	}else {
		
	}
	
	
	//Checking for collisions with enemy bullets!
	bullet_collision = instance_place(x,y, obj_bullet);

	if(bullet_collision){
		current_hp--;
		
		invincibility_timer = invincibility_frames;
		
		oogly_boogly_type = bullet_collision.sender.enemy_type;
		
		show_debug_message("OUCHIEEE: "  + string(current_time));
		
		instance_destroy(bullet_collision);		
		
	}
	
	if(invincibility_timer > 0){
		invincibility_timer--;
		currently_invincible = true;
	
		image_blend = c_red;

	}else{
		currently_invincible = false;
	
		image_blend = c_white;
	}
	
	
	if(current_hp <= 0){
			
		x_vel = 0;
		y_vel = 0;
			
		image_speed = 0;
		
		image_alpha = 0;
		
		show_debug_message("KO!");
		
		part_particles_create(parts, x, y+sprite_height/2, giblets, 10);
		
		audio_stop_all();
		
		instance_destroy( instance_find(obj_ambience,0) );
			
		audio_play_sound(snd_bones_snapping,10,false);
			
		global.astronaut_current_state = global.astronaut_state_knocked_out;
			
		alive = false;
		
			
	}
	
	

}








//These next two for-loops tackle collision. 

//We start by getting the direction of our movement, using 'sign()'.
var dir = sign(y_vel); 

//We check the space ahead of the player pixel by pixel, until we get farther than the absolute value of 'y_speed' which is how far the player will move this frame. 
//With each open pixel we find, the player is gradually moved forward.



for (i = 0; i < floor(abs(y_vel)); i++){
	//Checking for tile set collisions works a bit differently than testing for objects. It's checking for objects right now because "testing."
	
	bullet_collision = instance_place(x,y+dir*2.5, obj_bullet);
	
	//platform_collision = place_meeting(x,y+dir, obj_dummy_platform);
	platform_collision = check_tile_collision(x, y+dir*2.5, obj_astronaut, global.ground_tiles);
	
	enemy_collision = place_meeting(x,y+dir*2.5, obj_enemy_parent)
	
	if( (platform_collision || enemy_collision || bullet_collision) && global.astronaut_current_state == global.astronaut_state_blocking ){
			y_vel = -y_vel;
		
		
			//We're shifting the y over a tiny bit so we don't get stuck in the ground!
			
		
			if(!enemy_collision){
				y -= dir*6;		
			}
		
		
			show_debug_message("BOING: "  + string(current_time));
		
		
		
			//Down here we make some shield particles because we're bouncing!
			
			part_type_speed(bubble_bit, abs(y_vel), abs( y_vel*2) , -0.10, 0);
			
			part_particles_create(parts, x, y + (sprite_height/2) * dir , bubble_bit, 10);
		
		
						
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
for (i = 0; i < floor(abs(x_vel)); i++){
	
	bullet_collision = instance_place(x+dir*2,y, obj_bullet);
	
	//platform_collision = place_meeting(x+dir,y, obj_dummy_platform);
	platform_collision = check_tile_collision(x+dir*2, y, obj_astronaut, global.ground_tiles);

	
	if( (platform_collision || place_meeting(x+dir*2,y, obj_enemy_parent) || bullet_collision) && global.astronaut_current_state == global.astronaut_state_blocking ){
		//This first if-statement is for collisions when in bubble mode. 
		x_vel = -x_vel;
			
			
		//We're shifting the x over a tiny bit so we don't get stuck in the ground!
		x -= dir*3;
			
		show_debug_message("BOING: "  + string(current_time));
		
		
		
		//Down here we make some shield particles because we're bouncing!
		
		part_type_speed(bubble_bit, abs(x_vel), abs( x_vel*2) , -0.10, 0);
			
		part_particles_create(parts, x + (sprite_width/2) * dir, y, bubble_bit, 10);
		
		
					
		if(bullet_collision){
				
			//x_vel = bullet_collision.direction_x * bullet_collision.bullet_speed;
			
			instance_destroy(bullet_collision);
		}
		
		
	}else if(platform_collision){
			
		//We've hit something the player collides with -- time to stop moving them.
		x_vel = 0;
			
		show_debug_message("PLATFORME: "  + string(current_time));
		
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
