global.music = false;

maxmus = 4;

for (var i=0; i<maxmus;i++) musiclist[i] = i;

global.musicselect = 0;

playmusic = 0;
//__groups = 0;

newmusiclist[0] = "music/mus_polo2.ogg";
newmusiclist[1] = "music/Blues.ogg";

currentmusic = pointer_null;

event_user(10);