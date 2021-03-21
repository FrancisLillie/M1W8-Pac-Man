//------------------------------------------------------------------------------
// scr_IsMoveValid
//------------------------------------------------------------------------------
// Inputs	-	Player x position
//			-	Player y position
//			-	X delta to check
//			-	Y delta to check
// Outputs	-	True for ok to move, false otherwise
//------------------------------------------------------------------------------

function scr_IsMoveValid(nx, ny, dx, dy)
{
	// Declare locals.
	
	var cx0, cy0, cx1, cy1, cx2, cy2;
	var cx, cy;
	var collSum;
	var bound;
	
	// Initialisation.
	
	bound = 8;
	
	// Get the current cell values.
	
	cx = nx div 32;
	cy = ny div 32;
	collSum = 0;
	
	// Now test direction.
	
	if (dx == -1)
	{
		cx0 = (nx - 32) div 32;
		cx1 = cx0;
		cx2 = cx0;
		cy0 = (ny + bound) div 32;
		cy1 = (ny + 0) div 32;
		cy2 = (ny - bound) div 32;
	}
	else if (dx == 1)
	{
		cx0 = (nx + 32) div 32;
		cx1 = cx0;
		cx2 = cx0;
		cy0 = (ny + bound) div 32;
		cy1 = (ny + 0) div 32;
		cy2 = (ny - bound) div 32;
	}
	else if (dy == -1)
	{
		cx0 = (nx - bound) div 32;
		cx1 = (nx + 0) div 32;
		cx2 = (nx + bound) div 32;
		cy0 = (ny - 32) div 32;
		cy1 = cy0;
		cy2 = cy0;
	}
	else
	{
		cx0 = (nx - bound) div 32;
		cx1 = (nx + 0) div 32;
		cx2 = (nx + bound) div 32;
		cy0 = (ny + 32) div 32;
		cy1 = cy0;
		cy2 = cy0;
	}

	// Wrap the X values.
	
	if (cx0 < 0) cx0 =0;
	if (cx0 >= 28) cx0 = 27;
	if (cx1 < 0) cx1 = 0;
	if (cx1 >= 28) cx1 = 27;
	if (cx2 < 0) cx2 = 0;
	if (cx2 >= 28) cx2 = 27;
	
	// Wrap the Y values.
	
	if (cy0 < 0) cx0 = 0;
	if (cy0 >= 36) cx0 = 35;
	if (cy1 < 0) cx1 = 0;
	if (cy1 >= 36) cx1 = 35;
	if (cy2 < 0) cx2 = 0;
	if (cy2 >= 36) cx2 = 35;

	// Get collision sum.
		
	collSum += global.levelData[cy0, cx0];
	collSum += global.levelData[cy1, cx1];
	collSum += global.levelData[cy2, cx2];
	
	// Return a value.
	
	return (collSum);
}