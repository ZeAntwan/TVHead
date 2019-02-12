/// @description Insert description here
global.bgindex = clamp(global.bgindex,0,array_length_1d(bg_array)-1)

//
usesprite = bg_array[global.bgindex];

// Mood Change
if (instance_exists(o_eyemanager)) {
	target_color = c_white;
	bg_anim = true;
	if (global.eyemood != 0 or global.emoteeye != 0) {
		// Eye Mood
		switch global.eyemood {
		case 1: target_color = c_white; break;
		
		case 3: target_color = c_red; break;
		}
		// Emote Eye
		switch global.emoteeye {
		case 1: target_color = c_white; break;
		
		case 7: target_color = c_orange; bg_anim = false; break;
		}
	}
}

if (global.forcebgstop) {bg_anim = false;};
tint_color = merge_color(tint_color,target_color,0.2)	
