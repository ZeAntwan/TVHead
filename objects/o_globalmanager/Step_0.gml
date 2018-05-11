/// @description Debug Controls
// Secondary Controls (LB + Dpad)
if (!global.showmenu and gamepad_button_check(0,gp_shoulderl)) {
	if (gamepad_button_check_pressed(0, gp_padd)) {
		global.bgindex--
	}
	if (gamepad_button_check_pressed(0, gp_padu)) {
		global.bgindex++
	}
	if (gamepad_button_check_pressed(0, gp_padl)) {
		if (room != room_first) room_goto_previous();
	}
	if (gamepad_button_check_pressed(0, gp_padr)) {
		if (room != room_last) room_goto_next();
	}
}
