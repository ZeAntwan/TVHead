/// @description Handle Music play and Control

global.musicselect = clamp(global.musicselect,0,array_length(musiclist)-1);

if (!error) {
#region Music Play
if (global.music or global.forcemusic) {
	
	if (!is_playing) {
		event_user(4)
		animchange = true;
	} else {
	// every step, queue up another bit of audio
		event_user(0);
		
		// because audio queues automatically stop playing if it runs out of buffer
				// sometimes if our ticks are behind the playback (e.g. if you dragged a window)
				// then the queue would stop.
				// For this reason we have to control play/stop state ourselves, and if in
				// play mode, when the audio stops playing, force it to start again

		if (not audio_is_playing(audio)) {
			audio_play_sound(audio, 0, 1);
			// show_debug_message("GOOD")
		}
	}
	
	if (currentmusic != musiclist[global.musicselect]) {
		event_user(10);
		currentmusic = musiclist[global.musicselect]
		animchange = true;
	}
	
} else {
	if (is_playing) {
		event_user(3);
	}
	animchange = false;
	animation = 0;
}

if(!global.forcemusic and !global.music) {
	audio_stop_sound(playmusic);
	event_user(EVENT_STOP);
}

#endregion

#region Track Control

if (animchange) {
	if animation >= 1 {
		if (alarm[0] == -1) {
			alarm[0] = animwait;
			show_debug_message("DONE")
		}
	} else {
		animation += animspeed;
	}
} else {
	if (animation > 0) {
		animation -= animspeed
	}
}

// South
if (gamepad_button_check_pressed(0, gp_face1)) {
	if (is_paused) {
		event_user(EVENT_RESUME);
	}
	else if (is_playing) {
		event_user(EVENT_PAUSE);
	}
	else {
		event_user(EVENT_PLAY);
		global.music = true;
		animchange = true;
	}
}
// East
if (gamepad_button_check_pressed(0, gp_face2)) {
	event_user(EVENT_STOP);
	global.music = false;
}

if (!global.showmenu) {
	// Up 
	if (gamepad_button_check_pressed(0, gp_padu)) {
	
	}

	// Down 
	if (gamepad_button_check_pressed(0, gp_padd)) {
	
	}

	// Left 
	if (gamepad_button_check_pressed(0, gp_padl)) {
		global.musicselect--;
	}

	// Right
	if (gamepad_button_check_pressed(0, gp_padr)) {
		global.musicselect++;
	}
}

#endregion

}