/// @description Insert description here
// You can write your code in this editor

enemy_collision = instance_place(x,y, obj_enemy_parent);

if(enemy_collision){
	if(!enemy_collision.currently_invincible){
		enemy_collision.current_hp--;
		enemy_collision.invincibility_timer = enemy_collision.invincibility_frames;

	}

	instance_destroy();
}




bullet_collision = instance_place(x,y, obj_bullet);

if(bullet_collision){
	instance_destroy(bullet_collision);
	instance_destroy();
	
}



