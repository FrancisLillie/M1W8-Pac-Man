//-----------------------------------------------------------------------------
// scr_Font_Print
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
//          -   Y offset
//          -   Maximum width
//-----------------------------------------------------------------------------

function scr_Font_Print(nString, nx, ny, nXScale, nYScale, nAngle, colTL, colTR, colBR, colBL, nAlpha, nFont, nHAlign, nVAlign, nYOffset, nMaxW)
{
	// Declare locals.

	var txtW, txtH;

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
