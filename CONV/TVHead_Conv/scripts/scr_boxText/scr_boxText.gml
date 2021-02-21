/// @description Create a text box with a substrated text
/// @param {real} x
/// @param {real} y
/// @param {real} border
/// @param {string} string
/// @param {string} [alignement]
/// @param {bool} [outline]
function scr_boxText() {

	if (argument_count > 4) {
		var _align = argument[4]
	} else {
		var _align = fa_center;
	}

	if (argument_count > 5) {
		var _outline = argument[5]
	} else {
		var _outline = false
	}

	switch _align {
		case fa_left : {
			draw_set_halign(fa_left);
			draw_rectangle(
				(argument[0]-argument[2]),
				argument[1]-argument[2],
				argument[0]+string_width(string(argument[3]))+argument[2],
				argument[1]+string_height(string(argument[3]))+argument[2]-7,
				_outline
			);
			break
		}
		case fa_right : {
			draw_set_halign(fa_right);
			draw_rectangle(
				(argument[0]+argument[2]),
				argument[1]-argument[2],
				argument[0]-string_width(string(argument[3]))-argument[2],
				argument[1]+string_height(string(argument[3]))+argument[2]-7,
				_outline
			);
			break
		}
		case fa_center : {	
			draw_set_halign(fa_center);
			draw_rectangle(
				(argument[0]-(string_width(string(argument[3]))*(0.5))-argument[2]),
				argument[1]-argument[2],
				(argument[0]+(string_width(string(argument[3]))*(0.5))+argument[2]),
				argument[1]+string_height(string(argument[3]))+argument[2]-7,
				_outline
			);
			break
		}
	}


	draw_set_halign(_align);
	draw_set_valign(fa_top);
	if (!_outline) {draw_set_blend_mode(bm_subtract);}
	draw_text(argument[0], argument[1], argument[3]);
	draw_set_blend_mode(bm_normal);


}
