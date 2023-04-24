// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function make_stars(stars_origin_x, stars_origin_y){
	stars_number = irandom_range(7,9);
	
	for(var i = 0; i < stars_number; i++;){
		instance_create_depth(stars_origin_x, stars_origin_y, -100, obj_star);
	}
	
	
}