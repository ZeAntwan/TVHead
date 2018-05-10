str=argument0;//the string to drawxpos=argument1;//the starting x position of the text
xpos=argument1;//the starting x position of the text
ypos=argument2;// the starting y position of the text
cur_width=0;//this is used to see the current width of the "already drawn" characters
len=string_length(str);//the length of the string used to seperate the string into single characters(using an array)
chars[len-1]=0;//the array that holds every single character in the string
//line=0;//the line variable determines how much to jump down from the current postion based on the height of the chars

var i,j;//you know what these are :P

//file_text_open_read(working_directory + str + ".txt");
//txt = file_text_read_string()

for (i=len-1;i>=0;i--)//main loop that seperates the characters and puts them into an array
	chars[i]=string_char_at(str,i+1);
	
for (j=0;j< chars_drawn;j++)
{
    if (chars[j] == "#")
    {
        line+=string_height(chars[j-1]);
		if (line > 621) {
			line = 0;
			draw_clear_alpha(c_black,0);
		}
		cur_width=0;
    }
    else
    {
    draw_text(xpos+cur_width,ypos+line,chars[j]);
    cur_width+=string_width(chars[j]);
	
    }
	
}//the loop that actually draws the characters

draw_text(xpos+cur_width,ypos+line,"_");

draw_text(20,20,line)