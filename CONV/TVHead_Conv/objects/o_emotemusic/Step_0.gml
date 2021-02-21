/// @description Insert description here

global.emotemusicselect = clamp(global.emotemusicselect,0,array_length(emotemusiclist)-1);

if (global.emotemusic or global.forcemusic) {
	if (!audio_is_playing(emotemusiclist[global.emotemusicselect])) {
		if (audio_is_playing(playemote)) {
			audio_stop_sound(playemote)
		}
	 playemote = emotemusiclist[global.emotemusicselect];
	 audio_play_sound(playemote,10,true);
	} 

}

if(!global.forcemusic and !global.emotemusic) {
	audio_stop_sound(playemote);
}

