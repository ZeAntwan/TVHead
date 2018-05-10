/// @description Insert description here

global.musicselect = clamp(global.musicselect,0,array_length_1d(musiclist)-1);

if (global.music or global.forcemusic) {
	if (!audio_is_playing(musiclist[global.musicselect])) {
		if (audio_is_playing(playmusic)) {
			audio_stop_sound(playmusic)
		}
		playmusic = musiclist[global.musicselect];
		
		music = audio_play_sound(playmusic,10,true);
	}
} 
if(!global.forcemusic and !global.music) {
	audio_stop_sound(playmusic);
}

if (global.musicstop == true) {
	global.music = false;
	global.forcemusic = false;
	global.musicstop = false;
}