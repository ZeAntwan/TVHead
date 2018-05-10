/// @description Insert description here
if (window_get_fullscreen()) {
	global.screenw = display_get_width();
	global.screenh = display_get_height();
} else {
	global.screenw = window_get_width();
	global.screenh = window_get_height();
}
