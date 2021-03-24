//------------------------------------------------------------------------------
// scr_NodesInitialise
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Initialise all the decision nodes
//------------------------------------------------------------------------------

function scr_NodesInitialise()
{
	// Declare locals.
	
	var xLoop, yLoop;
	var nodesFound;
	var tObj;
	var lu, ld, ll, lr;
	var node;
	
	// Outer y loop.
	
	nodesFound = 0;
	for (yLoop = 3; yLoop <= 33; yLoop++)
	{
		for (xLoop = 1; xLoop <= 26; xLoop++)
		{
			// Test for non-wall.
			
			if (global.levelMaster[yLoop, xLoop] != 1)
			{
				// Find out what directions we can move in.
				
				lu = false;
				ld = false;
				ll = false;
				lr = false;
				if (global.levelMaster[yLoop - 1, xLoop] != 1) lu = true;
				if (global.levelMaster[yLoop + 1, xLoop] != 1) ld = true;
				if (global.levelMaster[yLoop, xLoop - 1] != 1) ll = true;
				if (global.levelMaster[yLoop, xLoop + 1] != 1) lr = true;
				
				// Decide if this is a node.

				node = false;
				
				if (lr && (lu || ld)) node = true;
				if (ll && (lu || ld)) node = true;
				if (lu && (ll || lr)) node = true;
				if (ld && (ll || lr)) node = true;
				
				// Remove some home nodes.
				
				if (xLoop >= 11 && xLoop <= 12 && yLoop >= 16 && yLoop <= 18) node = false;
				if (xLoop >= 15 && xLoop <= 16 && yLoop >= 16 && yLoop <= 18) node = false;
				if (xLoop >= 13 && xLoop <= 14 && yLoop == 18) node = false;
				if (xLoop >= 13 && xLoop <= 14 && yLoop == 16) node = false;
				if (xLoop >= 13 && xLoop <= 14 && yLoop == 15) node = false;
				
				// Can we move in >=3 directions, if so this is a node.
				
				if (node)
				{
					// Add it and get a reference.
					
					global.nodeArray[nodesFound] = instance_create_depth(0, 0, 0, obj_Node);
					tObj = global.nodeArray[nodesFound];
					
					// Now set up some other data.
					
					tObj.cx = xLoop;
					tObj.cy = yLoop;
					tObj.ax = (tObj.cx * 32) + 16;
					tObj.ay = (tObj.cy * 32) + 16;
					tObj.u = lu;
					tObj.d = ld;
					tObj.l = ll;
					tObj.r = lr;
					
					// Increment the node count.
					
					nodesFound++;
				}
			}
		}
	}
}