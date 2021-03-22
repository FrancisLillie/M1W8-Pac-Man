//-----------------------------------------------------------------------------
// scr_Font_Print_Sprite
//-----------------------------------------------------------------------------
// Inputs   -   Text string to print    (arg0)
//          -   X position              (arg1)
//          -   Y position              (arg2)
//          -   X scale 1               (arg3)
//          -   Y scale 1               (arg4)
//          -   X scale 2               (arg5)
//          -   Y scale 2               (arg6)
//          -   Colour                  (arg7)
//          -   Alpha                   (arg8)
//          -   Font to use             (arg9)
//          -   H alignment to use      (arg10)
//          -   V alignment to use      (arg11)
//-----------------------------------------------------------------------------

function scr_Font_Print_Sprite(nString, nx, ny, xScale1, yScale1, xScale2, yScale2, nColour, nAlpha, nFont, nHAlign, nVAlign)
{
	// Declare locals.

	var thisFont;
	var pw, ph;
	var len;
	var scaleStepX, scaleStepY;
	var scaleX, scaleY, maxScaleY;
	var char1, char2;
	var dx, dy;
	var t, b;

	// First thing we need to do is check the font is withing range.

	if (nFont < global.fontCount)
	{
	    // Set up point to font object.
    
	    thisFont = fontArray[nFont];
    
	    // Get the string length.
    
	    len = string_length(nString);
    
	    // Create default top and bottom.
    
	    t = thisFont.frameHeight;
	    b = 0;
    
	    // Create the scale step.
    
	    if (len > 1)
	    {
	        scaleStepX = (xScale2 - xScale1) / (len - 1)
	        scaleStepY = (yScale2 - yScale1) / (len - 1)
	    }
	    else
	    {
	        scaleStepX = 0;
	        scaleStepY = 0;
	    }
	    scaleX = xScale1;
	    scaleY = yScale1;
	    maxScaleY = 0;
    
	    // Get the overall width and height.
    
	    if (thisFont.kern == true)
	    {
	        pw = 0;
	        for (iLoop = 1; iLoop <= len; iLoop++)
	        {
	            if (iLoop != len)
	            {
	                char1 = string_byte_at(nString, iLoop + 0);
	                char2 = string_byte_at(nString, iLoop + 1);
	                char1 = char1 - thisFont.firstChar;
	                char2 = char2 - thisFont.firstChar;
	                pw = pw + ((thisFont.frameWidth - thisFont.kernTable[(char1 * thisFont.numChars) + char2]) * scaleX);
	            }
	            else
	            {
	                char1 = string_byte_at(nString, iLoop + 0);
	                char1 = char1 - thisFont.firstChar;
	                pw = pw + (((thisFont.lrTable[(char1 * 2) + 1] - thisFont.lrTable[(char1 * 2) + 0]) + 1) * scaleX);
	            }
	            scaleX = scaleX + scaleStepX;
	        }
	        ph = thisFont.frameHeight * max(yScale1, yScale2);
        
	        char1 = string_byte_at(nString, iLoop) - thisFont.firstChar;
	        if (char1 != 32)
	        {
	            if (thisFont.tbTable[(char1 * 2) + 0] < t) t = thisFont.tbTable[(char1 * 2) + 0];
	            if (thisFont.tbTable[(char1 * 2) + 1] > b) b = thisFont.tbTable[(char1 * 2) + 1];
	        }
	    }
	    else
	    {
	        pw = 0
	        for (iLoop = 0; iLoop < len; iLoop++)
	        {
	            pw = pw + (thisFont.frameWidth * scaleX);
	            scaleX = scaleX + scaleStepX;
	        }
	        ph = thisFont.frameHeight * max(yScale1, yScale2);

	        char1 = string_byte_at(nString, iLoop) - thisFont.firstChar;
	        if (char1 != 32)
	        {
	            if (thisFont.tbTable[(char1 * 2) + 0] < t) t = thisFont.tbTable[(char1 * 2) + 0];
	            if (thisFont.tbTable[(char1 * 2) + 1] > b) b = thisFont.tbTable[(char1 * 2) + 1];
	        }
	    }
    
	    // Adjust x position based on h alignment.
    
	    if (nHAlign == fa_center)
	    {
	        dx = nx - (pw / 2);
	    }
	    else if (nHAlign == fa_right)
	    {
	        dx = nx - pw;
	    }
	    else
	    {
	        dx = nx;
	    }
    
	    // Adjust y position based on v alignment.

	    if (nVAlign == fa_middle)
	    {
	        dy = ny - (ph / 2);
	    }
	    else if (nVAlign == fa_bottom)
	    {
	        dy = ny - ph;
	    }
	    else
	    {
	        dy = ny;
	    }
    
	    //show_debug_message(nString + ": w=" + string(pw) + ", " + string(dx));
    
	    // Now it's time to loop round and add sprites.
    
	    scaleX = xScale1;
	    scaleY = yScale1;
	    global.zoneX = dx;
	    for (iLoop = 1; iLoop <= len; iLoop++)
	    {
	        char = string_byte_at(nString, iLoop)
	        if (char >= thisFont.firstChar)
	        {
	            if (char != 32)
	            {
	                scr_Sprite_AddTextSprite(dx, dy, 0, 0, 0, scaleX, scaleY, 0, nAlpha, char - thisFont.firstChar, thisFont.sprName, nColour, false);
	            }
	        }

	        // Add to x position according to kerning.

	        if (thisFont.kern)
	        {
	            if (iLoop != len)
	            {
	                char1 = string_byte_at(nString, iLoop + 0);
	                char2 = string_byte_at(nString, iLoop + 1);
	                char1 = char1 - thisFont.firstChar;
	                char2 = char2 - thisFont.firstChar;
	                dx = dx + ((thisFont.frameWidth - thisFont.kernTable[(char1 * thisFont.numChars) + char2]) * scaleX);
	            }
	            else
	            {
	                char1 = string_byte_at(nString, iLoop + 0);
	                char1 = char1 - thisFont.firstChar;
	                dx = dx + (((thisFont.lrTable[(char1 * 2) + 1] - thisFont.lrTable[(char1 * 2) + 0]) + 1) * scaleX);
	            }
	        }
	        else
	        {
	            dx = dx + (thisFont.frameWidth * scaleX);
	        }
        
	        //dy = dy + (thisFont.frameHeight * scaleY);
        
	        // Adjust the scale.
        
	        scaleX = scaleX + scaleStepX;
	        scaleY = scaleY + scaleStepY;
	        if (scaleY > maxScaleY)
	        {
	            maxScaleY = scaleY;
	        }

	        // Add to y position according to scale height.
        
	        if (nVAlign == fa_middle)
	        {
	            dy = dy - (thisFont.frameHeight * (scaleStepY / 2))
	        }
	        else if (nVAlign == fa_bottom)
	        {
	            dy = dy - (thisFont.frameHeight * scaleStepY);
	        }
	    }
    
	    // Set up zone information.
    
	    b = thisFont.frameHeight - b;
	    global.zoneW = abs(dx - global.zoneX);
	    global.zoneY = dy + (t * maxScaleY);
	    global.zoneH = (thisFont.frameHeight * maxScaleY);
	    global.zoneH = global.zoneH - ((t + b) * maxScaleY);
	}


}
