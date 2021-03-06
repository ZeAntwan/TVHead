/// @description Setup

chars_drawn = 0;

// Controlmode set
// 0 : Both eye on L Stick
// 1 : 1 Eye per stick
// 2 : Mouse
global.controlmode = 0;

global.eyecontrol = true;

// Draw eyes
global.eyedraw = true;
global.eyeleft = true;
global.eyeright = true;

//// Var Setup
// Eyesize
eyesize = room_width*(8/100);
leyesize = eyesize;
reyesize = eyesize;
eyeradius = (room_width/4) - (eyesize);

//// Eye Mood
//global.emoteeye = 0;
//global.eyemood = 0;

eyemoodmod = 25;

eyemoodfact = 0;
eyemoodfact2 = 0;
eyemoodfact3 = 0;
eyemoodfact4 = 0;

// Smooth
smooth = 0.3;
eyesmooth = 0.5;
costime = 0;
moodsmooth = 0;

// Default position
leye_dx = room_width/4;
leye_dy = room_height/2;
leye_x = leye_dx;
leye_y = leye_dy;

reye_dx = room_width - (room_width/4);
reye_dy = room_height/2;
reye_x = reye_dx;
reye_y = reye_dy;

blink = false;
forceblink = false;
rblink = 0;
lblink = 0;

eyesurf = surface_create(room_width,room_height);
codesurf = surface_create(room_width,room_height);

/// Eye Emotes and Mood settings

// Tape Rot
taperot = 0;

// Loading
d = room_height/3; //diameter in pixels of the circle
cn = 10;

// Code Text
linecount = 0;
file = file_text_open_read(working_directory + "\code.txt")
codetxt = file_text_read_string(file);
//codetext = "Test#2ndeligne";
file_text_close(file)

// BRB Audio (and SFX global ?)
sfxplayed = false;