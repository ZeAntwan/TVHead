global.music = false;

global.musicselect = 0;

// create the audio controls
is_playing = false;
is_paused = false;

playmusic = 0;
//__groups = 0;
error = false;

musiclist[0] = file_find_first("music/*.ogg",0);
if (musiclist[0] != "") {
	var nextsong = file_find_next();
	for (var i = 1; nextsong != ""; i++) {
		musiclist[i] = nextsong;
		nextsong = file_find_next();
	}
} else {
	error = true;
}


//musiclist[0] = "music/Jake Kaufman - Mighty Switch Force 2 OST - 10 The Afterblaze.ogg";
//musiclist[1] = "music/Jake Kaufman - Mighty Switch Force 2 OST - 15 Credits (Rescue Girl).ogg";

currentmusic = pointer_null;



if (musiclist[0] != "") {
	event_user(10);
}

animspeed = .05
animwait = 5*room_speed;

animation = 0;
animchange = false;

infoX = room_width/2;
infoY = room_height*.85;
outline = 10;