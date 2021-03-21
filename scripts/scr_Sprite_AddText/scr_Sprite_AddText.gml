//-----------------------------------------------------------------------------
// scr_Sprite_AddText
//-----------------------------------------------------------------------------
// Inputs   -   Text string to print
//          -   X position
//          -   Y position
//          -   X scale
//          -   Y scale
//          -   Angle of text
//          -   Colour for TL
//          -   Colour for TR
//          -   Colour for BR
//          -   Colour for BL
//          -   Alpha
//          -   Font to use
//          -   H alignment to use
//          -   V alignment to use
//          -   Screen space flag 
//-----------------------------------------------------------------------------

function scr_Sprite_AddText(thisText, xPos, yPos, xScale, yScale, tAngle, tlCol, trCol, brCol, blCol, tAlpha, tFont, hAlign, vAlign, screenSpace)
{
	// Adjust x and y based on screen space flag.

	if (screenSpace == true)
	{
	    xPos = (xPos + global.virtualOffsetX) * global.virtualToScreenScaleX;
	    yPos = (yPos + global.virtualOffsetY) * global.virtualToScreenScaleY;
	}
	else
	{
	    xPos = xPos * global.virtualToScreenScaleX;
	    yPos = yPos * global.virtualToScreenScaleY;
	}

	// Create new scales based on virtual to screen scales.

	xScale = xScale * global.virtualToScreenScaleX;
	yScale = yScale * global.virtualToScreenScaleY;

	// Now create an object.

	obj = instance_create(xPos, yPos, obj_Sprite);
	obj.text = thisText;
	obj.x = xPos;
	obj.y = yPos;
	obj.xscale = xScale;
	obj.yscale = yScale;
	obj.rot = tAngle;
	obj.colTL = tlCol;
	obj.colTR = trCol;
	obj.colBR = brCol;
	obj.colBL = blCol;
	obj.alpha = tAlpha;
	obj.font = tFont;
	obj.halign = hAlign;
	obj.valign = vAlign;
	obj.list = SPR_TEXT;
	obj.inScreenSpace = screenSpace;

	// Now add the object to an array.

	if (global.sprCount4 < MAX_SPR_TEXT)
	{
	    global.sprText[global.sprCount4] = obj;
	    global.sprCount4 = global.sprCount4 + 1;
	}

	// Get bounding rectangle.

	draw_set_font(tFont);
	if (xScale == 1 && yScale == 1 && tAngle == 0)
	{
	    txtW = string_width(string_hash_to_newline(thisText));
	    txtH = string_height(string_hash_to_newline(thisText));
	}
	else
	{
	    txtW = string_width_ext(string_hash_to_newline(thisText), -1, -1);
	    txtH = string_height_ext(string_hash_to_newline(thisText), -1, -1);
	}

	// From the given width, work out left and right of text.

	if (hAlign == fa_center)
	{
	    x1 = xPos - ((txtW * xScale) / 2);
	    x2 = xPos + ((txtW * xScale) / 2);
	}
	else if (hAlign == fa_right)
	{
	    x1 = xPos - (txtW * xScale);
	    x2 = xPos;    
	}
	else
	{
	    x1 = xPos;
	    x2 = xPos +  (txtW * xScale);
	}

	// From the given height, work out top and bottom of text.

	if (vAlign == fa_middle)
	{
	    y1 = yPos - ((txtH * yScale) / 2);
	    y2 = yPos + ((txtH * yScale) / 2);
	}
	else if (vAlign == fa_bottom)
	{
	    y1 = yPos - (txtH * yScale);
	    y2 = yPos;
	}
	else
	{
	    y1 = yPos;
	    y2 = yPos +  (txtH * yScale);
	}

	// Now store in global zone.

	global.zoneX = x1;
	global.zoneW = (x2 - x1);
	global.zoneY = y1;
	global.zoneH = (y2 - y1);
}
