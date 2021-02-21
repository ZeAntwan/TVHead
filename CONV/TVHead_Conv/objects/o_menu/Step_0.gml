/// @description Insert description here

// Debugmode
if (keyboard_check_pressed(vk_tab)) {global.debugmode = !global.debugmode};

if (keyboard_check_pressed(vk_space) or (gamepad_button_check_pressed(0,gp_select))) {global.showmenu = !global.showmenu};


if (keyboard_check_pressed(vk_right) or (gamepad_button_check_pressed(0,gp_padr))) {sright = true} else {sright = false};
if (keyboard_check_pressed(vk_left) or (gamepad_button_check_pressed(0,gp_padl))) {sleft = true} else {sleft = false};


// Fullscreen
if (keyboard_check_pressed(ord("F"))) {
	global.requestfullscreen = true;	
}


// Menu items
if (global.showmenu) {
	if (keyboard_check_pressed(vk_up) or (gamepad_button_check_pressed(0,gp_padu))) {
		select++;
		if (select > array_length(options)-1) select = 0;
	}
	if (keyboard_check_pressed(vk_down) or (gamepad_button_check_pressed(0,gp_padd))) {
		select--;
		if (select < 0) select = array_length(options)-1;
	}
	
	select = clamp(select,0,array_length(options)-1);
	
	switch (select) {
		case 0:
			optiontext = "";
			if (sright or sleft) {
				global.showmenu = !global.showmenu;
			}
		break;
		
		case 1:
			optiontext = "";
			if (sright or sleft) {
				global.debugmode = !global.debugmode;
			}
		break;
		
		case 2:
			optiontext = "";
			if (sright) {
				game_end();
			}
		break;
		
		case 3:
			optiontext = string(room_get_name(room));
			if (sright) {
				if (room != room_last) room_goto_next();
			}
			if (sleft) {
				if (room != room_first)	room_goto_previous();
			}
		break;
	
		
		case 4:
			optiontext = window_get_fullscreen();
			if (sright or sleft) {
				global.requestfullscreen = true;
			}
		break;
		
		case 5:
			optiontext = string(global.emoteeye);
			if (sright) {
				global.emoteeye++;
			}
			if (sleft) {
				global.emoteeye--;
			}
			global.emoteeye = clamp(global.emoteeye,0,8);
		break;
		
		case 6:
			optiontext = string(global.eyeskin);
			if (sright) {
				global.eyeskin++;
			}
			if (sleft) {
				global.eyeskin--;
			}
		break;
		
		case 7:
			if (instance_exists(o_bgmanager)) {
				optiontext = string(sprite_get_name(o_bgmanager.bg_array[global.bgindex]));
				if (sright) {
					global.bgindex++;
				}
				if (sleft) {
					global.bgindex--;
				}
			} else {
				optiontext = "Inactive";
			}
		break;
		
		case 8:
			if (instance_exists(o_bgmanager)) {
				optiontext = string(global.forcebgstop);
				if (sright or sleft) {
					global.forcebgstop = !global.forcebgstop;
				}
			} else {
				optiontext = "Inactive";
			}
		break;
		
		case 9:
			if (instance_exists(o_emotemusic)) {
				optiontext = string(audio_get_name(o_emotemusic.emotemusiclist[global.emotemusicselect]));
				if (sright) {
					global.emotemusicselect++;
				}
				if (sleft) {
					global.emotemusicselect--;
				}
			} else if (instance_exists(o_musicmanager)) {
				optiontext = string_replace(o_musicmanager.musiclist[global.musicselect],"music/","");
				if (sright) {
					global.musicselect++;
				}
				if (sleft) {
					global.musicselect--;
				}
			} else {
				optiontext = "Inactive";
			}
		break;
		
		case 10:
			optiontext = string(global.forcemusic);
			if (sright) {
				global.forcemusic = true;
			}
			if (sleft) {
				global.forcemusic = false;
			}
		break;
		
		case 11:
			optiontext = string(global.controlmode);
			if (sright) {
				global.controlmode++;
			}
			if (sleft) {
				global.controlmode--;
			}
		break;
		}
	
}
