/// @description Insert description here
global.bgindex = clamp(global.bgindex,0,array_length_1d(sprite_array)-1)
usesprite = sprite_array[global.bgindex];

// Mood Change
if (global.eyemood == 3) {
	tint_color = merge_color(tint_color,c_red,0.2)
} else {
	tint_color = merge_color(tint_color,base_color,0.2)
}
