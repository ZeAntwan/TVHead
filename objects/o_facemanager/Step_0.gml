/// @description Insert description here
// Axis variables
lhaxis = gamepad_axis_value(0,gp_axislh);
lvaxis = gamepad_axis_value(0,gp_axislv);
rhaxis = gamepad_axis_value(0,gp_axisrh);
rvaxis = gamepad_axis_value(0,gp_axisrv);

rtaxis = gamepad_button_value(0, gp_shoulderrb)
ltaxis = gamepad_button_value(0, gp_shoulderlb)

// Global Face Movement 
x = lerp(x, dx + lhaxis*(eyeradius*1.5),eyesmooth);
y = lerp(y, dy + lvaxis*eyeradius,eyesmooth);

// Orientation
if (point_distance(dx,dy,x,y) > eyeradius/2) {
	outangle = true;
} else {
	outangle = false;
}
dir = point_direction(dx,dy,x,y)

// Mood Change
if (!global.showmenu and !gamepad_button_check(0,gp_shoulderl)) {
	// Up (Happy)
	if (gamepad_button_check_pressed(0, gp_padu)) {
		if(global.eyemood == 1) {global.eyemood = 0} else {global.eyemood = 1};
	}

	// Down (Not impressed)
	if (gamepad_button_check_pressed(0, gp_padd)) {
		if(global.eyemood == 2) {global.eyemood = 0} else {global.eyemood = 2};
	}

	// Left (Angry)
	if (gamepad_button_check_pressed(0, gp_padl)) {
		if(global.eyemood == 3) {global.eyemood = 0} else {global.eyemood = 3};
	}

	// Right (Sad)
	if (gamepad_button_check_pressed(0, gp_padr)) {
		if(global.eyemood == 4) {global.eyemood = 0} else {global.eyemood = 4};
	}
}

if (global.showmenu) {
	global.eyemood = 0;
}


#region Eye Emotes
// Reset Smooth effet
if (gamepad_button_check_pressed(0, gp_face1) 
	or gamepad_button_check_pressed(0, gp_face2) 
	or gamepad_button_check_pressed(0, gp_face3) 
	or gamepad_button_check_pressed(0, gp_face4)) 
	{
		moodsmooth = 0;
		sfxplayed = false;
	};

// Eyes Emote
if (!gamepad_button_check(0,gp_shoulderl)) {
	// Normal Mode
	
	// A 
	if (gamepad_button_check_pressed(0, gp_face1)) {
		if(global.emoteeye == 1) {global.emoteeye = 0} else {global.emoteeye = 1};
	}

	// B "?"
	if (gamepad_button_check_pressed(0, gp_face2)) {
		if(global.emoteeye == 2) {global.emoteeye = 0} else {global.emoteeye = 2};
	}

	// X "Loader"
	if (gamepad_button_check_pressed(0, gp_face3)) {
		if(global.emoteeye == 3) {global.emoteeye = 0} else {global.emoteeye = 3};
	}

	// Y "Idea"
	if (gamepad_button_check_pressed(0, gp_face4)) {
		if(global.emoteeye == 4) {global.emoteeye = 0} else {
			global.emoteeye = 4
			// SFX
			//global.musicstop = true;
			if (!audio_is_playing(s_1up) and !sfxplayed) {
				audio_play_sound(s_1up,15,false);
				sfxplayed = true;
			};
		};
	}
} else {
	// Secondary Mode
	// A "Music mode"
	if (gamepad_button_check_pressed(0, gp_face1)) {
		if(global.emoteeye == 5) {global.emoteeye = 0} else {global.emoteeye = 5};
	}

	// B "?"
	if (gamepad_button_check_pressed(0, gp_face2)) {
		if(global.emoteeye == 6) {global.emoteeye = 0; global.music = false} else {global.emoteeye = 6; global.music = true};
	}

	// X "Code"
	if (gamepad_button_check_pressed(0, gp_face3)) {
		if(global.emoteeye == 7) {global.emoteeye = 0} else {
			global.emoteeye = 7
			// SFX
			global.musicstop = true;
			if (!audio_is_playing(sfx_brb) and !sfxplayed) {
				audio_play_sound(sfx_brb,15,false);
				sfxplayed = true;
			};
		};
	}

	// Y "Code"
	if (gamepad_button_check_pressed(0, gp_face4)) {
		if(global.emoteeye == 8) {global.emoteeye = 0} else {
			global.emoteeye = 8
		};
	}
	
	// Toggle Blink
	if (gamepad_button_check_pressed(0, gp_shoulderr)) {
		forceblink = !forceblink;
	}
	
	// Link Eye Blinking
	lblink = rblink;
}

// Draw eyes only if not in emote and var reset
if (global.emoteeye == 0) {
	blink = false;
	//global.eyedraw = true;
} else {
	blink = true;
	//global.eyedraw = false;
}

#endregion

