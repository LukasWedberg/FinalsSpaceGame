/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
	
draw_set_font(fnt_title_cinema);
	
draw_set_halign(fa_center);
draw_set_valign(fa_center);
	
draw_text_ext(x,y, message_to_display, 100 ,room_width-100);

if(display_title){
	
	draw_set_font(fnt_title);
	draw_text(x,200, "S.P.A.C.E");
	
	
	draw_set_font(fnt_button);
	
	draw_text(button.x + 3, button.y, "START")

}