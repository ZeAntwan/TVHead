/// @description Insert description here

global.eyeskin = clamp(global.eyeskin,0,array_length_1d(skinlist)-1);

if (global.eyeskin > 0) {

usesprite = skinlist[global.eyeskin];
draw_sprite_ext(
	usesprite,
	0,
	(room_width/2)+(o_eyemanager.lhaxis*o_eyemanager.eyeradius)/1.5,
	(room_height/2)+(o_eyemanager.lvaxis*o_eyemanager.eyeradius)/1.5,
	room_width/sprite_get_width(usesprite),
	room_width/sprite_get_width(usesprite),
	0,
	c_white,
	1);

}

switch global.eyeskin {
	case 2:
	case 3:
		
	break;
}