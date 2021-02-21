function scr_showOptionInfo(argument0, argument1) {
	var _select = argument0 // Select option to check
	var _optiontext = string(argument1) // Value to show

	if (select == _select) {
		draw_rectangle(60+string_width(options[i]),(screenh-40)-(40*i),80+string_width(options[i])+string_width(optiontext),(screenh-40)-(40*i)+35,false);
		draw_set_color(c_white);
		draw_text(70+string_width(options[i]),(screenh-40)-(40*i), string(optiontext));
	}


}
