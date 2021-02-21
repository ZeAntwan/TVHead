/// @description Main Controls

// Gamepad Axis variables
lhaxis = gamepad_axis_value(0,gp_axislh);
lvaxis = gamepad_axis_value(0,gp_axislv);
rhaxis = gamepad_axis_value(0,gp_axisrh);
rvaxis = gamepad_axis_value(0,gp_axisrv);

rtaxis = gamepad_button_value(0, gp_shoulderrb)
ltaxis = gamepad_button_value(0, gp_shoulderlb)

// Mouse calculation

mousex = (mouse_x - room_width/2)/(room_width/2)
mousey = (mouse_y - room_height/2)/(room_height/2)


// Cosinus animation factor
cosfactor = 1 + sin(costime * 0.1) * 0.1;
cosfactor2 = 1 + sin(costime * 0.1) * 0.3;
costime++;

#region Global Eye Movement 
if (global.controlmode == 0) {
	leye_x = lerp(leye_x, leye_dx + lhaxis*eyeradius,eyesmooth);
	leye_y = lerp(leye_y, leye_dy + lvaxis*eyeradius,eyesmooth);
	
	reye_x = lerp(reye_x, reye_dx + lhaxis*eyeradius,eyesmooth);
	reye_y = lerp(reye_y, reye_dy + lvaxis*eyeradius,eyesmooth);
}

if (global.controlmode == 1) {
	leye_x = lerp(leye_x, leye_dx + lhaxis*eyeradius,eyesmooth);
	leye_y = lerp(leye_y, leye_dy + lvaxis*eyeradius,eyesmooth);
	
	reye_x = lerp(reye_x, reye_dx + lhaxis*eyeradius,eyesmooth);
	reye_y = lerp(reye_y, reye_dy + lvaxis*eyeradius,eyesmooth);
}
if (global.controlmode == 2) {
	leye_x = lerp(leye_x, leye_dx + mousex*eyeradius,eyesmooth);
	leye_y = lerp(leye_y, leye_dy + mousey*eyeradius,eyesmooth);
	
	reye_x = lerp(reye_x, reye_dx + mousex*eyeradius,eyesmooth);
	reye_y = lerp(reye_y, reye_dy + mousey*eyeradius,eyesmooth);
}
// Blink
	
if (gamepad_button_check(0,gp_shoulderr) or forceblink or blink) {
	rblink = lerp(rblink,0,0.7);
	lblink = lerp(lblink,0,0.7);
} else {
	rblink = lerp(rblink,(1-rtaxis),0.7);
	lblink = lerp(lblink,(1-ltaxis),0.7);
}


// Right axis Eyesize
leyesize = lerp(leyesize,eyesize-(rvaxis*(eyesize)),smooth);
reyesize = lerp(reyesize,eyesize-(rvaxis*(eyesize)),smooth);

// Woot eyes
if (gamepad_button_check(0, gp_stickr)) {
	global.emoteeye = 0;
	leyesize = lerp(leyesize,(cosfactor2*eyesize),smooth);
	reyesize = lerp(reyesize,((1/cosfactor2)*eyesize),smooth);
} else {
	leyesize = lerp(leyesize,eyesize,smooth);
	reyesize = lerp(reyesize,eyesize,smooth);
}


// Control mode change 
if (gamepad_button_check_pressed(0,gp_start)) {
	if (global.controlmode == 0) {global.controlmode = 1}
	else {global.controlmode = 0}
}
#endregion

if (global.eyecontrol) {
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
				if (!audio_is_playing(sfx_1up) and !sfxplayed) {
					audio_play_sound(sfx_1up,15,false);
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
			if(global.emoteeye == 6) {global.emoteeye = 0; global.emotemusic = false} else {global.emoteeye = 6; global.emotemusic = true};
		}

		// X "Code"
		if (gamepad_button_check_pressed(0, gp_face3)) {
			if(global.emoteeye == 7) {global.emoteeye = 0} else {
				global.emoteeye = 7
				// SFX
				global.soundstop = true;
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
