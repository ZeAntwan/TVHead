global.music = false;

global.musicselect = 0;

playmusic = 0;
//__groups = 0;

musiclist[0] = "music/Jake Kaufman - Mighty Switch Force 2 OST - 10 The Afterblaze.ogg";
musiclist[1] = "music/Jake Kaufman - Mighty Switch Force 2 OST - 15 Credits (Rescue Girl).ogg";

currentmusic = pointer_null;

event_user(10);

animspeed = .05
animwait = 5*room_speed;

animation = 0;
animchange = false;