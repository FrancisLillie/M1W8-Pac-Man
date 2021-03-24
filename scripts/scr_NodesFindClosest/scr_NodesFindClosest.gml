//------------------------------------------------------------------------------
// scr_NodesFindClosest
//------------------------------------------------------------------------------
// Inputs	-	Array of all visible node indices
//			-	Our ghost
// Outputs	-	Index into list of node closest to target
// Notes	-	Find closest node to target that is not us
//------------------------------------------------------------------------------

function scr_NodesFindClosest(nodeIndices, tObj)
{
	// Declare locals.
	
	var iLoop;
	var dx, dy;
	var dist, smallest;
	var myIndex;
	var reason;
	
	// Go through all of them.
	
	smallest = 1000;
	myIndex = -1;
	reason = "";
	for (iLoop = 0; iLoop < array_length_1d(nodeIndices); iLoop++)
	{
		// Make deltas to ultimate target.
		
		dx = tObj.tcx - global.nodeArray[nodeIndices[iLoop]].cx;
		dy = tObj.tcy - global.nodeArray[nodeIndices[iLoop]].cy;
		
		// Only process if this nodex isn't our current node.
		
		reason = "";
		if (global.nodeArray[nodeIndices[iLoop]].cx == tObj.cx && global.nodeArray[nodeIndices[iLoop]].cy == tObj.cy)
		{
			reason = "Same node";
		}
		if (global.nodeArray[nodeIndices[iLoop]].cx == tObj.lcx && global.nodeArray[nodeIndices[iLoop]].cy == tObj.lcy)
		{
			reason = "Last node";
		}
		if (tObj.dx == 1 && global.nodeArray[nodeIndices[iLoop]].cx < tObj.cx)
		{
			reason = "Moving right and node to left";
		}
		if (tObj.dx == -1 && global.nodeArray[nodeIndices[iLoop]].cx > tObj.cx)
		{
			reason = "Moving left and node to right";
		}
		if (tObj.dy == 1 && global.nodeArray[nodeIndices[iLoop]].cy < tObj.cy)
		{
			reason = "Moving down and node above";
		}
		if (tObj.dy == -1 && global.nodeArray[nodeIndices[iLoop]].cy > tObj.cy)
		{
			reason = "Moving up and node below";
		}
		if (tObj.gMode == MODE_CHASE || tObj.gMode == MODE_SCATTER)
		{
			if (global.nodeArray[nodeIndices[iLoop]].cx >= 11 && global.nodeArray[nodeIndices[iLoop]].cx <= 16)
			{
				if (global.nodeArray[nodeIndices[iLoop]].cy >= 16 && global.nodeArray[nodeIndices[iLoop]].cy <= 18)
				{
					if (tObj.cx < 11 || tObj.cx > 16)
					{
						if (tObj.cy < 16 || tObj.cy > 18)
						{
							reason = "Node is in home (1), but ghost isn't";
						}
					}
				}
			}
			if (global.nodeArray[nodeIndices[iLoop]].cx >= 13 && global.nodeArray[nodeIndices[iLoop]].cx <= 14)
			{
				if (global.nodeArray[nodeIndices[iLoop]].cy == 15)
				{
					if (tObj.cx < 13 || tObj.cx > 14)
					{
						if (tObj.cy != 15)
						{
							reason = "Node is in home (2), but ghost isn't";
						}
					}
				}
			}
		}
		if (reason == "")
		{
			dist = sqrt((dx * dx) + (dy * dy));
			if (dist < smallest)
			{
				smallest = dist;
				myIndex = iLoop;
			}
		}
	}
	
	// Return the index.
	
	return myIndex;
}