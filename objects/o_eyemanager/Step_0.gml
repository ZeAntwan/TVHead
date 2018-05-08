/// @description Main Controls

// Screen vars
screenw = window_get_width();
screenh = window_get_height();

// Axis variables
lhaxis = gamepad_axis_value(0,gp_axislh);
lvaxis = gamepad_axis_value(0,gp_axislv);
rhaxis = gamepad_axis_value(0,gp_axisrh);
rvaxis = gamepad_axis_value(0,gp_axisrv);

rtaxis = gamepad_button_value(0, gp_shoulderrb)
ltaxis = gamepad_button_value(0, gp_shoulderlb)

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
	
	reye_x = lerp(reye_x, reye_dx + rhaxis*eyeradius,eyesmooth);
	reye_y = lerp(reye_y, reye_dy + rvaxis*eyeradius,eyesmooth);
}

// Blink
	
if (gamepad_button_check(0,gp_shoulderr) or forceblink or blink) {
	rblink = lerp(rblink,0,0.7);
	lblink = lerp(lblink,0,0.7);
} else {
	rblink = lerp(rblink,(1-rtaxis),0.7);
	lblink = lerp(lblink,(1-ltaxis),0.7);
}

// Woot eyes
if (gamepad_button_check(0, gp_stickr)) {
	global.emoteeye = 0;
	leyesize = lerp(leyesize,(cosfactor2*eyesize),smooth);
	reyesize = lerp(reyesize,((1/cosfactor2)*eyesize),smooth);
} else {
	leyesize = lerp(leyesize,eyesize,smooth);
	reyesize = lerp(reyesize,eyesize,smooth);
}

// Right axis Eyesize
leyesize = lerp(leyesize,eyesize-(rvaxis*(eyesize/2)),smooth);
reyesize = lerp(reyesize,eyesize-(rvaxis*(eyesize/2)),smooth);

// Control mode change 
if (gamepad_button_check_pressed(0,gp_start)) {
	if (global.controlmode == 0) {global.controlmode = 1}
	else {global.controlmode = 0}
}

// Mood Change
if (!global.showmenu and !gamepad_button_check(0,gp_shoulderl)) {
	// Down
	if (gamepad_button_check_pressed(0, gp_padd)) {
		if(global.eyemood == 1) {global.eyemood = 0} else {global.eyemood = 1};
	}

	// Up
	if (gamepad_button_check_pressed(0, gp_padu)) {
		if(global.eyemood == 2) {global.eyemood = 0} else {global.eyemood = 2};
	}

	// Left
	if (gamepad_button_check_pressed(0, gp_padl)) {
		if(global.eyemood == 3) {global.eyemood = 0} else {global.eyemood = 3};
	}

	// Right
	if (gamepad_button_check_pressed(0, gp_padr)) {
		if(global.eyemood == 4) {global.eyemood = 0} else {global.eyemood = 4};
	}
}

if (global.showmenu) {
	global.eyemood = 0;
}
#endregion

#region Eye Emotes
// Reset Smooth effet
if (gamepad_button_check_pressed(0, gp_face1) 
	or gamepad_button_check_pressed(0, gp_face2) 
	or gamepad_button_check_pressed(0, gp_face3) 
	or gamepad_button_check_pressed(0, gp_face4)) 
	{moodsmooth = 0};

// Eyes Emote
if (!gamepad_button_check(0,gp_shoulderl)) {
	// A 
	if (gamepad_button_check_pressed(0, gp_face1)) {
		if(global.emoteeye == 1) {global.emoteeye = 0} else {global.emoteeye = 1};
	}

	// B "?"
	if (gamepad_button_check_pressed(0, gp_face2)) {
		if(global.emoteeye == 2) {global.emoteeye = 0} else {global.emoteeye = 2};
	}

	// X "Code"
	if (gamepad_button_check_pressed(0, gp_face3)) {
		if(global.emoteeye == 3) {global.emoteeye = 0} else {global.emoteeye = 3};
	}

	// Y "Ideo"
	if (gamepad_button_check_pressed(0, gp_face4)) {
		if(global.emoteeye == 4) {global.emoteeye = 0} else {global.emoteeye = 4};
	}
}

// Draw eyes only if not in emote
if (global.emoteeye == 0) {
	blink = false;
	//global.eyedraw = true;
} else {
	blink = true;
	//global.eyedraw = false;
}

// Secondary Controls (LB + Dpad)
if (!global.showmenu and gamepad_button_check(0,gp_shoulderl)) {
	if (gamepad_button_check_pressed(0, gp_padd)) {
		
	}
	if (gamepad_button_check_pressed(0, gp_padu)) {
		
	}
	if (gamepad_button_check_pressed(0, gp_padl)) {
		global.bgindex--;
	}
	if (gamepad_button_check_pressed(0, gp_padr)) {
		global.bgindex++;
	}
	
	if (gamepad_button_check_pressed(0, gp_padr)) {
		global.bgindex++;
	}
	
	// Toggle Blink
	if (gamepad_button_check_pressed(0, gp_shoulderr)) {
		forceblink = !forceblink;
	}
	
	// Link Eye Blinking
	lblink = rblink;
}

#endregion
