/// @description Insert description here

maximg = sprite_get_number(usesprite);

draw_sprite_ext(
	usesprite,
	_img,
	room_width/2,
	room_height/2,
	room_width/sprite_get_width(usesprite),
	room_height/sprite_get_height(usesprite),
	0,
	tint_color,
	1
);

if (usesprite != bg_array[global.bgindex] && bg_channelswitch) {
	//var _maximg = sprite_get_number(usesprite);
	draw_sprite_ext(
		bg_array[global.bgindex],
		_img,
		room_width/2,
		room_height/2,
		room_width/sprite_get_width(bg_array[global.bgindex]),
		(room_height/sprite_get_height(bg_array[global.bgindex]))*bg_switchanim,
		0,
		tint_color,
		1
	);
}
draw_set_alpha(.5)
draw_set_color(c_black);
draw_rectangle(0,0,room_width,room_height,false)
draw_set_color(c_white);
draw_set_alpha(1)

if (bg_anim = true) {
	_img++
	if (_img > maximg) {_img = 0};
}