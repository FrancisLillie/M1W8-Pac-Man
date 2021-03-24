//------------------------------------------------------------------------------
// scr_GhostsUpdate
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Updates the ghosts
//------------------------------------------------------------------------------

function scr_GhostsUpdate()
{
	// Declare locals.
	
	var iLoop, tObj;
	var nodeIndex;
	var dx, dy
	
	//----------------------
	// Handle the animation.
	//----------------------
	
	for (iLoop = 0; iLoop < 4; iLoop++)
	{
		// Get object reference.
		
		tObj = global.ghostArray[iLoop];

		// Handle anim frame based on mode.
		
		switch (tObj.gMode)
		{
			case MODE_SCATTER:
				if (global.gameState == GS_GAME) tObj.gFrame += 0.1;
				if (tObj.gFrame >= 2) tObj.gFrame -= 2;
				if (iLoop == 0) tObj.gSpr = spr_Ghost01Blinky;
				if (iLoop == 1) tObj.gSpr = spr_Ghost02Pinky;
				if (iLoop == 2) tObj.gSpr = spr_Ghost03Inky;
				if (iLoop == 3) tObj.gSpr = spr_Ghost04Clyde;
				break;
			case MODE_CHASE:
				if (global.gameState == GS_GAME) tObj.gFrame += 0.1;
				if (tObj.gFrame >= 2) tObj.gFrame -= 2;
				if (iLoop == 0) tObj.gSpr = spr_Ghost01Blinky;
				if (iLoop == 1) tObj.gSpr = spr_Ghost02Pinky;
				if (iLoop == 2) tObj.gSpr = spr_Ghost03Inky;
				if (iLoop == 3) tObj.gSpr = spr_Ghost04Clyde;
				break;
			case MODE_FRIGHTENED:
				if (global.gameState == GS_GAME) tObj.gFrame += 0.1;
				if (tObj.gFrame >= 1) tObj.gFrame -= 1;
				tObj.gSpr = spr_GhostFrightened;
				break;
			case MODE_DEAD:
				tObj.gFrame = 0;
				tObj.gSpr = spr_GhostDead;
				break;
		}
		
		// Now work out the actual frame.
		
		switch (tObj.gMode)
		{
			case MODE_SCATTER:
				if (tObj.dx == 1) tObj.actualFrame = 0 + tObj.gFrame;
				if (tObj.dy == 1) tObj.actualFrame = 2 + tObj.gFrame;
				if (tObj.dx == -1) tObj.actualFrame = 4 + tObj.gFrame;
				if (tObj.dy == -1) tObj.actualFrame = 6 + tObj.gFrame;
				break;
			case MODE_CHASE:
				if (tObj.dx == 1) tObj.actualFrame = 0 + tObj.gFrame;
				if (tObj.dy == 1) tObj.actualFrame = 2 + tObj.gFrame;
				if (tObj.dx == -1) tObj.actualFrame = 4 + tObj.gFrame;
				if (tObj.dy == -1) tObj.actualFrame = 6 + tObj.gFrame;
				break;
			case MODE_FRIGHTENED:
				tObj.actualFrame = 0 + tObj.gFrame;
				break;
			case MODE_DEAD:
				if (tObj.dx == 1) tObj.actualFrame = 0 + tObj.gFrame;
				if (tObj.dy == 1) tObj.actualFrame = 1 + tObj.gFrame;
				if (tObj.dx == -1) tObj.actualFrame = 2 + tObj.gFrame;
				if (tObj.dy == -1) tObj.actualFrame = 3 + tObj.gFrame;
				break;
		}
	}
	
	//-------------------------------------------
	// Now handle the actual movement of a ghost.
	//-------------------------------------------
	
	// only do if in the game.
	
	if (global.gameState == GS_GAME)
	{
		for (iLoop = 0; iLoop < 4; iLoop++)
		{
			// Get object reference.
		
			tObj = global.ghostArray[iLoop];
		
			// Get current cx and cy.
		
			tObj.cx = tObj.x div 32;
			tObj.cy = tObj.y div 32;

			// Handle the mode change timer.
		
			tObj.gModeTimer--;
			if (tObj.gMode == MODE_SCATTER || tObj.gMode == MODE_CHASE)
			{
				if (tObj.gModeTimer <= 0)
				{
					if (tObj.gMode == MODE_SCATTER)
					{
						tObj.gMode = MODE_CHASE;
						tObj.gModeTimer = irandom_range(MIN_CHASE_TIME, MAX_CHASE_TIME);
						tObj.tcx = (global.playerObj.x div 32);
						tObj.tcy = (global.playerObj.y div 32);
						tObj.ncx = tObj.cx;
						tObj.ncy = tObj.cy;
					}
					else
					{
						tObj.gMode = MODE_SCATTER;
						tObj.gModeTimer = irandom_range(MIN_SCATTER_TIME, MAX_SCATTER_TIME);
						nodeIndex = irandom_range(0, array_length_1d(global.nodeArray) - 1)
						tObj.tcx = global.nodeArray[nodeIndex].cx;
						tObj.tcy = global.nodeArray[nodeIndex].cy;;
						tObj.ncx = tObj.cx;
						tObj.ncy = tObj.cy;
					}
				}
			}
			else if (tObj.gMode == MODE_FRIGHTENED)
			{
				if (tObj.gModeTimer <= 0)
				{
					tObj.gMode = MODE_SCATTER;
					tObj.gModeTimer = irandom_range(MIN_SCATTER_TIME, MAX_SCATTER_TIME);
					nodeIndex = irandom_range(0, array_length_1d(global.nodeArray) - 1)
					tObj.tcx = global.nodeArray[nodeIndex].cx;
					tObj.tcy = global.nodeArray[nodeIndex].cy;;
					tObj.ncx = tObj.cx;
					tObj.ncy = tObj.cy;
				}
			}

			// Handle movement.
		
			switch (tObj.gMode)
			{
				case MODE_SCATTER:
					scr_GhostActScatter(tObj);
					break;
				case MODE_CHASE:
					scr_GhostActChase(tObj);
					break;
				case MODE_FRIGHTENED:
					scr_GhostActFrightened(tObj);
					break;
				case MODE_DEAD:
					scr_GhostActScatter(tObj);
					//scr_GhostActDead(tObj);
					break;
			}

			// Move the character.
			
			dx = tObj.dx * DEFAULT_SPEED;
			dy = tObj.dy * DEFAULT_SPEED;
	
			if (scr_CanWeMove(tObj.x + dx, tObj.y + dy, tObj.dx, tObj.dy, true) == 0)
			{
				tObj.x += tObj.dx * DEFAULT_SPEED;
				tObj.y += tObj.dy * DEFAULT_SPEED;
			}
			else
			{
				tObj.x = ((tObj.x div 32) * 32) + 16;
				tObj.y = ((tObj.y div 32) * 32) + 16;
			}
		}
	}
}