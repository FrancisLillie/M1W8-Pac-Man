//------------------------------------------------------------------------------
// scr_ShotUpdatePlayer
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Updates invaders shots
//------------------------------------------------------------------------------

function scr_ShotUpdatePlayer()
{
	// Declare locals.
	
	var iLoop, screenX;
	
	// Find a free slot.
	
	for (iLoop = 0; iLoop < MAX_SHOTS; iLoop++)
	{
		if (global.shotGrid[iLoop].Active)
		{
			// Adjust the dx value.
			
			global.shotGrid[iLoop].dx += 0.5;
			if (global.shotGrid[iLoop].dx >= 32) global.shotGrid[iLoop].dx = 32;
			
			// Adjust the x position .
			
			global.shotGrid[iLoop].x += global.shotGrid[iLoop].dx;
			
			// Now rotate.
			
			global.shotGrid[iLoop].Rotation -= 15;
			
			// Test to see if we need to kill it.
			
			screenX = global.shotGrid[iLoop].x - global.scrollX[5];
			
			if (screenX >= (room_width * 1.1))
			{
				global.shotGrid[iLoop].Active = false;
			}
		}
	}
}