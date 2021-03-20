//------------------------------------------------------------------------------
// scr_PlayerShotToGhost
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Checks for all player shots to ghosts
//------------------------------------------------------------------------------

function scr_PlayerShotToGhost()
{
	// Declare locals.
	
	var shotLoop, ghostLoop;
	var shotObj, ghostObj;
	var r1, r2;
	var dx, dy, dist;
	
	// Set up outer loop for shots.
	
	for (shotLoop = 0; shotLoop < MAX_SHOTS; shotLoop++)
	{
		// Get shot object.
		
		shotObj = global.shotGrid[shotLoop];
		
		// Only handle active shots.
		
		if (shotObj.Active)
		{
			// Set up inner loop for ghosts.
			
			for (ghostLoop = 0; ghostLoop < MAX_GHOSTS; ghostLoop++)
			{
				// Get ghost object.
				
				ghostObj = global.ghostGrid[ghostLoop];
				
				// Only handle active ghosts.
				
				if (ghostObj.Active && ghostObj.Alpha = 1 && !ghostObj.beenHit && ghostObj.hitPoints >= 0)
				{
					// Here we have an active shot and an active ghost.
					// Scythes are 81x81 shown at scale 0.4 (32x32).
					// Ghosts are 758x901 show at scale 0.25 (190x225).
					// Assume scythe radius of 16.
					// Assume ghost radius of 45.
					
					r1 = 16;
					r2 = 45;
					dx = shotObj.x - ghostObj.x;
					dy = shotObj.y - ghostObj.y;
					dist = sqrt((dx * dx) + (dy * dy));
					
					if (dist <= (r1 + r2))
					{
						shotObj.Active = 0;

						ghostObj.beenHit = true;
						ghostObj.hitTimer = 15;
						ghostObj.hitPoints -= 50;
						if (ghostObj.hitPoints <= 0)
						{
							ghostObj.hitPoints = 0;
							scr_ExplosionAdd(ghostObj.x, ghostObj.y, irandom_range(0, 3), 1);
							global.Score += 250;
						}
					}
					
					//with (shotObj)
					//{
					//    if (place_meeting(x, y, ghostObj))
					//	{
					//		with (ghostObj)
					//		{
					//			beenHit = true;
					//			hitPoints -= 50;
					//			if (hitPoints <= 0)
					//			{
					//				hitPoints = 0;
					//			}
					//		}
					//	}
					//}
				}
			}
		}
	}
}