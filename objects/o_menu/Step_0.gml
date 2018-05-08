/// @description Insert description here
// Debugmode
if (keyboard_check_pressed(vk_tab)) {debugmode = !debugmode};

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
	
	if (keyboard_check_pressed(vk_enter) or (gamepad_button_check_pressed(0,gp_padr))) {
		switch (select) {
			case 0:
			global.showmenu = !global.showmenu;
			break
		}
	}
	
}
