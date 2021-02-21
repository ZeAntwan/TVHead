/// @description Display text in a code like manner IN A SURFACE
/// @param string String to display
/// @param x x Position of text
/// @param y y Position of text
/// @param maxh Maximum height before clearing surface
function scr_TextDisplayBot(argument0, argument1, argument2, argument3) {

	str=argument0;
	xpos=argument1;//the starting x position of the text
	ypos=argument2;// the starting y position of the text
	maxh = argument3;
	var cur_width=0;//this is used to see the current width of the "already drawn" characters
	var len=string_length(str);//the length of the string used to seperate the string into single characters(using an array)
	var chars=array_create(len-1,0);//the array that holds every single character in the string
	array_create(len-1,0)
	var line=0; //the line variable determines how much to jump down from the current postion based on the height of the chars
	var i,j;//you know what these are :P

	//main loop that seperates the characters and puts them into an array
	for (i=len-1;i>=0;i--) chars[i]=string_char_at(str,i+1);
	
	for (j=0; j < chars_drawn; j++)
	{
		// Line Breaks
		if (chars[j] == "#" or chars[j] == "\n")
	    {
	        line+=string_height(chars[j-1]);
			if (line > maxh) {
				line = 0;
				draw_clear_alpha(c_black,0);
			}
			cur_width=0;
	    }
	    else
	    {
	    draw_text(xpos+cur_width,ypos+line,chars[j]);
	
	    }
		// If NBSP do not update cur_with
		if (chars[j] != " ") {
			cur_width+=string_width(chars[j]);
		}
	
	}//the loop that actually draws the characters

	//draw_text(xpos+cur_width,ypos+line,"_");
	draw_rectangle(xpos+cur_width+5,ypos+line,(xpos+cur_width+5+string_width(chars[0])),(ypos+line+(string_height(chars[0])*.75)),false);
	if (chars_drawn < len) {
		chars_drawn++;
	} else {
		return true
	}


}
