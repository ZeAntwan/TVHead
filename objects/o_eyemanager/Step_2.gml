/// @description Insert description here
// Fullscreen
if (surface_exists(eyesurf) and surface_exists(application_surface)) {
	surface_resize(eyesurf,screenw,screenh);
	surface_resize(application_surface,screenw,screenh);
}
