/// @description Insert description here

global.musicselect = clamp(global.musicselect,0,array_length_1d(musiclist)-1);

if (global.music or global.forcemusic) {
	if (!audio_is_playing(musiclist[global.musicselect])) {
		if (audio_is_playing(playmusic)) {
			audio_stop_sound(playmusic)
		}
	 playmusic = musiclist[global.musicselect];
	
	 // music = audio_play_sound(playmusic,10,true);
		
	} 

	if (!is_playing) {
		event_user(4)
	} else {
	// every step, queue up another bit of audio
		event_user(0);
		
		// because audio queues automatically stop playing if it runs out of buffer
				// sometimes if our ticks are behind the playback (e.g. if you dragged a window)
				// then the queue would stop.
				// For this reason we have to control play/stop state ourselves, and if in
				// play mode, when the audio stops playing, force it to start again

	if (not audio_is_playing(audio)) {
		audio_play_sound(audio, 0, 0);
		// show_debug_message("GOOD")
	}
	}
} else {
	if (is_playing) {
		event_user(3);
	}
}
if(!global.forcemusic and !global.music) {
	audio_stop_sound(playmusic);
	//event_user(EVENT_STOP);
}

if (global.musicstop == true) {
	global.music = false;
	global.forcemusic = false;
	global.musicstop = false;
}


if (is_playing) {

}
