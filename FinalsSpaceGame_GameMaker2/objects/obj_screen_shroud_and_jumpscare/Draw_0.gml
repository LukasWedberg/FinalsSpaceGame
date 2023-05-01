/// @description Insert description here
// You can write your code in this editor


draw_self();

if(draw_jumpscare){
	draw_sprite(spr_testing_jumpscare,irandom(2),x,y);
}else if(draw_restart_message){
	draw_set_color(c_red);
	
	draw_set_font(fnt_score);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text(x,y, "Press 'space' to try again. :)")
}