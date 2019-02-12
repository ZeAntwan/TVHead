/// @description Insert description here

maximg = sprite_get_number(usesprite);
draw_sprite_ext(usesprite,_img,room_width/2,room_height/2,room_width/sprite_get_width(usesprite),room_height/sprite_get_height(usesprite),0,tint_color,0.5)
if (bg_anim = true) {
	_img++
	if (_img > maximg) {_img = 0};
}

// Video
if (usevideo != noone) {
	edgefmv_play(30,0,0,0,room_width/global.fmv_frame_width,room_height/global.fmv_frame_height,0,tint_color,1,true,true);
}