/// @description Draw Info

draw_set_halign(fa_center);
draw_set_font(f_mainnoaa);

if (animation != 0 and (global.music or global.forcemusic)) {
	draw_rectangle(
		(infoX-(string_width(string(currentmusic))*(0.5*animation))-outline*animation),
		infoY-outline,
		(infoX+(string_width(string(currentmusic))*(0.5*animation))+outline*animation),
		infoY+string_height(string(currentmusic))+outline,
		false
	);
	draw_set_blend_mode(bm_subtract);
	draw_text(infoX, infoY, string_replace(currentmusic,".ogg",""))
}

