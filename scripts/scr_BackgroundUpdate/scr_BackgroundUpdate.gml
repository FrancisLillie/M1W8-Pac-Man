//-----------------------------------------------------------------------------
// scr_BackgroundUpdate
//-----------------------------------------------------------------------------
// Author   -   Francis Lillie
// Created  -   28/02/2021 17:54
// Abstract -   Update the background
//-----------------------------------------------------------------------------

function scr_BackgroundUpdate()
{
	// Declare locals.
	
	var iLoop;
	var xSpeed;
	
	// Don't scroll if we are too far.
	
	if (global.scrollX[5] >= ((SCROLL_SCREEN_W * 3) - room_width))
	{
		return;
	}
	
	// Don't scroll if player if dying or dead.
	
	if (global.playerObj.Exploding || global.playerObj.Dead)
	{
		return;
	}
	
	// Process all scroll values.
	
	for (iLoop = 5; iLoop >= 0; iLoop--)
	{
		// Create the speed.
		
		switch (iLoop)
		{
			case 0:
				xSpeed = 3.5;
				break;
			case 1:
				xSpeed = 4;
				break;
			case 2:
				xSpeed = 4.5;
				break;
			case 3:
				xSpeed = 5;
				break;
			case 4:
				xSpeed = 5.5;
				break;
			case 5:
				xSpeed = 6;
				break;
		}
		
		global.scrollX[iLoop] += xSpeed;
	}
}