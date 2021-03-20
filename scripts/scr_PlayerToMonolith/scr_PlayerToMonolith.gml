//------------------------------------------------------------------------------
// scr_PlayerToMonolith
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Checks for all player shots to ghosts
//------------------------------------------------------------------------------

function scr_PlayerToMonolith()
{
	// Are we within range.
	
	if (global.playerObj.x >= (global.monolithObj.x - 42.5))
	{
		if (global.playerObj.x <= (global.monolithObj.x + 42.5))
		{
			if (global.playerObj.y >= (global.monolithObj.y - 214.5))
			{
				if (global.playerObj.y <= (global.monolithObj.y + 214.5))
				{
					if (!global.fadeActive)
					{
						scr_Fade_InitDown(1);
						global.monolithObj.hasBeenHit = true;
					}
				}
			}
		}
	}
}