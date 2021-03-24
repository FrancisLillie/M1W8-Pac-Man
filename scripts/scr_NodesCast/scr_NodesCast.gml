//------------------------------------------------------------------------------
// scr_NodesCast
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Initialise all the decision nodes
//------------------------------------------------------------------------------

function scr_NodesCast(tObj)
{
	// Declare locals.
	
	var nodeIndices, iLoop;
	var newIndex, nodesFound;	
	
	// Initialisation.
	
	nodesFound = 0;
	
	// Cast U.
	
	for (iLoop = tObj.cy; iLoop >= 3; iLoop--)
	{
		if (global.levelMaster[iLoop, tObj.cx] == 1)
		{
			break;
		}
		else
		{
			newIndex = scr_NodesAtXY(tObj.cx, iLoop);
			if (newIndex != -1) nodeIndices[nodesFound++] = newIndex;
		}
	}
	
	// Cast D.
	
	for (iLoop = tObj.cy; iLoop <= 33; iLoop++)
	{
		if (global.levelMaster[iLoop, tObj.cx] == 1)
		{
			break;
		}
		else
		{
		newIndex = scr_NodesAtXY(tObj.cx, iLoop);
		if (newIndex != -1) nodeIndices[nodesFound++] = newIndex;
		}
	}

	// Cast L.
	
	for (iLoop = tObj.cx; iLoop >=1; iLoop--)
	{
		if (global.levelMaster[tObj.cy, iLoop] == 1)
		{
			break;
		}
		else
		{
			newIndex = scr_NodesAtXY(iLoop, tObj.cy);
			if (newIndex != -1) nodeIndices[nodesFound++] = newIndex;
		}
	}

	// Cast R.

	for (iLoop = tObj.cx; iLoop <=26 ; iLoop++)
	{
		if (global.levelMaster[tObj.cy, iLoop] == 1)
		{
			break;
		}
		else
		{
			newIndex = scr_NodesAtXY(iLoop, tObj.cy);
			if (newIndex != -1) nodeIndices[nodesFound++] = newIndex;
		}
	}
	
	// Return our node list.
	
	return nodeIndices;
}