/// @description This object also draws the points of the players. 


draw_set_font(fnt_score);

draw_set_valign(fa_middle);
draw_set_halign(fa_left);


points_elevation = camera_get_view_y(view_camera[0]) + points_vertical_padding;

draw_text_color(8, points_elevation, string(subject_two.player_score), c_red,c_red, c_maroon,c_maroon,1);


draw_set_halign(fa_right);

draw_text_color(room_width -8, points_elevation, string(subject_one.player_score), c_lime,c_lime, c_green,c_green,1);


