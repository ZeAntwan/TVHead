/// @description Setup

// Controller setup
if gamepad_is_connected(0) gamepad_set_axis_deadzone(0, 0.1);

// Eye state setup
global.controlmode = 0;
// Eye Mood
global.emoteeye = 0;
global.eyemood = 0;
// Eye Skins
global.eyeskin = 0;

// BG
global.bgindex = 0;
global.forcebgstop = false;

// Music
global.forcemusic = false;
global.soundstop = false;
global.music = false;
global.emotemusic = false;


// Screen vars
global.screenw = 1280;
global.screenh = 720;
//view_hport[0] = global.screenh;
//view_wport[0] = global.screenw;
//window_set_size(global.screenw, global.screenh);

global.requestfullscreen = false;

// Surface and Shaders
shadertouse = myShader

sGlobalTime = shader_get_uniform(shadertouse,"iGlobalTime");
sTime = shader_get_uniform(shadertouse,"iTime");
sRes = shader_get_uniform(shadertouse,"iResolution");

application_surface_draw_enable(0);

//alarm[0] = 10;
