/// @description Main Draw

// General
draw_set_font(f_main);
gpu_set_blendmode(bm_normal);

if (!surface_exists(eyesurf)) {eyesurf = surface_create(room_width,room_height);}

// Set the target surface, clear it (filling black), and set color to white
surface_set_target(eyesurf);
draw_clear_alpha(c_black,0);
draw_set_color(c_white);

#region Draw Eye
// LEFT EYE
//draw_circle(leye_x,leye_y,eyesize,false);
draw_ellipse(leye_x-leyesize , leye_y-(leyesize*(lblink)) , leye_x+leyesize , leye_y+(leyesize*(lblink)) , false)

// RIGHT EYE
//draw_circle(reye_x,reye_y,eyesize,false);
draw_ellipse(reye_x-reyesize , reye_y-(reyesize*(rblink)) , reye_x+reyesize , reye_y+(reyesize*(rblink)) , false)

// Eye covers
gpu_set_blendmode(bm_subtract);
if (global.eyemood == 0) {

};

#region Eye Moods
// Happy Eyes
if (global.eyemood == 1) {eyemoodfact = lerp(eyemoodfact,0,smooth)} else {eyemoodfact = lerp(eyemoodfact,3,smooth)};
	// LEFT EYE
	//draw_circle(leye_x,leye_y,eyesize,false);
	draw_ellipse((leye_x-leyesize) , (leye_y-(leyesize*(lblink)))+(eyemoodmod+(eyesize*eyemoodfact)+10*(-(abs(lvaxis)))) , leye_x+leyesize , (leye_y+(leyesize*(lblink)))+(eyemoodmod+(eyesize*eyemoodfact)) , false);

	// RIGHT EYE
	//draw_circle(reye_x,reye_y,eyesize,false);
	draw_ellipse((reye_x-reyesize) , (reye_y-(reyesize*(rblink)))+(eyemoodmod+(eyesize*eyemoodfact)+10*(-(abs(lvaxis)))) , reye_x+reyesize , (reye_y+(reyesize*(rblink)))+(eyemoodmod+(eyesize*eyemoodfact)) , false);
	
// Sad
if (global.eyemood == 2) {eyemoodfact2 = lerp(eyemoodfact2,1,smooth)} else {eyemoodfact2 = lerp(eyemoodfact2,8,smooth)};
	// Left Eye
	draw_rectangle((leye_x-(leyesize*2)),(leye_y-(leyesize*2)),(leye_x+(leyesize+10)),leye_y-(eyemoodmod-(eyemoodmod*(1-lblink))-20*(-(abs(lvaxis))))*eyemoodfact2,false);
		
	// Right Eye
	draw_rectangle((reye_x-(reyesize*2)),(reye_y-(reyesize*2)),(reye_x+(reyesize+10)),reye_y-(eyemoodmod-(eyemoodmod*(1-rblink))-20*(-(abs(lvaxis))))*eyemoodfact2,false);
		
// Angry
if (global.eyemood == 3) {eyemoodfact3 = lerp(eyemoodfact3,1,smooth)} else {eyemoodfact3 = lerp(eyemoodfact3,-1,smooth/2)};
	// Left Eye
	draw_triangle((leye_x-eyesize*3),((leye_y-eyesize+20)+30*(abs(lvaxis))+(eyesize*(1-lblink))),(leye_x+eyesize),(leye_y-2*eyesize),(leye_x+eyesize*3),((leye_y)+30*(abs(lvaxis))+30)*eyemoodfact3,false);
		
	// Right Eye
	draw_triangle((reye_x+eyesize*3),((reye_y-eyesize+20)+30*(abs(lvaxis))+(eyesize*(1-rblink))),(reye_x-eyesize),(reye_y-2*eyesize),(reye_x-eyesize*3),((reye_y)+30*(abs(lvaxis))+30)*eyemoodfact3,false);
#endregion

// Clean Eyes if not shown
if(!global.eyedraw) {draw_clear_alpha(c_black,0);}

gpu_set_blendmode(bm_normal);

#endregion

#region Face buttons emotes
if (global.emoteeye != 0) {
	moodsmooth = lerp(moodsmooth,1,eyesmooth);
} else {
	moodsmooth = lerp(moodsmooth,0,eyesmooth);
}

if (global.emoteeye == 1) {

}

if (global.emoteeye == 2) {
	// Draw "?"
	draw_sprite_ext(s_what,0,room_width/2,room_height/2,(room_width/(sprite_get_width(s_what))),(room_width/(sprite_get_width(s_what)))*moodsmooth,40*((1-cosfactor)*2),c_white,1);
} 

if (global.emoteeye == 3) {
	// Loader
	z += 0.02; // Circle Speed
	var _cn = 0;
	for (var ci = 0; ci <= 2*pi; ci += pi/(cn/2)) {
		cx = (room_width/2)+d*cos((z*pi)+ci); //x position
		cy = (room_height/2)+d*(moodsmooth*sin((z*pi)+ci)); //y position
		
		draw_set_alpha(1 - _cn);
		draw_circle(cx,cy,(eyesize/2)*moodsmooth,false);
		
		_cn += 1/(cn+5);

	}
	draw_set_alpha(1)

	
} else {
	z = 0;
}

if (global.emoteeye == 4) {
	// Draw "idea"
	draw_sprite_ext(s_bulb,0,room_width/2,room_height/2,cosfactor,cosfactor*moodsmooth,0,c_white,1);
}

// Sleep
if (global.emoteeye == 5) {
	leye_x = lerp(leye_x, leye_dx, eyesmooth);
	leye_y = lerp(leye_y, leye_dy + 2*eyeradius,eyesmooth);
	
	reye_x = lerp(reye_x, reye_dx, eyesmooth);
	reye_y = lerp(reye_y, reye_dy + 2*eyeradius,eyesmooth);
	
	rblink = lerp(rblink,0.4,1);
	lblink = lerp(lblink,0.4,1);
}

// Tape 
if (global.emoteeye == 6) {
	taperot+=1.5
	taped = 1.5*eyesize;
	tapew = taped-20;
	
	draw_ellipse(leye_x-taped,leye_y-taped,leye_x+taped,leye_y+taped,false);
	draw_ellipse(reye_x-taped,reye_y-taped,reye_x+taped,reye_y+taped,false);
	
	draw_rectangle(leye_x+2, leye_y+tapew,reye_x-2,reye_y+taped,false);
	
	gpu_set_blendmode(bm_subtract);
	draw_ellipse(leye_x-tapew,leye_y-tapew,leye_x+tapew,leye_y+tapew,false);
	draw_ellipse(reye_x-tapew,reye_y-tapew,reye_x+tapew,reye_y+tapew,false);
	
	gpu_set_blendmode(bm_normal);
	draw_sprite_ext(s_k7roll,0,leye_x,leye_y,1,moodsmooth,taperot,c_white,1);
	draw_sprite_ext(s_k7roll,0,reye_x,reye_y,1,moodsmooth,taperot,c_white,1);
} else {
	taperot = 0;
}


#endregion
