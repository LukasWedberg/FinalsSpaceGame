/// @description Insert description here
// You can write your code in this editor

if(global.parts_collected == 2 and open_passage == false){
	open_passage = true;
	
	//Open up the boss door here!

}

player_nearby = place_meeting(x,y, obj_astronaut)

interaction_key_pressed = keyboard_check_released(ord("R"));

if(player_nearby){
	
	if(global.parts_collected > image_index){
		display_repair_message = true;
	}else{
		display_repair_message = false
	}
	
	if(interaction_key_pressed){
	

		if(ready_for_ending ){
		//play the ending here!
	
	
		}else{
			image_index = global.parts_collected;
		
		
		
		}



	}
	
}else{
	display_repair_message = false

}


