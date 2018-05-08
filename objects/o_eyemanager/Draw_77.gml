/// @description Insert description here
shader_set(shadertouse);

shader_set_uniform_f(sGlobalTime,0);
shader_set_uniform_f(sTime,get_timer()/1000000);
shader_set_uniform_f(sRes,view_wport[0],view_hport[0]);

draw_surface(application_surface, 0, 0);
shader_reset();