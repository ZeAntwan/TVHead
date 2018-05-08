/// @description DEBUG UI

if (global.debugmode) {
	draw_text(5,5,"Emote : " + string(global.emoteeye));
	draw_text(5,30,"Mood : " + string(global.eyemood));
	draw_text(5,55,"Timer : " + string(get_timer()/1000000));
	draw_text(5,80,"Window : " + string(o_eyemanager.screenw) + " * " + string(o_eyemanager.screenh)) ;
}

if (global.showmenu) {
	// Pour toutes les options de mon menu, je veux les afficher en col
	
	for (var i = 0; i < array_length_1d(options); i += 1) 
	{
		if (select == i) {
			draw_rectangle(-2,(screenh-40)-(40*i),60+string_width(options[i]),(screenh-40)-(40*i)+35,false);
			draw_set_color(c_black)
			draw_text(50,(screenh-40)-(40*i), string(options[i]));
			
			// Show different options
			if (select != 0) {
			
				if (optiontext != "") {
					draw_rectangle(60+string_width(options[i]),(screenh-40)-(40*i),80+string_width(options[i])+string_width(optiontext),(screenh-40)-(40*i)+35,false);
					draw_set_color(c_white);
					draw_text(70+string_width(options[i]),(screenh-40)-(40*i), string(optiontext));
				}
			}
			
		} else {
			draw_set_color(c_white);
			draw_text(50,(screenh-40)-(40*i), string(options[i]));
		}
	}
}

// Draw editors ?