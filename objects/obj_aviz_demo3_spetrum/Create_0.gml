
musiclist[0] = file_find_first("music/*.ogg",0);

if(musiclist[0] =="") show_debug_message("EMPTY:" + string(musiclist[0]))


var nextsong = file_find_next();

for (var i = 1; nextsong != ""; i++) {
	musiclist[i] = nextsong;
	show_debug_message(string(i) + " : " + musiclist[i]);
	nextsong = file_find_next();
}

event_user(10)

// create the audio controls
is_playing = false;
is_paused = false;

with (instance_create_depth(room_width/2 - 64, room_height/2, depth-1, obj_aviz_play_control)) {
	control = other.id;
}
with (instance_create_depth(room_width/2 + 64, room_height/2, depth-1, obj_aviz_stop_control)) {
	control = other.id;
}

// create seek control
last_sample = 0;
seek_to = 0;

with (instance_create_depth(room_width/2, room_height/2+64, depth-1, obj_aviz_seek_control)) {
	control = other.id;
}