/// @description Here we handle player collisions, respawning, gravity, and animation!


x_vel *= .9;

y_vel += player_gravity;

if(respawn_timer > 0){
	respawn_timer -= 1;
	if(respawn_timer == 0){ 

		audio_play_sound(snd_revive, 10,false);

		x = round(random_range(room_width* 0.25, room_width * .75));
		y = room_height;
		x_vel = (x - room_width * 0.5) * random_range(0.1,0.2);
		y_vel = respawn_vel;
		
		rx = 0;
		ry = 0;
		onscreen = true;		
	}
}



rx += x_vel;
ry += y_vel;

var to_move_x = round(rx);
var to_move_y = round(ry);

rx -= to_move_x;
ry -= to_move_y;

var sy = sign(to_move_y);

var dist_to_right_wall = (room_width - x) - 10;
var dist_to_left_wall = x - (sprite_width/2);

if(to_move_x >= dist_to_right_wall){
	x = room_width - (sprite_width/2)
	x_vel = abs(x_vel) * -1;
	rx = 0;
	audio_play_sound(snd_wall, 10, false);
	
}else if(to_move_x < -dist_to_left_wall){
	x = sprite_width/2;
	x_vel = abs(x_vel);
	rx = 0;
	audio_play_sound(snd_wall, 10,false);
	
} else{
	x += to_move_x;
}

if(onscreen){
	while(to_move_y != 0){
		var colliding = false;
		var collide_with = noone;
	
		if(sy >= 0){
			collide_with = instance_place(x,y + sy, obj_player);
			if(collide_with != noone){
				if(position_meeting(x,y + sprite_height/2, collide_with) == false){
					if(collide_with.onscreen == true){
						show_debug_message("It's a me, Jumpy-o!");
						colliding = true;
						collide_with.y_vel = max(0, collide_with.y_vel + 2);
						collide_with.onscreen = false;
						collide_with.respawn_timer = respawn_time;
						player_score++;
						audio_play_sound(snd_stomp, 10, false);
						make_stars(x,y);
					}
				}
		
			} else {
		
				collide_with = instance_place(x,y + sy, obj_cloud); 
				if(collide_with != noone){
					if(position_meeting(x,y+sprite_height/2,obj_cloud) == true){
						colliding = true;
	
	
						collide_with.image_index = 3;
	
						collide_with.image_speed = 1;	
						
						audio_play_sound(snd_jump, 10, false);
						
					}
				}
			}
		}
	
		if(!colliding){
			y += sy;
			to_move_y -= sy;
		}else{
			y = y + sy;
			y_vel = bounce_vel;
			ry = 0;
			show_debug_message(colliding);
			break;
		}
	
	}

	if((y > room_height) && (respawn_timer == 0)){
		make_stars(x,y)
		audio_play_sound(snd_die, 10, false);
		y = room_height + sprite_height/2;
		x = room_width/2;
		onscreen = false;
		x_vel = 0;
		y_vel = 0;
		respawn_timer = respawn_time;
		player_score--;
	}
} else {

	y += to_move_y;

}

if(keyboard_check(left_key)){
	x_vel -= player_accel;
}
if(keyboard_check(right_key)){
	x_vel += player_accel;
}


if(onscreen){
	if(y_vel > 0){
		image_index = 1;
		if(y_vel > 2){
			image_index = 2;
		}


	}else{
		image_index = 0;
	}
	
	if(x_vel < 0){
		image_xscale = abs(image_xscale);
	}else{
		image_xscale = -abs(image_xscale);
	}
	
	
}else{
	image_index = 3;
}



