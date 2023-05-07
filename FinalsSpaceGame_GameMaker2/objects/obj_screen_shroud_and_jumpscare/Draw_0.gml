/// @description Insert description here
// You can write your code in this editor




if(draw_jumpscare){
	
	draw_set_alpha(1);
	draw_sprite(spr_screen_fade,0,x,y);
}

draw_self();

if(draw_restart_message){
	
	text_alpha = lerp(text_alpha, 1, .01);
	
	
	draw_set_alpha(text_alpha);
	
	draw_set_color(c_red);
	
	draw_set_font(fnt_score);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_text(x-200, y -150, "Killed by:\n" + global.astronaut.oogly_boogly_type);
	
	draw_text(x-200,y + 150, "Press 'space' \n to try again.")
	
	draw_set_alpha(1);
	
}

