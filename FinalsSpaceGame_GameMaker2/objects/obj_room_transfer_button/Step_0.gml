/// @description Insert description here
// You can write your code in this editor

//So first we check if the mouse is over the button
if(position_meeting(mouse_x,mouse_y,id)){
	show_debug_message("CLICK!");
	if(mouse_check_button_released(mb_left)){
		//If the mouse is over the button, and the player releases a mouse button click, then that means they are ready to change rooms!
		//This line down here sends the players to a new room.
		room_goto(room_to_go_to);
	}
}

