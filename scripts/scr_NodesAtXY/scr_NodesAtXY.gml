//------------------------------------------------------------------------------
// scr_NodesAtXY
//------------------------------------------------------------------------------
// Inputs	-	Cell X position
//			-	Cell Y position
// Outputs	-	Node index if there is one at XY, otherwise -1
// Notes	-	Sees if a node is at XY and returns the index
//------------------------------------------------------------------------------

function scr_NodesAtXY(cx, cy)
{
	// Declare locals.
	
	var iLoop;
	
	// Loop through all.
	
	for (iLoop = 0; iLoop < array_length_1d(global.nodeArray); iLoop++)
	{
		if (global.nodeArray[iLoop].cx == cx)
		{
			if (global.nodeArray[iLoop].cy == cy)
			{
				return iLoop;
			}
		}
	}
	
	// Getting here means no node.
	
	return -1;
}