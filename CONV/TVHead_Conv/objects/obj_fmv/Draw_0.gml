//Play loaded video
edgefmv_play(30,0,0,0,1.67,1.67,0,c_white,1,true, true);

//Draw overlay during pause
if global.fmv_pause = true {
   //Draw overlay
   draw_set_alpha(0.4);
   draw_set_blend_mode_ext(bm_inv_dest_alpha,bm_src_color);
   draw_rectangle_colour(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 ),c_dkgray,c_dkgray,c_black,c_black,false);
   draw_set_blend_mode(bm_normal);
   draw_set_alpha(1);
   //Draw text
   draw_set_font(Orbitron);
   draw_text_colour(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-183+3,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-90+3,string_hash_to_newline("PAUSED"),c_black,c_black,c_black,c_black,0.8);
   draw_text_colour(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-183,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-90,string_hash_to_newline("PAUSED"),c_white,c_white,c_ltgray,c_ltgray,1);
   draw_set_font(-1);
   //Draw progress bar
   draw_rectangle_colour(__view_get( e__VW.XView, 0 )+25,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-35,__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-25,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-25,c_dkgray,c_dkgray,c_dkgray,c_dkgray,false);
   edgefmv_draw_progress(__view_get( e__VW.XView, 0 )+25,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-35,__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-25,__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )-25,c_white,c_white,c_ltgray,c_ltgray,false);
}

//Draw info
var text_color = c_white;
draw_text_colour(25,25,string_hash_to_newline("Space/Click = Pause | S = Skip | R = Replay | U = Unload"),text_color,text_color,text_color,text_color,0.8);
draw_text_colour(25,50,string_hash_to_newline("Volume: " + string(global.fmv_audio_volume*100)),text_color,text_color,text_color,text_color,0.8);

