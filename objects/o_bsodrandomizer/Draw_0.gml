/// @description Insérez la description ici

draw_sprite_ext(
		s_bsod,
		0,
		room_width/2,
		room_height/2,
		room_width/sprite_get_width(s_bsod),
		room_height/sprite_get_height(s_bsod),
		0,
		c_white,
		.5
	);

draw_set_font(f_courierstrong);

draw_set_halign(fa_left);

draw_set_color(c_white);

// Error Message
draw_text_ext(150, room_height*.35, errormsg, 25, room_width-300)

draw_set_font(f_courier);
draw_set_halign(fa_center);
// Date Stamp
//scr_boxText(outline*3,room_height-(string_height(errordate)+outline*3),outline,errordate, fa_left, true);

// Error code
scr_boxText(room_width - outline*3,room_height-(string_height(errorcode)+outline*3),outline,errorcode, fa_right);

// Header Title

scr_boxText(infoX,infoY,outline,title);

// Return
scr_boxText(infoX,room_height*0.8,outline,"  Press B to continue  ", fa_center, true);

// Warning sign
cosfactor = 1 + sin(costime * 0.05) * 0.05;
draw_sprite_ext(s_error,0,room_width/2,room_height/2,2*cosfactor,2*cosfactor,0,c_white,.1)

