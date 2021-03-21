//------------------------------------------------------------------------------
// scr_CanWeMove
//------------------------------------------------------------------------------
// Inputs	-	Player x position
//			-	Player y position
//			-	X delta to check
//			-	Y delta to check
// Outputs	-	True for ok to move, false otherwise
//------------------------------------------------------------------------------

function scr_CanWeMove(nx, ny, dx, dy)
{
	// Declare locals.
	
	var cx0, cy0;
	var cx, cy;
	var collSum;
	var bound;
	
	// Initialisation.
	
	bound = 16;
	
	// Get the current cell values.
	
	cx = nx / 32;
	cy = ny / 32;
	collSum = 0;
	
	// Now test direction.
	
	if (dx == -1)
	{
		cx0 = (nx - bound) / 32;
		cy0 = (ny + 0) / 32;
	}
	else if (dx == 1)
	{
		cx0 = (nx + bound) / 32;
		cy0 = (ny + 0) / 32;
	}
	else if (dy == -1)
	{
		cx0 = (nx + 0) / 32;
		cy0 = (ny - bound) / 32;
	}
	else
	{
		cx0 = (nx + 0) / 32;
		cy0 = (ny + bound) / 32;
	}

	// Wrap the X values.
	
	if (cx0 < 0) cx0 =0;
	if (cx0 >= 28) cx0 = 27;
	
	// Wrap the Y values.
	
	if (cy0 < 0) cx0 = 0;
	if (cy0 >= 36) cx0 = 35;

	// Get collision sum.
		
	collSum += global.levelData[cy0, cx0];
	
	// Return a value.
	
	return (collSum);
}