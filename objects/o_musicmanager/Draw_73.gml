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
		var len = bargraph[i];
		draw_healthbar(xx, yy-room_height, xx+width, yy, len*100, c_white, c_white, c_white, 3, false, false);
		xx += width + gap;
	}
}
draw_set_alpha(1)