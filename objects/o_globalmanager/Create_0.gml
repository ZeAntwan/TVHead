/// @description Setup

// Eye state setup
// Eye Mood
global.emoteeye = 0;
global.eyemood = 0;
// Eye Skins
global.eyeskin = 0;

// Music
global.forcemusic = false;
global.musicstop = false;

// BG
global.bgindex = 0;

// Screen vars
global.screenw = 1280;
global.screenh = 720;
view_hport[0] = global.screenh;
view_wport[0] = global.screenw;
window_set_size(global.screenw, global.screenh);

global.requestfullscreen = false;

// Surface and Shaders
shadertouse = myShader

sGlobalTime = shader_get_uniform(shadertouse,"iGlobalTime");
sTime = shader_get_uniform(shadertouse,"iTime");
sRes = shader_get_uniform(shadertouse,"iResolution");

application_surface_draw_enable(0);

//alarm[0] = 10;
