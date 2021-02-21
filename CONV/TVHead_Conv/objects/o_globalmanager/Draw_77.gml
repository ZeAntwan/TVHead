/// @description Set Shaders

if (global.requestfullscreen) {
	if(!window_get_fullscreen()) {
		window_set_fullscreen(true);
	} else {
		window_set_fullscreen(false);
	}
	global.requestfullscreen = false;
}

if (surface_exists(application_surface)) {
	if ((surface_get_width(application_surface) != global.screenw) and (surface_get_height(application_surface) != global.screenh)) {
	surface_resize(application_surface,global.screenw ,global.screenh);
	}
}


shader_set(shadertouse);

shader_set_uniform_f(sGlobalTime,0);
shader_set_uniform_f(sTime,get_timer()/1000000);
shader_set_uniform_f(sRes,global.screenw,global.screenh);

draw_surface(application_surface, 0, 0);


shader_reset();