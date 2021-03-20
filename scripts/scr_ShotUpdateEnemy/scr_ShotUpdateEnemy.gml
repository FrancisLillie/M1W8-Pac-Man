//------------------------------------------------------------------------------
// scr_ShotUpdateEnemy
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Updates invaders shots
//------------------------------------------------------------------------------

function scr_ShotUpdateEnemy()
{
	// Declare locals.
	
	var iLoop, screenX;
	
	// Find a free slot.
	
	for (iLoop = 0; iLoop < MAX_NME_SHOTS; iLoop++)
	{
		if (global.nmeShotGrid[iLoop].Active)
		{
			// Adjust the dx value.
			
			global.nmeShotGrid[iLoop].dx -= 0.5;
			if (global.nmeShotGrid[iLoop].dx <= -18) global.nmeShotGrid[iLoop].dx = -18;
			
			// Adjust the x position.
			
			global.nmeShotGrid[iLoop].x += global.nmeShotGrid[iLoop].dx;
			
			// Animate.
			
			if (++global.nmeShotGrid[iLoop].FrameDelay >= 3)
			{
				global.nmeShotGrid[iLoop].FrameDelay = 0;
				if (++global.nmeShotGrid[iLoop].Frame == 3)
				{
					global.nmeShotGrid[iLoop].Frame = 0;
				}
			}
			
			// Test to see if we need to kill it.
			
			screenX = global.nmeShotGrid[iLoop].x - global.scrollX[5];
			
			if (screenX <= -(room_width / 1.1))
			{
				global.nmeShotGrid[iLoop].Active = false;
			}
		}
	}
}