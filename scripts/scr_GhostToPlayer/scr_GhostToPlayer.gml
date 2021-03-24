//------------------------------------------------------------------------------
// scr_GhostActScatter
//------------------------------------------------------------------------------
// Inputs	-	Ghost object
// Outputs	-	None
// Notes	-	Moves a ghost in scatter pattern
//------------------------------------------------------------------------------

function scr_GhostToPlayer()
{
	// Declare locals.
	
	var iLoop;
	var gObj, pObj;
	var dx, dy, dist;
	
	// Initialisation.
	
	pObj = global.playerObj
	
	// If we are dying then no collisions.
	
	if (pObj.pacDying)
	{
		return;
	}
	
	// Loop round all ghosts.
	
	for (iLoop = 0; iLoop < 4; iLoop++)
	{
		// Get ghost reference object.
		
		gObj = global.ghostArray[iLoop];
		
		// Find distance.
		
		dx = gObj.x - pObj.x;
		dy = gObj.y - pObj.y;
		dist = sqrt((dx * dx) + (dy * dy));
		
		// Have we collided.
		
		if (dist <= COLL_RADIUS)
		{
			// Decide what happens next.
			
			if (gObj.gMode == MODE_FRIGHTENED)
			{
				gObj.gMode = MODE_DEAD;
				gObj.tcx = 14;
				gObj.tcy = 17;
				scr_Sound_Play(snd_KillGhost, 1, 1, false, true, false);
			}
			else if (gObj.gMode == MODE_DEAD)
			{
			}
			else
			{
				pObj.pacDying = true;
				pObj.frame = 0;
				scr_Sound_Play(snd_Die, 1, 1, false, true, true);
			}
		}
	}
}