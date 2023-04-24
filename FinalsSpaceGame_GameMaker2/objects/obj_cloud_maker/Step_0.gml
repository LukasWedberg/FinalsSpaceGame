/// @description This spawns clouds every few frames, unless the number of clouds is satisfactory.

frames_since_last_cloud ++;

if(frames_since_last_cloud >= cloud_spawning_frames_increment){

	cloud_number = instance_number(obj_cloud);

	if(cloud_number < preferred_cloud_number){
		var new_cloud = instance_create_depth(irandom_range(cloud_horizontal_padding, room_width - cloud_horizontal_padding), irandom_range(maximum_cloud_height, minimum_cloud_height), 0, obj_cloud);

		var tries = 0;
	
		cx = new_cloud.x;
		cy = new_cloud.y;
	
		while(collision_rectangle(cx - new_cloud.sprite_width, cy - new_cloud.sprite_height, cx + new_cloud.sprite_width, cy + new_cloud.sprite_height, obj_cloud, false, true) != noone && tries < 30000){
			new_cloud.x = irandom_range(cloud_horizontal_padding, room_width - cloud_horizontal_padding);
			new_cloud.y = irandom_range(maximum_cloud_height, minimum_cloud_height); 
			tries += 1;
		}

		frames_since_last_cloud = 0;

	}
}
