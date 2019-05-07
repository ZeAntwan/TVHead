
musiclist[0] = file_find_first("musics/*.ogg",0);

if(musiclist[0] =="") show_debug_message("EMPTY:" + string(musiclist[0]))


var nextsong = file_find_next();

for (var i = 1; nextsong != ""; i++) {
	musiclist[i] = nextsong;
	show_debug_message(string(i) + " : " + musiclist[i]);
	nextsong = file_find_next();
}

event_user(10)