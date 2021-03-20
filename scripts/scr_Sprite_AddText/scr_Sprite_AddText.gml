//-----------------------------------------------------------------------------
// scr_Sprite_AddText
//-----------------------------------------------------------------------------
// Inputs   -   Text string to print    (arg0)
//          -   X position              (arg1)
//          -   Y position              (arg2)
//          -   X scale                 (arg3)
//          -   Y scale                 (arg4)
//          -   Angle of text           (arg5)
//          -   Colour for TL           (arg6)
//          -   Colour for TR           (arg7)
//          -   Colour for BR           (arg8)
//          -   Colour for BL           (arg9)
//          -   Alpha                   (arg10)
//          -   Font to use             (arg11)
//          -   H alignment to use      (arg12)
//          -   V alignment to use      (arg13)
//          -   Screen space flag       (arg14)
//-----------------------------------------------------------------------------

function scr_Sprite_AddText(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13, argument14)
{

	// Declare locals.

	var pw, ph;
	var lx, ly;

	// Adjust x and y based on screen space flag.

	if (argument14 == true)
	{
	    argument1 = (argument1 + global.virtualOffsetX) * global.virtualToScreenScaleX;
	    argument2 = (argument2 + global.virtualOffsetY) * global.virtualToScreenScaleY;
	}
	else
	{
	    argument1 = argument1 * global.virtualToScreenScaleX;
	    argument2 = argument2 * global.virtualToScreenScaleY;
	}

	// Create new scales based on virtual to screen scales.

	argument3 = argument3 * global.virtualToScreenScaleX;
	argument4 = argument4 * global.virtualToScreenScaleY;

	// Now create an object.

	obj = instance_create(argument1, argument2, obj_Sprite);
	obj.text = argument0;
	obj.x = argument1;
	obj.y = argument2;
	obj.xscale = argument3;
	obj.yscale = argument4;
	obj.rot = argument5;
	obj.colTL = argument6;
	obj.colTR = argument7;
	obj.colBR = argument8;
	obj.colBL = argument9;
	obj.alpha = argument10;
	obj.font = argument11;
	obj.halign = argument12;
	obj.valign = argument13;
	obj.list = SPR_TEXT;
	obj.inScreenSpace = argument14;

	// Now add the object to an array.

	if (global.sprCount4 < MAX_SPR_TEXT)
	{
	    global.sprText[global.sprCount4] = obj;
	    global.sprCount4 = global.sprCount4 + 1;
	}

	// Get bounding rectangle.

	draw_set_font(argument11);
	if (argument3 == 1 && argument4 == 1 && argument5 == 0)
	{
	    txtW = string_width(string_hash_to_newline(argument0));
	    txtH = string_height(string_hash_to_newline(argument0));
	}
	else
	{
	    txtW = string_width_ext(string_hash_to_newline(argument0), -1, -1);
	    txtH = string_height_ext(string_hash_to_newline(argument0), -1, -1);
	}

	// From the given width, work out left and right of text.

	if (argument12 == fa_center)
	{
	    x1 = argument1 - ((txtW * argument3) / 2);
	    x2 = argument1 + ((txtW * argument3) / 2);
	}
	else if (argument12 == fa_right)
	{
	    x1 = argument1 - (txtW * argument3);
	    x2 = argument1;    
	}
	else
	{
	    x1 = argument1;
	    x2 = argument1 +  (txtW * argument3);
	}

	// From the given height, work out top and bottom of text.

	if (argument13 == fa_middle)
	{
	    y1 = argument2 - ((txtH * argument4) / 2);
	    y2 = argument2 + ((txtH * argument4) / 2);
	}
	else if (argument13 == fa_bottom)
	{
	    y1 = argument2 - (txtH * argument4);
	    y2 = argument2;
	}
	else
	{
	    y1 = argument2;
	    y2 = argument2 +  (txtH * argument4);
	}

	// Now store in global zone.

	global.zoneX = x1;
	global.zoneW = (x2 - x1);
	global.zoneY = y1;
	global.zoneH = (y2 - y1);
}
