/// @description 

if (!surface_exists(skinsurf)) {skinsurf = surface_create(room_width,room_height);}

surface_set_target(skinsurf);
draw_clear_alpha(c_black,0);
draw_set_color(c_white);

global.eyeright = true;
global.eyeleft = true;
global.eyedraw = true;

switch global.eyeskin {
	case 1:
		global.eyedraw = false;
	break;

	case 2:
		global.eyeright = false;
		
		var wiggleeye_x = random_range(-3,3)
		var wiggleeye_y = random_range(-3,3)
		
		scr_eyedraw(o_eyemanager.reye_x+wiggleeye_x,o_eyemanager.reye_y+wiggleeye_y, o_eyemanager.reyesize, o_eyemanager.rblink, 1, true);
		
		draw_set_color(sanscol);
		scr_eyedraw(o_eyemanager.reye_x+wiggleeye_x,o_eyemanager.reye_y+wiggleeye_y, o_eyemanager.reyesize, o_eyemanager.rblink, .7, false);
		
		gpu_set_blendmode(bm_subtract);
		scr_eyedraw(o_eyemanager.reye_x+wiggleeye_x,o_eyemanager.reye_y+wiggleeye_y, o_eyemanager.reyesize, o_eyemanager.rblink, .15, false);
		
		gpu_set_blendmode(bm_normal);
		draw_set_color(c_white);
	break;
	
	case 3:
		global.eyeright = false;
		draw_sprite_ext(sk_monokuma,0,o_eyemanager.reye_x,o_eyemanager.reye_y,1,o_eyemanager.rblink,0,c_white,1);
	break;
	
	default:
		global.eyeright = true;
		global.eyeleft = true;
		global.eyedraw = true;
	break;
}

gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface(skinsurf,0,0);

draw_set_color(c_white);
