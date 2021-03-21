//------------------------------------------------------------------------------
// scr_PlayerRender
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Renders the player
//------------------------------------------------------------------------------

function scr_PlayerRender()
{
	// Declare locals.
	
	var lFrame;
	
	// Draw the player.
	
	switch (global.gameState)
	{
		case GS_PREGAME:
			lFrame = 2;
			break;
		case GS_GAME:
			if (global.playerObj.dx == -1)
			{
				lFrame = global.lFrames[global.playerObj.animFrameIndex];
			}
			else if (global.playerObj.dx == 1)
			{
				lFrame = global.rFrames[global.playerObj.animFrameIndex];
			}
			else if (global.playerObj.dy == -1)
			{
				lFrame = global.uFrames[global.playerObj.animFrameIndex];
			}
			else
			{
				lFrame = global.dFrames[global.playerObj.animFrameIndex];
			}
			break;
	}
	scr_Sprite_AddSorted(global.playerObj.x, global.playerObj.y, 10, 0, 0, 1, 1, 0, 1, lFrame, spr_PacMan, c_white, true, false, false);
}