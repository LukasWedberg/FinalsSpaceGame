/// @description Insert description here
// You can write your code in this editor

switch(bullet_technique){
	
	
	case global.bullet_technique_standard:
	
		x += direction_x * bullet_speed;
		y += direction_y * bullet_speed;

		
	
	break;
	
	
	
}



if(point_distance(x,y, target_x, target_y) < bullet_speed){
	instance_destroy();

}