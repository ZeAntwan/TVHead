/// @description Setup

chars_drawn = 0;

// Controlmode set
// 0 : Both eye on L Stick
// 1 : 1 Eye per stick
global.controlmode = 0;

//// Var Setup
// Sprite
osprite = sprite_index;
salpha = 1;
size = .5

// Eyesize
eyesize = room_width*(8/100);
leyesize = eyesize;
reyesize = eyesize;
eyeradius = (room_height/6);

//// Eye Mood
//global.emoteeye = 0;
//global.eyemood = 0;

// Smooth
smooth = 0.3;
eyesmooth = 0.5;
costime = 0;
moodsmooth = 0;
cosfactor = 1;
activebounce = false;

// Default position
dx = room_width/2;
dy = room_height/2;
x = dx;
y = dy;

blink = false;
forceblink = false;
rblink = 0;
lblink = 0;

eyesurf = surface_create(room_width,room_height);

/// Eye Emotes and Mood settings

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