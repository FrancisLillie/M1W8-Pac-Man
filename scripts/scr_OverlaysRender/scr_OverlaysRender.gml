//------------------------------------------------------------------------------
// scr_OverlaysRender
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Renders the overlays
//------------------------------------------------------------------------------

function scr_OverlaysRender()
{
	// Not really an overlay, but render the background.
	
	scr_Sprite_AddNormal(0, 0, 0, 0, 0, 1, 1, 0, 1, 0, spr_Screen, c_white, true, false, false);
	
	// Display high score text.
	
	scr_Font_Print_Sprite("HIGH SCORE", 288, 0, 1, 1, 1, 1, c_white, 1, 0, fa_left, fa_top);
	if (global.playerScore >= global.highScore)
	{
		scr_Font_Print_Sprite(string(global.playerScore), 544, 32, 1, 1, 1, 1, c_white, 1, 0, fa_right, fa_top);
	}
}
