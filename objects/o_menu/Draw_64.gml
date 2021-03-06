/// @description DEBUG UI
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(f_main)

if (global.debugmode) {
	draw_text(5,5,"Emote : " + string(global.emoteeye));
	draw_text(5,35,"Mood : " + string(global.eyemood));
	draw_text(5,65,"Timer : " + string(get_timer()/1000000));
	draw_text(5,95,"Window : " + string(global.screenw) + " * " + string(global.screenh)) ;
	draw_text(5,125,"App surface : " + string(surface_get_width(application_surface)) + " * " + string(surface_get_height(application_surface))) ;
	draw_text(5,155,"Room Size : " + string(room_width) + " * " + string(room_height)) ;
	draw_text(5,185,"FPS : " + string(fps)) ;
	if (instance_exists(o_eyemanager)) draw_text(5,245,"Mouse : " + string(o_eyemanager.mousex)) ;
	draw_text(5,275,"Real Mouse : " + string(mouse_x)) ;
}

if (global.showmenu) {
	// Pour toutes les options de mon menu, je veux les afficher en col
	
	for (var i = 0; i < array_length_1d(options); i += 1) 
	{
		if (select == i) {
			draw_rectangle(-2,(global.screenh-40)-(40*i),60+string_width(options[i]),(global.screenh-40)-(40*i)+35,false);
			draw_set_color(c_black)
			draw_text(50,(global.screenh-40)-(40*i), string(options[i]));
			
			// Show different options
			if (select != 0) {
			
				if (optiontext != "") {
					draw_rectangle(60+string_width(options[i]),(global.screenh-40)-(40*i),80+string_width(options[i])+string_width(optiontext),(global.screenh-40)-(40*i)+35,false);
					draw_set_color(c_white);
					draw_text(70+string_width(options[i]),(global.screenh-40)-(40*i), string(optiontext));
				}
			}
			
		} else {
			draw_set_color(c_white);
			draw_text(50,(global.screenh-40)-(40*i), string(options[i]));
		}
	}
}

// Draw editors ?