//------------------------------------------------------------------------------
// scr_PostGameRender
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Renders the post game screen
//------------------------------------------------------------------------------

function scr_PostGameRender()
{
	// Declare locals.
	
	var value;
	var myString;
	
	// Only process if actuall post-game.
	
	if (global.gameState == GS_POSTGAME)
	{
		// Lives and end of game, or end of level.
		
		if (global.playerObj.pacLives == 0)
		{
			// Display top line.
	
			scr_Font_Print_Sprite("GAME OVER", room_width / 2, 14 * 32, 1, 1, 1, 1, c_white, 1, 2, fa_center, fa_top);
		
			// Work out how happy we are.
		
			value = (global.playerObj.speedMult * 100);
			if (value == 100) myString = "YOU DIED " + string_format(value, 3, 0) + "% HAPPY"
			else if (value < 10) myString = "YOU DIED " + string_format(value, 1, 0) + "% HAPPY"
			else myString = "YOU DIED " + string_format(value, 2, 0) + "% HAPPY"
			scr_Font_Print_Sprite(myString, room_width / 2, 20 * 32, 1, 1, 1, 1, c_white, 1, 2, fa_center, fa_top);
		}
		else
		{
			// Display top line.
	
			scr_Font_Print_Sprite("CONGRATULATIONS", room_width / 2, 14 * 32, 1, 1, 1, 1, c_white, 1, 3, fa_center, fa_top);
		
			// Work out how happy we are.
		
			value = (global.playerObj.speedMult * 100);
			if (value == 100) myString = "YOU WERE " + string_format(value, 3, 0) + "% HAPPY"
			else if (value < 10) myString = "YOU WERE " + string_format(value, 1, 0) + "% HAPPY"
			else myString = "YOU WERE " + string_format(value, 2, 0) + "% HAPPY"
			scr_Font_Print_Sprite(myString, room_width / 2, 20 * 32, 1, 1, 1, 1, c_white, 1, 3, fa_center, fa_top);
		}
	}
}