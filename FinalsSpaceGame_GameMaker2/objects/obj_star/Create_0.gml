/// @description We pick a random direction for the star to go in, and then send it that way using radians, and the stars' speed. 


image_speed = 0;

star_speed = choose(8,24);

random_radian = random(2 * 3.14);


hspeed = cos(random_radian) * star_speed;
vspeed = sin(random_radian) * star_speed;




image_xscale = 4.5;
image_yscale = 4.5;

image_angle = random(360);


star_anim_delay = irandom(10);

frames = 0;