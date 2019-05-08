/// @description Set variables and generate random

if (instance_exists(o_bgmanager)) {
	with(o_bgmanager) {
		event_user(0)
	}
}


costime = 0;

// Error Sound
audio_play_sound(sfx_error,10,false);

infoX = room_width/2
infoY = room_height*0.2
outline = 10;

title = "STUFFMAKER OS CRITICAL ERROR"


errortypes = [

]

errorcode = "0x0000001A"

errormsg = @"A fatal exception has occured at 0x73747566660d0a. The current process has been shut down to prevent damage to your computer.

* If this is the first time you've seen this stop error screen, restart your computer.

    Technical information:
    *** STOP : 0x0000001A";

switch date_get_weekday(date_current_datetime()) {
	case 0 : currentday = "Mon"
	case 1 : currentday = "Tue"
	case 2 : currentday = "Wed"
	case 3 : currentday = "Thu"
	case 4 : currentday = "Fri"
	case 5 : currentday = "Sat"
	case 6 : currentday = "Sun"
}

switch date_get_month(date_current_datetime()) {
	case 0 : currentmonth = "Jan"
	case 1 : currentmonth = "Feb"
	case 2 : currentmonth = "Mar"
	case 3 : currentmonth = "Apr"
	case 4 : currentmonth = "May"
	case 5 : currentmonth = "Jun"
	case 6 : currentmonth = "Jul"
	case 7 : currentmonth = "Aug"
	case 8 : currentmonth = "Sep"
	case 9 : currentmonth = "Oct"
	case 10 : currentmonth = "Nov"
	case 11 : currentmonth = "Dec"
}

errordate = currentday + " " + string(date_get_day(date_current_datetime())) + " " + currentmonth + " " + string(date_get_year(date_current_datetime()))