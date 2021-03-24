//------------------------------------------------------------------------------
// scr_GhostsInitialise
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Initialise the ghosts.
//------------------------------------------------------------------------------

function scr_GhostsInitialise()
{
	// Declare locals.
	
	var iLoop;
	var tObj
	
	// Set up all 4 ghosts.
	
	for (iLoop = 0; iLoop < 4; iLoop++)
	{
		// Create a new entry.
				
		tObj = global.ghostArray[iLoop];
		if (tObj != 0)
		{
			instance_destroy(tObj);
		}
		global.ghostArray[iLoop] = instance_create_depth(-64, -64, -10000, obj_Ghost);
				
		// Set up out ghost.
				
		tObj = global.ghostArray[iLoop];
		switch (iLoop)
		{
			case 0:
				tObj.gName = "BLINKY";
				tObj.x = (14 * 32);
				tObj.y = (14 * 32) + 16;
				tObj.dx = -1;
				tObj.dy = 0;
				tObj.gSpr = spr_Ghost01Blinky;
				tObj.tcx = 1;
				tObj.tcy = 4
				break;
			case 1:
				tObj.gName = "PINKY";
				tObj.x = (14 * 32);
				tObj.y = (17 * 32) + 16;
				tObj.dx = 0;
				tObj.dy = 1;
				tObj.gSpr = spr_Ghost02Pinky;
				tObj.tcx = 26;
				tObj.tcy = 4
				break;
			case 2:
				tObj.gName = "INKY";
				tObj.x = (12 * 32);
				tObj.y = (17 * 32) + 16;
				tObj.dx = 0;
				tObj.dy = -1;
				tObj.gSpr = spr_Ghost03Inky;
				tObj.tcx = 1;
				tObj.tcy = 32
				break;
			case 3:
				tObj.gName = "CLYDE";
				tObj.x = (16 * 32);
				tObj.y = (17 * 32) + 16;
				tObj.dx = 0;
				tObj.dy = -1;
				tObj.gSpr = spr_Ghost04Clyde;
				tObj.tcx = 26;
				tObj.tcy = 32
				break;
		}
		tObj.gMode = MODE_SCATTER;
		tObj.gModeTimer = irandom_range(MIN_SCATTER_TIME, MAX_SCATTER_TIME);
		tObj.gFrame = 0;
		tObj.actualFrame = 0;
		tObj.cx = tObj.x div 32;
		tObj.cy = tObj.y div 32;
		tObj.ncx = tObj.cx;
		tObj.ncy = tObj.cy;
	}
}