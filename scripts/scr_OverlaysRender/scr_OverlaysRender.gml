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
	
	scr_Font_Print_Sprite(string(global.ghostArray[0].ncx), 0, 0, 1, 1, 1, 1, c_green, 1, 0, fa_left, fa_top);
	scr_Font_Print_Sprite(string(global.ghostArray[0].ncy), 0, 32, 1, 1, 1, 1, c_green, 1, 0, fa_left, fa_top);
	scr_Font_Print_Sprite(string(global.ghostArray[1].ncx), 0, 48, 1, 1, 1, 1, c_green, 1, 0, fa_left, fa_top);
	scr_Font_Print_Sprite(string(global.ghostArray[1].ncy), 0, 80, 1, 1, 1, 1, c_green, 1, 0, fa_left, fa_top);
	scr_Font_Print_Sprite(string(global.ghostArray[2].ncx), 0, 128, 1, 1, 1, 1, c_green, 1, 0, fa_left, fa_top);
	scr_Font_Print_Sprite(string(global.ghostArray[2].ncy), 0, 160, 1, 1, 1, 1, c_green, 1, 0, fa_left, fa_top);
	scr_Font_Print_Sprite(string(global.ghostArray[0].ncx), 0, 208, 1, 1, 1, 1, c_green, 1, 0, fa_left, fa_top);
	scr_Font_Print_Sprite(string(global.ghostArray[0].ncy), 0, 240, 1, 1, 1, 1, c_green, 1, 0, fa_left, fa_top);
}
