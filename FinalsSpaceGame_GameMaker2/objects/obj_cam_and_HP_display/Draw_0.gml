/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < global.astronaut.current_hp; i++){
	draw_sprite(spr_heart, 0, draw_hearts_x + (heart_x_padding * i), draw_hearts_y);

}