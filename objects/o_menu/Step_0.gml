/// @description Insert description here

// Debugmode
if (keyboard_check_pressed(vk_tab)) {global.debugmode = !global.debugmode};

if (keyboard_check_pressed(vk_space) or (gamepad_button_check_pressed(0,gp_select))) {global.showmenu = !global.showmenu};

// Fullscreen
if (keyboard_check_pressed(ord("F"))) {
	global.requestfullscreen = true;	
}


// Menu items
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
			optiontext = "";
			if (keyboard_check_pressed(vk_enter) or (gamepad_button_check_pressed(0,gp_padr))) {
				global.debugmode = !global.debugmode;
			}
		break;
		
		case 2:
			optiontext = string(room_get_name(room));
			if (gamepad_button_check_pressed(0,gp_padr)) {
				if (room != room_last) room_goto_next();
			}
			if (gamepad_button_check_pressed(0,gp_padl)) {
				if (room != room_first)	room_goto_previous();
			}
		break;
		
		case 3:
			optiontext = window_get_fullscreen();
			if (keyboard_check_pressed(vk_enter) or (gamepad_button_check_pressed(0,gp_padr))) {
				global.requestfullscreen = true;
			}
		break;
		
		case 4:
			optiontext = string(global.emoteeye);
			if (gamepad_button_check_pressed(0,gp_padr)) {
				global.emoteeye++;
			}
			if (gamepad_button_check_pressed(0,gp_padl)) {
				global.emoteeye--;
			}
			global.emoteeye = clamp(global.emoteeye,0,8);
		break;
		
		case 5:
			optiontext = string(global.eyeskin);
			if (gamepad_button_check_pressed(0,gp_padr)) {
				global.eyeskin++;
			}
			if (gamepad_button_check_pressed(0,gp_padl)) {
				global.eyeskin--;
			}
		break;
		
		case 6:
			if (instance_exists(o_bgmanager)) {
				optiontext = string(sprite_get_name(o_bgmanager.bg_array[global.bgindex]));
				if (gamepad_button_check_pressed(0,gp_padr)) {
					global.bgindex++;
				}
				if (gamepad_button_check_pressed(0,gp_padl)) {
					global.bgindex--;
				}
			} else {
				optiontext = "Inactive";
			}
		break;
		
		case 7:
			if (instance_exists(o_bgmanager)) {
				optiontext = string(o_bgmanager.bg_anim);
				if (gamepad_button_check_pressed(0,gp_padr)) {
					o_bgmanager.bg_anim = !o_bgmanager.bg_anim;
				}
			} else {
				optiontext = "Inactive";
			}
		break;
		
		case 8:
			if (instance_exists(o_musicmanager)) {
				optiontext = string(audio_get_name(o_musicmanager.musiclist[global.musicselect]));
				if (gamepad_button_check_pressed(0,gp_padr)) {
					global.musicselect++;
				}
				if (gamepad_button_check_pressed(0,gp_padl)) {
					global.musicselect--;
				}
			} else {
				optiontext = "Inactive";
			}
		break;
		
		case 9:
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
