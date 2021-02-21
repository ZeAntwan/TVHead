/// @description Draw Vizualizer

// draw our FFT using healthbars!
if (is_playing) {
	var xx = 0;
	var yy = room_height;
	var width = room_width/bars - 5;
	var gap = 5;
	xx += gap/2;
	draw_set_color(c_white);
	draw_set_alpha(.5)
	for (var i=0; i<bars; i++) {
		var color = make_color_hsv((255/bars)*i, 255, 255)
		var len = bargraph[i];
		draw_healthbar(xx, yy-room_height*.8, xx+width, yy, len*100, color, color, color, 3, false, false);
		xx += width + gap;
	}
}
draw_set_alpha(1)

draw_set_blend_mode(bm_normal)

if (error) {
	draw_sprite_ext(s_error,0,room_width/2,room_height/2,3,3,0,c_red,.2);
	scr_boxText(infoX,infoY,outline,"No .ogg files found in music folder", fa_center, true)
}