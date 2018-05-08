/// @description DEBUG UI

if (debugmode) {
	draw_text(5,5,"Emote : " + string(global.emoteeye));

	draw_text(5,30,"Mood : " + string(global.eyemood));

	draw_text(5,55,"Timer : " + string(get_timer()));
	
	draw_text(5,80,"Window : " + string(screenw) + " * " + string(screenh)) ;
}