/// @description Insérez la description ici
if (audio_is_playing(s_startupboot)) {
	audio_stop_sound(s_startupboot);
}
if (audio_is_playing(s_startup)) {
	audio_stop_sound(s_startup);
}
