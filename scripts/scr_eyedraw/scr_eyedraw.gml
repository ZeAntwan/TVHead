// @description Draw an eye
// @param eye_x
// @param eye_y
// @param eye_size
// @param eyeblink
// @param size_multiplier

var eyex = argument0
var eyey = argument1
var eyesize = argument2
var eyeblink = argument3
var sizefact = argument4
var stroke = argument5

draw_ellipse(eyex-(eyesize*sizefact) , eyey-((eyesize*sizefact)*(eyeblink)) , eyex+(eyesize*sizefact) , eyey+((eyesize*sizefact)*(eyeblink)) , stroke)
