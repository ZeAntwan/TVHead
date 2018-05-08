/// @description Main Controls

// Debugmode
if (keyboard_check_pressed(vk_tab)) {debugmode = !debugmode};

// Fullscreen
if (keyboard_check_pressed(ord("F"))) {
	if(!window_get_fullscreen()) {
		window_set_fullscreen(true);
	} else {
		window_set_fullscreen(false);
	}
}

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
	
if (gamepad_button_check(0,gp_shoulderr)) {
	rblink = lerp(rblink,0,0.7);
	lblink = lerp(lblink,0,0.7);
} else {
	rblink = lerp(rblink,(1-rtaxis),0.7);
	lblink = lerp(lblink,(1-ltaxis),0.7);
}

// Woot eyes
if (gamepad_button_check(0, gp_shoulderl)) {
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

// Mood Change
if (gamepad_button_check_pressed(0, gp_padd)) {
	global.eyemood = 0;
}
if (gamepad_button_check_pressed(0, gp_padu)) {
	global.eyemood = 1;
}
if (gamepad_button_check_pressed(0, gp_padl)) {
	global.eyemood = 2;
}
if (gamepad_button_check_pressed(0, gp_padr)) {
	global.eyemood = 3;
}
#endregion

#region Eye Emotes
// Smooth effet
if (gamepad_button_check_pressed(0, gp_face1) 
	or gamepad_button_check_pressed(0, gp_face2) 
	or gamepad_button_check_pressed(0, gp_face3) 
	or gamepad_button_check_pressed(0, gp_face4)) 
	{moodsmooth = 0};



// Eyes Emote

// A 
if (gamepad_button_check_pressed(0, gp_face1)) {
	if(global.emoteeye == 1) {global.emoteeye = 0} else {global.emoteeye = 1};
}

// B "?"
if (gamepad_button_check_pressed(0, gp_face2)) {
	if(global.emoteeye == 2) {global.emoteeye = 0} else {global.emoteeye = 2};
}

// X Idea
if (gamepad_button_check_pressed(0, gp_face3)) {
	if(global.emoteeye == 3) {global.emoteeye = 0} else {global.emoteeye = 3};
}

// Y Idea
if (gamepad_button_check_pressed(0, gp_face4)) {
	if(global.emoteeye == 4) {global.emoteeye = 0} else {global.emoteeye = 4};
}


// Draw eyes only if not in emote
if (global.emoteeye == 0) {
	global.eyedraw = true;
} else {
	global.eyedraw = false;
}
#endregion
