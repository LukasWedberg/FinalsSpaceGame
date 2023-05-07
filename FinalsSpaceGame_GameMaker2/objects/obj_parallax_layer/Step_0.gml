/// @description Insert description here
// You can write your code in this editor

decoration_number = instance_number(obj_parallax_parent);

for(i = 0; i < decoration_number; i++ ){
	current_object = instance_find(obj_parallax_parent, i);
	
	
	current_object.x = lerp(current_object.starting_x, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 , (abs(current_object.depth)) /200);
	
	current_object.y = lerp(current_object.starting_y, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2, (abs(current_object.depth))/200);
	
	//show_debug_message(current_object.x);
	
}

