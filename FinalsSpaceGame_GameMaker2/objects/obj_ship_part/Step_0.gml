/// @description Insert description here
// You can write your code in this editor


if(!collected){
	
	if(position_meeting(x,y, obj_astronaut) and point_distance(x,y, assembled_position_x, assembled_position_y) > 3){
		collected = true;
		
		x = assembled_position_x;
		y = assembled_position_y;
	
		global.parts_collected++;
		
		global.astronaut.current_hp = global.astronaut.maximum_hp;

		

	}

}
