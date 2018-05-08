/// @description Insert description here

// Mood Change
if (global.eyemood == 3) {
	tint_color = c_red
} else {
	tint_color = lerp(tint_color,base_color,0.2)
}
