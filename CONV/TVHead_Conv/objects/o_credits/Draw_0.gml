/// @description Insert description here
draw_set_alpha(.65);
draw_set_color(c_black)
draw_rectangle(0,0,room_width,room_height,false)
draw_set_alpha(1);
draw_set_color(c_white)

draw_set_font(f_code);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(50,50,text1,25,room_width*.6)
//scr_TextDisplay(text1,50,50,621))
	//if (!audio_is_playing(sfx_startup) and !sfxplayed_1) {
	//	audio_play_sound(sfx_startupboot,1,false);
	//	sfxplayed_1 = true;
	//}
	//draw_sprite_ext(s_k7roll,0,room_width-sprite_get_width(s_k7roll)*.5,sprite_get_height(s_k7roll)*.5,.5,.5,costime*-2,c_white,.5);


var text1h = string_height_ext(text1,25,room_width/2)

draw_set_font(f_codesmall);

draw_text_ext(50,text1h+50,credits,20,room_width/2)



draw_set_valign(fa_bottom);
draw_text_ext(50,room_height-50,text2,25,room_width/2)

draw_sprite_ext(s_logo,0,room_width*.85,room_height/2,1,1,0,c_white,.3);
