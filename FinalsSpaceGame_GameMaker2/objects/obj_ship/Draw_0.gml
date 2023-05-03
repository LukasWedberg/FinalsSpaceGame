/// @description Insert description here
// You can write your code in this editor

draw_self();


if(display_repair_message && global.astronaut.alive){
	
	draw_set_font(fnt_popup);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_set_color(c_lime);
	
	draw_text(x - 100, y - 50, "Press 'R' to repair the ship!" );


}

