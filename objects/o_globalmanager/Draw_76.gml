/// @description Insert description here
if (window_get_fullscreen()) {
	global.screenw = display_get_width();
	global.screenh = display_get_height();
} else {
	global.screenw = 1280;
	global.screenh = 720;
}
