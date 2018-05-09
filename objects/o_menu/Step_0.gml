/// @description Insert description here
// Debugmode
if (keyboard_check_pressed(vk_tab)) {global.debugmode = !global.debugmode};

if (keyboard_check_pressed(vk_space) or (gamepad_button_check_pressed(0,gp_select))) {global.showmenu = !global.showmenu};



// Screen vars
screenw = window_get_width();
screenh = window_get_height();

// Fullscreen
if (keyboard_check_pressed(ord("F"))) {
	if(!window_get_fullscreen()) {
		window_set_fullscreen(true);
	} else {
		window_set_fullscreen(false);
	}
}



if (global.showmenu) {
	if (keyboard_check_pressed(vk_up) or (gamepad_button_check_pressed(0,gp_padu))) {select++}
	if (keyboard_check_pressed(vk_down) or (gamepad_button_check_pressed(0,gp_padd))) {select--}
	select = clamp(select,0,array_length_1d(options)-1);
	
	switch (select) {
		case 0:
			optiontext = "";
			if (keyboard_check_pressed(vk_enter) or (gamepad_button_check_pressed(0,gp_padr))) {
				global.showmenu = !global.showmenu;
			}
		break;
		
		case 1:
			optiontext = window_get_fullscreen();
			if (keyboard_check_pressed(vk_enter) or (gamepad_button_check_pressed(0,gp_padr))) {
					if(!window_get_fullscreen()) {
						window_set_fullscreen(true);
					} else {
						window_set_fullscreen(false);
					}
			}
		break;
		
		case 2:
			optiontext = string(global.emoteeye);
			if (gamepad_button_check_pressed(0,gp_padr)) {
				global.emoteeye++;
			}
			if (gamepad_button_check_pressed(0,gp_padl)) {
				global.emoteeye--;
			}
			global.emoteeye = clamp(global.emoteeye,0,8);
		break;
		
		case 3:
			optiontext = string(sprite_get_name(o_bgmanager.sprite_array[global.bgindex]));
			if (gamepad_button_check_pressed(0,gp_padr)) {
				global.bgindex++;
			}
			if (gamepad_button_check_pressed(0,gp_padl)) {
				global.bgindex--;
			}
		break;
		
		case 4:
			optiontext = string(audio_get_name(o_musicmanager.musiclist[global.musicselect]));
			if (gamepad_button_check_pressed(0,gp_padr)) {
				global.musicselect++;
			}
			if (gamepad_button_check_pressed(0,gp_padl)) {
				global.musicselect--;
			}
		break;
		
		case 5:
			optiontext = string(global.forcemusic);
			if (gamepad_button_check_pressed(0,gp_padr)) {
				global.forcemusic = true;
			}
			if (gamepad_button_check_pressed(0,gp_padl)) {
				global.forcemusic = false;
			}
		break;
		}
	
}
