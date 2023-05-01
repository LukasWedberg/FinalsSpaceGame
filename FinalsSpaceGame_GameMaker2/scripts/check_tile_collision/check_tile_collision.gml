// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information





function check_tile_collision(x_pos,y_pos, object_checking, tilemap_id){

	obj_x_pos = object_checking.x;
	obj_y_pos = object_checking.y;

	var _x1 = tilemap_get_cell_x_at_pixel(tilemap_id, bbox_left + (x_pos - obj_x_pos), obj_y_pos),
    _y1 = tilemap_get_cell_y_at_pixel(tilemap_id, obj_x_pos, bbox_top + (y_pos - obj_y_pos)),
    _x2 = tilemap_get_cell_x_at_pixel(tilemap_id, bbox_right + (x_pos - obj_x_pos), obj_y_pos),
    _y2 = tilemap_get_cell_y_at_pixel(tilemap_id, obj_x_pos, bbox_bottom + (y_pos - obj_y_pos));

	

	//for(var _x = _x1; _x <= _x2; _x++){
	 //for(var _y = _y1; _y <= _y2; _y++){
	   //if(tile_get_index(tilemap_get(tilemap_id, _x, _y))){
	    //return true;
	   //}
	 //}
	//}
	
	if(tile_get_index(tilemap_get(tilemap_id, _x1, _y1))){
		return true;
	} 
	if(tile_get_index(tilemap_get(tilemap_id, _x2, _y2))){
		return true;
	} 
	if(tile_get_index(tilemap_get(tilemap_id, _x1, _y2))){
		return true;
	} 
	if(tile_get_index(tilemap_get(tilemap_id, _x2, _y1))){
		return true;
	} 
	
	

	return false;

}