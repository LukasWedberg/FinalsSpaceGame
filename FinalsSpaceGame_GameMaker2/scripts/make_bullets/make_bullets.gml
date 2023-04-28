// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.bullet_technique_standard = "standard";


function make_bullets(origin_x, origin_y, target_x, target_y, technique){
	switch(technique) {
	
		case global.bullet_technique_standard:
		
			var new_bullet = instance_create_depth(origin_x, origin_y, 0, obj_bullet);
		
			new_bullet.target_x = target_x;
			new_bullet.target_y = target_y;
			
			new_bullet.bullet_direction = point_direction(target_x, target_y,new_bullet.x, new_bullet.y) - 90;
		
			new_bullet.direction_x = dsin(new_bullet.bullet_direction);
			new_bullet.direction_y = dcos(new_bullet.bullet_direction);
		
		
		
		
		break;
	
	
	}
	


}