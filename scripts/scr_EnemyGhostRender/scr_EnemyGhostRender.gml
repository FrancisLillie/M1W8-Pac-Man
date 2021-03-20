//------------------------------------------------------------------------------
// scr_EnemyGhostRender
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Render all ghost enemies
//------------------------------------------------------------------------------

function scr_EnemyGhostRender()
{
	// Declare locals.
	
	var iLoop
	var tObj;
	var lCol, lScaleX, lScaleY, lAlpha;
	var lx, ly;
	var lBank;
	
	// Process all ghosts.
	
	for (iLoop = 0; iLoop < MAX_GHOSTS; iLoop++)
	{
		tObj = global.ghostGrid[iLoop];
		
		// Only process active ghosts.
		
		if (tObj.Active)
		{
			// Set up the colour.
			
			if (tObj.hitPoints <= 0 || tObj.beenHit)
			{
				lCol = c_red;
			}
			else
			{
				lCol = c_white;
			}
			
			// Set up variables based on state.
		
			if (tObj.hitPoints <= 0)
			{
				lScaleX = GHOST_SCALE_X * (1 + (1 - tObj.Alpha));
				lScaleY = GHOST_SCALE_Y * (1 + (1 - tObj.Alpha));
				lAlpha = tObj.Alpha;
				lBank = spr_GhostFly;
			}
			else if (tObj.attacking)
			{
				lScaleX = GHOST_SCALE_X;
				lScaleY = GHOST_SCALE_Y;
				lAlpha = 1;
				lBank = spr_GhostAttack;
			}
			else if (tObj.fadingIn || tObj.fadingOut || tObj.stayOut)
			{
				lScaleX = GHOST_SCALE_X;
				lScaleY = GHOST_SCALE_Y;
				lAlpha = tObj.Alpha;
				lBank = spr_GhostFly;
			}
			else
			{
				lScaleX = GHOST_SCALE_X;
				lScaleY = GHOST_SCALE_Y;
				lAlpha = 1;
				lBank = spr_GhostFly;
			}
		
			// Now display the sprite.
		
			lx = tObj.x - global.scrollX[5];
			ly = tObj.y - global.scrollY[5];
			scr_Sprite_AddSorted(lx, ly, 20, 0, 0, lScaleX, lScaleY, 0, lAlpha, tObj.Frame, lBank, lCol, SPR_SORTED, true, false, false);
		}
	}
}