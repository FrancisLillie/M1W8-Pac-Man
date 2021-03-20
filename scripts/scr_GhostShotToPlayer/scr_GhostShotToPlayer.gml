//------------------------------------------------------------------------------
// scr_GhostShotToPlayer
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Checks for all ghost shots to player
//------------------------------------------------------------------------------

function scr_GhostShotToPlayer()
{
	// Declare locals.
	
	var shotLoop;
	var shotObj;
	var r1, r2;
	var dx, dy, dist;
	
	// Set up outer loop for shots.
	
	for (shotLoop = 0; shotLoop < MAX_NME_SHOTS; shotLoop++)
	{
		// Get shot object.
		
		shotObj = global.nmeShotGrid[shotLoop];
		
		// Only handle active shots.
		
		if (shotObj.Active && !global.playerObj.Exploding)
		{
			// Here we have an active shot and an active ghost.
			// Fireballs are 202x97 shown at scale 0.75 (152x73).
			// Player is 106x104 shown at scale 1.5 (159x156).
			// Assume fireball radius of 30.
			// Assume player radius of 60.
					
			r1 = 30;
			r2 = 60;
			dx = shotObj.x - global.playerObj.x;
			dy = shotObj.y - global.playerObj.y;
			dist = sqrt((dx * dx) + (dy * dy));
					
			if (dist <= (r1 + r2))
			{
				if (!global.cheatFlag)
				{
					scr_ExplosionAdd(global.playerObj.x, global.playerObj.y, irandom_range(0, 3), 1.25);
					shotObj.Active = false;
					global.playerObj.Exploding = true;
					scr_Sound_Play(snd_Die, 1, 1, false, true, true);
				}
			}
		}
	}
}