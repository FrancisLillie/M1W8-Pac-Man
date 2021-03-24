//------------------------------------------------------------------------------
// scr_PreGameRender
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Shows the pre-game sequence
//------------------------------------------------------------------------------

function scr_PreGameRender()
{
	if (global.gameState == GS_PREGAME)
	{
		if (global.preGamePhase == 0)
		{
			scr_Sprite_AddSorted(room_width / 2, (room_height / 2) - 56 -16, 1000, 0, 0, 1, 1, 0, 1, 0, spr_PreGame, c_white, true, false, false);
		}
		scr_Sprite_AddSorted(room_width / 2, (room_height / 2) + 56 - 16, 1000, 0, 0, 1, 1, 0, 1, 1, spr_PreGame, c_white, true, false, false);
	}
}
