/// @description Insert description here
global.bgindex = clamp(global.bgindex,0,array_length_1d(bg_array)-1)
usesprite = bg_array[global.bgindex];

// Mood Change
if (global.eyemood == 0) {
	tint_color = merge_color(tint_color,base_color,0.2)
} else {
	tint_color = merge_color(tint_color,target_color,0.2)
}
//target_color = base_color;
