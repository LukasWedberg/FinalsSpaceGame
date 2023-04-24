/// @description We begin this stars' animation after a random delay. After the animation plays, we destroy this star!

if(frames > star_anim_delay){
	image_speed = 1;
}

if (image_speed > 0)
{
    if (image_index >= image_number - 1){ 
		
		instance_destroy();
		
	}
}

frames++;

