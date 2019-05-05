/// @description Insert description here

if(!surface_exists(startupsurf)) {startupsurf = surface_create(room_width,room_height)};

surface_set_target(startupsurf);
draw_clear_alpha(c_black,0);

draw_set_color(c_white);

draw_set_halign(fa_left);
draw_set_font(f_code);

if (!scr_TextDisplay(text,50,50,621)) {
	if (!audio_is_playing(sfx_startup) and !sfxplayed_1) {
		audio_play_sound(sfx_startupboot,1,false);
		sfxplayed_1 = true;
	}
	draw_sprite_ext(s_k7roll,0,room_width-sprite_get_width(s_k7roll)*.5,sprite_get_height(s_k7roll)*.5,.5,.5,costime*-2,c_white,.5);
	
} else {
	cosfactor = 1 + sin(costime * 0.05) * 0.05;
	// Draw logo
	logoanim = lerp(logoanim,1,0.1);
	txtanim = lerp(txtanim,1,0.3);
	draw_sprite_ext(s_logo,0,(room_width/2), (room_height/2)-60,.4*cosfactor,(.4*cosfactor)*logoanim,0,c_white,1);
	// Show "Stuffmaker_OS v.X"
	draw_set_font(f_mainmed);
	draw_set_halign(fa_center);
	draw_text_ext_transformed(room_width/2,room_height-200,"Stuffmaker OS",1,100000,txtanim,1,0);
	draw_set_font(f_code);
	draw_text_ext_transformed(room_width/2,room_height-115,"version "+GM_version,1,100000,1,1,0);
	if (!audio_is_playing(sfx_startup) and !sfxplayed) {
		audio_play_sound(sfx_startup,1,false);
		sfxplayed = true;
	}
	// Wait for X seconds (alarm) and goto next room OR input ?
	if(alarm[0] = -1) alarm_set(0,room_speed*10);
}

costime++