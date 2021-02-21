/// @description Insert description here

//bg_array = [
//bg_black,
//bg_vid,
//bg_laia,
//bg_neon,
//bg_under,
//bg_wegs,
//bg_textilized,
//bg_blue
//];

bg_array = 0

// Finds all the "bg_" sprites to use as backgrounds
for (var i=0; i<10000; i++)
{
    if !sprite_exists(i) break;
   
    var spr = sprite_get_name(i);
    if string_pos("bg_", spr) == 1
    {
		bg_array[array_length(bg_array)] = i; // or "= spr;" if you want sprite's name
	}
}

for (var j=0; i< array_length(bg_array)-1;j++) {
	show_debug_message(bg_array[j])
}



usesprite = bg_array[global.bgindex]

_img = 0;

base_color = c_white
tint_color = base_color;
target_color = base_color;

bg_anim = true;

bg_channelswitch = false;
bg_switchanim = 0;
bg_switchanimspd = .01*room_speed;