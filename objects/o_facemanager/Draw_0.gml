/// @description Face Drawing

// Reset Active bounce
// Cosinus animation factor

if (sizebounce) {
	cossize = 1 + sin(costime * 0.1) * 0.1;
} else {
	cossize = lerp(cossize,1,0.5);
}
if (posbounce) {
	cospos = sin(costime * 0.1) * 0.1;;
} else {
	cospos = lerp(cospos,0,0.5);
}

if (sizebounce or posbounce) {costime++} else {costime = 0}

// Reset Bounce
sizebounce = false;
posbounce = false;

// Sprite Orientation
if (outangle) {
	var j = 1;
	for (var i = 0; i <= 360; i+=360/12) {
		if (j == 13) j = 1;
		if (i <= dir+360/24 and dir+360/24 <= i+360/12) {subimg = j} 
		
		if (global.debugmode) {
			var _xx = dx + lengthdir_x(150, i+360/24);
			var _yy = dy + lengthdir_y(150, i+360/24);
			draw_line(dx,dy,_xx,_yy);
		}
		j++;
	}
} else {
	subimg = 0
}

if (global.eyemood == 0) {sprite_index = osprite}
if (global.eyemood == 1) {
	sprite_index = s_face2;
	posbounce = true;
	//sizebounce = true;
}



if (subimg != 0) {
	posbounce = false;
	sizebounce = false;
}
// Draw the sprite
draw_sprite_ext(sprite_index,subimg,x,y+(cospos*250),(size)*(cossize),(size)*(cossize),0,c_white,salpha);


// Debug Center
if (global.debugmode) {
	draw_circle(x,y,5,false);
}


