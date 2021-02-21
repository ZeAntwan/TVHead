/// @description Debug UI
// Direction Debug
if (global.debugmode) {
	draw_set_halign(fa_right);
	draw_text(global.screenw-50,50, "Outangle : " + string(outangle))
	draw_text(global.screenw-50,80, "Stick angle : " + string(dir))
	draw_text(global.screenw-50,110, "Subimg : " + string(subimg))
	draw_text(global.screenw-50,140, "Cospos : " + string((cospos*2)))
	
	salpha = .3
} else {	
	salpha = 1
}
