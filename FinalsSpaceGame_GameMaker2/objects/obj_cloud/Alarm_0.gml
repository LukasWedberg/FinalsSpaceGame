/// @description This alarm manages the cloud's growth.


if(image_speed == 0){
	cloud_index++;

	image_index = 0;

	image_speed = 1;
	

	sprite_index = cloud_sprites[cloud_index];

	
	if(cloud_index + 1 != array_length(cloud_sprites)){
		alarm[0] = room_speed * growth_rate;
	}
}