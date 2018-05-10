/// @description Insert description here

maximg = sprite_get_number(usesprite);
draw_sprite_ext(usesprite,_img,room_width/2,room_height/2,room_width/sprite_get_width(usesprite),room_height/sprite_get_height(usesprite),0,tint_color,0.5)
if (bganim = true) {
	_img++
	if (_img > maximg) {_img = 0};
}
