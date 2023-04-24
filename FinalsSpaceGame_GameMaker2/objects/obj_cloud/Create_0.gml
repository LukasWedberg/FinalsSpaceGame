/// @description Here are some tunables for how clouds grow, in addition to a list of the four different cloud sprites.


growth_rate = 6;

cloud_sprites = [spr_baby_cloud, spr_cloud_2, spr_cloud_3, spr_cloud_4];
cloud_index = 0;


alarm[0] = room_speed * random_range(growth_rate/2,growth_rate);

image_xscale = 4.5;

image_yscale = 4.5;