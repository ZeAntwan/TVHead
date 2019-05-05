/// @description Debug Controls + Overall controls
// Secondary Controls (LB + Dpad)
if (!global.showmenu and gamepad_button_check(0,gp_shoulderl)) {
	if (gamepad_button_check_pressed(0, gp_padd)) {
		global.bgindex--
	}
	if (gamepad_button_check_pressed(0, gp_padu)) {
		global.bgindex++
	}
	if (gamepad_button_check_pressed(0, gp_padl) or keyboard_check_pressed(vk_left)) {
		if (room != room_first) room_goto_previous();
	}
	if (gamepad_button_check_pressed(0, gp_padr) or keyboard_check_pressed(vk_right)) {
		if (room != room_last) room_goto_next();
	}
	
		// Toggle BSOD
	if (gamepad_button_check_pressed(0, gp_stickl)) {
		room_goto(rm_bsod);
	}
}

if (global.soundstop == true) {
	global.emotemusic = false;
	global.forcemusic = false;
	global.soundstop = false;
}
