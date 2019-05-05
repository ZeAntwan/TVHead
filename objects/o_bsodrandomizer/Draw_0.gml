/// @description Insérez la description ici

draw_set_font(f_code);

draw_set_halign(fa_center);

draw_set_color(c_white);

// Error Message
draw_text(room_width/2, room_height*.35, errormsg)

// Date Stamp
scr_boxText(outline*3,room_height-(string_height(errordate)+outline*3),outline,errordate, fa_left, true);

// Error code
scr_boxText(room_width - outline*3,room_height-(string_height(errordate)+outline*3),outline,errordate, fa_right);

// Header Title

scr_boxText(infoX,infoY,outline,title);


