/// @description Reset BM and Draw surface
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(eyesurf,0,0);

draw_set_color(c_white);
