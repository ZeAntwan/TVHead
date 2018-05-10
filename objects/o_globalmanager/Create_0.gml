/// @description Setup

// Eye state setup
// Eye Mood
global.emoteeye = 0;
global.eyemood = 0;
// Eye Skins
global.eyeskin = 0;

// Music
global.forcemusic = false;
global.forcemusicstop = false;

// BG
global.bgindex = 0;

// Screen vars
global.screenw = window_get_width();
global.screenh = window_get_height();
global.requestfullscreen = false;

// Surface and Shaders
shadertouse = myShader

sGlobalTime = shader_get_uniform(shadertouse,"iGlobalTime");
sTime = shader_get_uniform(shadertouse,"iTime");
sRes = shader_get_uniform(shadertouse,"iResolution");

application_surface_draw_enable(0);

//alarm[0] = 10;
