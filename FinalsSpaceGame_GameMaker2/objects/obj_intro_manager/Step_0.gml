/// @description Insert description here
// You can write your code in this editor

cinematic_timer++;

if(cinematic_timer < room_speed * 18){

		
	

}else if(cinematic_timer < room_speed * 38){

	message_to_display = " ''A LONE TRAVELER CRASHLANDS ON A MYSTERIOUS PLANET. IT'S QUIET BUT YOU FEEL CREATURES HOSTILE BEYOND COMPREHENSION ARE CLOSE -- they ARE CLOSING IN ON YOU FAST. YOU MUST FIND A WAY TO GET OUT OF THIS HELL.'' ";
} else if(cinematic_timer < room_speed * 56){

	message_to_display = "* ARROW KEYS TO MOVE AND JUMP \n* Q - MELEE, W - SHIELD, E - SHOOT \n* SURVIVE THE MONSTERS \n* COLLECT ALL THREE SHIP COMPONENTS TO REBUILD YOUR SHIP \n\n ''GOOD LUCK''";

} else{
	
	if(!display_title){
		display_title = true;
	
		message_to_display = "";
		
		lil_guy = instance_nearest(x,y,obj_little_spinning_guy);
		
		make_stars(lil_guy.x, lil_guy.y);
		
		lil_guy.hspeed = -4;
		
		//instance_destroy(lil_guy.id);
	
	
		button = instance_create_depth(x, room_height - 200, 10 , obj_room_transfer_button);
	
	}
	
	

}