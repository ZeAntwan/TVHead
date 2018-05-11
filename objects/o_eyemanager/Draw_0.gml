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
	
// Sad
if (global.eyemood == 4) {eyemoodfact4 = lerp(eyemoodfact4,1,smooth)} else {eyemoodfact4 = lerp(eyemoodfact4,-1,smooth/2)};
	// Left Eye
	draw_triangle((leye_x+eyesize*3),((leye_y-eyesize+20)+30*(abs(lvaxis))+(eyesize*(1-lblink))),(leye_x-eyesize),(leye_y-2*eyesize),(leye_x-eyesize*3),((leye_y)+30*(abs(lvaxis))+30)*eyemoodfact4,false);
		
	// Right Eye
	draw_triangle((reye_x-eyesize*3),((reye_y-eyesize+20)+30*(abs(lvaxis))+(eyesize*(1-rblink))),(reye_x+eyesize),(reye_y-2*eyesize),(reye_x+eyesize*3),((reye_y)+30*(abs(lvaxis))+30)*eyemoodfact4,false);
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

if (global.emoteeye == 7) {
	draw_set_font(f_mainlarge);
	draw_set_valign(fa_center);
	draw_set_alpha(.7);
	draw_set_color(c_black);
	for (var si = 15; si > 0; si--) {
		draw_text_ext(((room_width/2)-170)+si,(room_height/2)+si,"We'll\nBe\nRight\nBack.",120,1000);	
	}
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text_ext((room_width/2)-170,room_height/2,"We'll\nBe\nRight\nBack.",120,1000);
	draw_set_valign(fa_top);	
}

if (global.emoteeye == 8) {
	//if(!surface_exists(codesurf)) surface_create(room_width,room_height);
	//surface_set_target()
	//codetxt = "uniform float iGlobalTime;#uniform float iTime;#uniform vec2 iResolution;##varying vec2 fragCoord;##vec2 curve(vec2 uv)#{#    uv = (uv - 0.5) * 2.0;#    uv *= 1.1;    #    uv.x *= 1.0 + pow((abs(uv.y) / 5.0), 2.0);#    uv.y *= 1.0 + pow((abs(uv.x) / 4.0), 2.0);#    uv  = (uv / 2.0) + 0.5;#    uv =  uv *0.92 + 0.04;#    return uv;#}#void main(void)#{#    vec2 q = fragCoord.xy / iResolution.xy;#    vec2 uv = q;#    uv = curve( uv );#    vec3 oricol = texture2D( gm_BaseTexture, vec2(q.x,q.y) ).xyz;#    vec3 col;#    float x =  sin(0.3*iTime+uv.y*21.0)*sin(0.7*iTime+uv.y*29.0)*sin(0.3+0.33*iTime+uv.y*31.0)*0.0017;##    col.r = texture2D(gm_BaseTexture,vec2(x+uv.x+0.001,uv.y+0.001)).x+0.05;#    col.g = texture2D(gm_BaseTexture,vec2(x+uv.x+0.000,uv.y-0.002)).y+0.05;#    col.b = texture2D(gm_BaseTexture,vec2(x+uv.x-0.002,uv.y+0.000)).z+0.05;#    col.r += 0.02*texture2D(gm_BaseTexture,0.75*vec2(x+0.025, -0.027)+vec2(uv.x+0.001,uv.y+0.001)).x;#    col.g += 0.02*texture2D(gm_BaseTexture,0.75*vec2(x+-0.022, -0.02)+vec2(uv.x+0.000,uv.y-0.002)).y;#    col.b += 0.02*texture2D(gm_BaseTexture,0.75*vec2(x+-0.02, -0.018)+vec2(uv.x-0.002,uv.y+0.000)).z;##    col = clamp(col*0.6+0.4*col*col*1.0,0.0,1.0);##    float vig = (0.0 + 1.0*16.0*uv.x*uv.y*(1.0-uv.x)*(1.0-uv.y));#    col *= vec3(pow(vig,0.3));##    col *= vec3(0.95,1.05,0.95);#    col *= 2.8;##    float scans = clamp( 0.35+0.35*sin(3.5*iTime+uv.y*iResolution.y*1.5), 0.0, 1.0);#    #    float s = pow(scans,1.7);#    col = col*vec3( 0.4+0.7*s) ;##    col *= 1.0+0.01*sin(110.0*iTime);#    if (uv.x < 0.0 || uv.x > 1.0)#        col *= 0.0;#    if (uv.y < 0.0 || uv.y > 1.0)#        col *= 0.0;#    #    col*=1.0-0.65*vec3(clamp((mod(fragCoord.x, 2.0)-1.0)*2.0,0.0,1.0));#    #    float comp = smoothstep( 0.1, 0.9, sin(iTime) );# #    // Remove the next line to stop cross-fade between original and postprocess#//    col = mix( col, oricol, comp );##    gl_FragColor = vec4(col,1.0);#}#"
	draw_set_font(f_code);
	if(scr_TextDisplay(codetxt,50,50,621)) {chars_drawn = 0;}
}


#endregion
