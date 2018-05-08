/// @description Insert description here

// DEBUG Setup
debugmode = false;

// Controler setup
if gamepad_is_connected(0) gamepad_set_axis_deadzone(0, 0.1);

// Controlmode set
// 0 : Both eye on L Stick
// 1 : 1 Eye per stick
global.controlmode = 0;
global.eyedraw = true;

//// Var Setup
// Eyesize
eyesize = room_width*(8/100);
leyesize = eyesize;
reyesize = eyesize;
eyeradius = (room_width/4) - (eyesize);

// Eye Mood
global.emoteeye = 0;
global.eyemood = 0;

eyemoodmod = 25;

eyemoodfact = 0;
eyemoodfact2 = 0;
eyemoodfact3 = 0;

// Smooth
smooth = 0.3;
eyesmooth = 0.5;
costime = 0;

// Default position
leye_dx = room_width/4;
leye_dy = room_height/2;
leye_x = leye_dx;
leye_y = leye_dy;

reye_dx = room_width - (room_width/4);
reye_dy = room_height/2;
reye_x = reye_dx;
reye_y = reye_dy;

rblink = 0;
lblink = 0;

// Set precision and AA
gpu_set_texfilter(true);

display_reset(8,true);
draw_set_circle_precision(128);

// Surface and Shaders
shadertouse = myShader

sGlobalTime = shader_get_uniform(shadertouse,"iGlobalTime");
sTime = shader_get_uniform(shadertouse,"iTime");
sRes = shader_get_uniform(shadertouse,"iResolution");

eyesurf = surface_create(room_width,room_height);
application_surface_draw_enable(0);

