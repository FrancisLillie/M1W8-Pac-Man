//------------------------------------------------------------------------------
// scr_OverlaysRender
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Renders the overlays
//------------------------------------------------------------------------------

function scr_OverlaysRender()
{
	// Declare locals.
	
	var lString;
	
	// Display the score.
	
	lString = string(global.Score);
	scr_Font_Print_Sprite(lString, 16, 16, 1, 1, 1, 1, c_white, 1, 0, fa_left, fa_top);

	// Display the level.

	lString = "L" + string(global.Level);
	scr_Font_Print_Sprite(lString, room_width - 16, 16, 1, 1, 1, 1, c_white, 1, 0, fa_right, fa_top);
}
