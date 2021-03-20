//-----------------------------------------------------------------------------
// scr_Font_Print
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
//          -   Y offset                (arg14)
//          -   Maximum width           (arg15)
//-----------------------------------------------------------------------------

function scr_Font_Print(nString, nx, ny, nXScale, nYScale, nAngle, colTL, colTR, colBR, colBL, nAlpha, nFont, nHAlign, nVAlign, nYOffset, nMaxW)
{

	// Declare locals.

	var txtW, txtH;
	var x1, x2, y1, y2;

	// Set up the correct font and alignment.

	draw_set_font(nFont);
	draw_set_halign(nHAlign);
	draw_set_valign(nVAlign);

	// Now decide what draw function to use.

	if (nXScale == 1 && nYScale == 1 && nAngle == 0)
	{
	    draw_text_color(nx, ny, string_hash_to_newline(nString), colTL, colTR, colBR, colBL, nAlpha);
	    txtW = string_width(string_hash_to_newline(nString));
	    txtH = string_height(string_hash_to_newline(nString));
	}
	else if (nAngle != 0 && nMaxW != -1)
	{
	    draw_text_ext_transformed_color(nx, ny, string_hash_to_newline(nString), nYOffset, nMaxW, nXScale, nYScale, nAngle, colTL, colTR, colBR, colBL, nAlpha);
	    txtW = string_width_ext(string_hash_to_newline(nString), -1, -1);
	    txtH = string_height_ext(string_hash_to_newline(nString), -1, -1);
	}
	else
	{
	    draw_text_transformed_color(nx, ny, string_hash_to_newline(nString), nXScale, nYScale, nAngle, colTL, colTR, colBR, colBL, nAlpha);
	    txtW = string_width_ext(string_hash_to_newline(nString), -1, -1);
	    txtH = string_height_ext(string_hash_to_newline(nString), -1, -1);
	}


}
