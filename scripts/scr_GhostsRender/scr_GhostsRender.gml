//------------------------------------------------------------------------------
// scr_GhostsRender
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Render the ghosts.
//------------------------------------------------------------------------------

function scr_GhostsRender()
{
	// Declare locals.
	
	var iLoop, tObj;
	
	// If we are dying then quit early.
	
	if (global.playerObj.pacDying)
	{
		return;
	}
	
	// Only display in certain circmstances.
	
	if (global.gameState == GS_GAME || (global.gameState == GS_PREGAME && global.preGamePhase == 1))
	{
		// Process all ghosts.
		
		for (iLoop = 0; iLoop < 4; iLoop++)
		{
			// Get object reference.
			
			tObj = global.ghostArray[iLoop];
			
			// Display the sprite.
			
			if (tObj.gMode == MODE_DEAD)
			{
				tObj.gSpr = spr_GhostDead;
			}
			
			scr_Sprite_AddSorted(tObj.x, tObj.y, 125, 0, 0, 1, 1, 0, 1, tObj.actualFrame, tObj.gSpr, c_white, true, false, false);
		}
	}
}