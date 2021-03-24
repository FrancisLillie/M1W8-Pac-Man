//------------------------------------------------------------------------------
// scr_PostGameRender
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Renders the post game screen
//------------------------------------------------------------------------------

function scr_PostGameUpdate()
{
	// Update timer.
	
	if (global.gameState == GS_POSTGAME)
	{
		if (++global.postGameDelay >= (room_speed * 5.5))
		{
			if (global.playerObj.pacLives == 0)
			{
				scr_InitLevel(1, true, true);
				global.gameState = GS_PREGAME;
			}
			else
			{
				global.Level++;
				scr_InitLevel(1, false, true);
				global.gameState = GS_PREGAME;
			}
		}
	}
}