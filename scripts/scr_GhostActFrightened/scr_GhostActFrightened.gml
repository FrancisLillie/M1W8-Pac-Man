//------------------------------------------------------------------------------
// scr_GhostActFrightened
//------------------------------------------------------------------------------
// Inputs	-	Ghost object
// Outputs	-	None
// Notes	-	Moves a ghost in frightened mode
//------------------------------------------------------------------------------

function scr_GhostActFrightened(tObj)
{
	// Declare locals.
	
	var nodeIndices;
	var nodeIndex;
	var dx, dy, needNewTarget;
	
	// Intialisation.
	
	needNewTarget = false;
	
	// Decide if we have hit interrim target.
	
	if (tObj.cx == tObj.tcx && tObj.cy == tObj.tcy)
	{
		dx = tObj.x - ((tObj.cx * 32) + 16);
		dy = tObj.y - ((tObj.cy * 32) + 16);
		if (dx <= 8 && dy <= 8)
		{
			tObj.lcx = tObj.cx;
			tObj.lcy = tObj.cy;
			nodeIndex = irandom_range(0, array_length_1d(global.nodeArray) - 1);
			tObj.tcx = global.nodeArray[nodeIndex].cx;
			tObj.tcy = global.nodeArray[nodeIndex].cy;
			needNewTarget = true;
		}
	}
	else if (tObj.cx == tObj.ncx && tObj.cy == tObj.ncy)
	{
		dx = tObj.x - ((tObj.cx * 32) + 16);
		dy = tObj.y - ((tObj.cy * 32) + 16);
		if (dx <= 8 && dy <= 8)
		{
			tObj.lcx = tObj.cx;
			tObj.lcy = tObj.cy;
			needNewTarget = true;
		}
	}
	
	// Do we need a new target.
	
	if (needNewTarget)
	{
		//tObj.x = ((tObj.cx * 32) + 16);
		//tObj.y = ((tObj.cy * 32) + 16);
		tObj.x = ((tObj.x div 32) * 32) + 16;
		tObj.y = ((tObj.y div 32) * 32) + 16;

		// Initialisation.
	
		nodeIndices = scr_NodesCast(tObj);
	
		// Find the closest node to target that is not our current node.
	
		nodeIndex = scr_NodesFindClosest(nodeIndices, tObj);
	
		// Only process if this is not -1 (should not be possible).
	
		if (nodeIndex != -1)
		{
			// Set up new interrim target.
		
			tObj.ncx = global.nodeArray[nodeIndices[nodeIndex]].cx;
			tObj.ncy = global.nodeArray[nodeIndices[nodeIndex]].cy;
		
			// Now decide on deltas.
		
			if (tObj.cy == tObj.ncy)
			{
				if (tObj.ncx < tObj.cx)
				{
					tObj.dx = -1;
					tObj.dy = 0;
				}
				else
				{
					tObj.dx = +1;
					tObj.dy = 0;
				}
			}
			else
			{
				if (tObj.ncy < tObj.cy)
				{
					tObj.dx = 0;
					tObj.dy = -1;
				}
				else
				{
					tObj.dx = 0;
					tObj.dy = 1;
				}
			}
		}
	}
}

