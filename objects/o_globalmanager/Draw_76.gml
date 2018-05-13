/// @description Insert description here
if (window_get_fullscreen()) {
	global.screenw = display_get_width();
	global.screenh = display_get_height();
	window_set_cursor(cr_none)
//	room_set_width(room,global.screenw);
//	room_set_height(room,global.screenh);
} else {
	window_set_cursor(cr_default)
	global.screenw = 1280;
	global.screenh = 720;
}
