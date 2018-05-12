/// @description Debug UI
// Direction Debug
if (global.debugmode) {
	draw_set_halign(fa_right);
	draw_text(global.screenw-50,50, "Stick angle :" + string(dir))
	draw_text(global.screenw-50,80, "Subimg :" + string(subimg))
	salpha = .3
} else {	
	salpha = 1
}
