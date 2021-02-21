/// @description Insert description here
global.bgindex = clamp(global.bgindex,0,array_length(bg_array)-1)

//
if (usesprite != bg_array[global.bgindex] && !bg_channelswitch) {
	audio_play_sound(sfx_bgchange,10,false)
	bg_channelswitch = true;
}

if (bg_channelswitch) {
	if (bg_switchanim >= 1) {
		bg_channelswitch = false;
		usesprite = bg_array[global.bgindex];
		bg_switchanim = 0
		}
	bg_switchanim += bg_switchanimspd;
}

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
	
	tint_color = merge_color(tint_color,target_color,0.2)

} else {
	tint_color = c_white;
}

if (global.forcebgstop) {bg_anim = false;};
//tint_color = merge_color(tint_color,target_color,0.2)	
