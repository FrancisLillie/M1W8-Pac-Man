//------------------------------------------------------------------------------
// scr_EnemyGhostRender
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Updates all ghost enemies
//------------------------------------------------------------------------------

function scr_EnemyGhostUpdate()
{
	// Declare locals.
	
	var found;
	var iLoop, tObj, maxTime, oldestIndex;
	var screenX, dy;
	
	// Initialisation.
	
	screenX = global.scrollX[5] + room_width;
	
	//--------------------------------------
	// Handle the addition of another ghost.
	//--------------------------------------

	// Do we need to add another ghost.
	
	if (--global.ghostDelay == 0)
	{
		// Set up new timer.
		
		global.ghostDelay = irandom_range(MIN_GHOST_DELAY, MAX_GHOST_DELAY);
		
		// Now find free slot.
		
		found = false;
		maxTime = 0;
		oldestIndex = 0;
		for (iLoop = 0; iLoop < MAX_GHOSTS; iLoop++)
		{
			tObj = global.ghostGrid[iLoop];
			if (tObj.Active == false)
			{
				tObj.x = screenX + irandom_range(50, 100);
				tObj.y = 170 + irandom_range(64, room_height - 128);
				tObj.Active = true;
				tObj.fadingOut = false;
				tObj.fadingIn = false;
				tObj.transTimer = irandom_range(15, 45);
				tObj.hitPoints = GHOST_ENERGY;
				tObj.beenHit = false;
				tObj.hitTimer = 0;
				tObj.Alpha = 1;
				tObj.FrameDelay = 0;
				tObj.Frame = 0;
				tObj.Timer = 0;
				tObj.attacking = false;
				found = true;
				break;
			}
			else
			{
				if (tObj.Timer > maxTime)
				{
					maxTime = tObj.Timer;
					oldestIndex = iLoop;
				}
			}
		}
		
		// If no free slot then use oldest slot.
		
		if (!found)
		{
			tObj = global.ghostGrid[oldestIndex]
			tObj.x = screenX + irandom_range(50, 100);
			tObj.y = 170 + irandom_range(64, room_height - 128);
			tObj.Active = true;
			tObj.fadingOut = false;
			tObj.fadingIn = false;
			tObj.transTimer = irandom_range(15, 45);
			tObj.hitPoints = GHOST_ENERGY;
			tObj.beenHit = false;
			tObj.hitTimer = 0;
			tObj.Alpha = 1;
			tObj.FrameDelay = 0;
			tObj.Frame = 0;
			tObj.Timer = 0;
			tObj.attacking = false;
		}
	}

	//-------------------------------
	// Now process all active ghosts.
	//-------------------------------
	
	for (iLoop = 0; iLoop < MAX_GHOSTS; iLoop++)
	{
		tObj = global.ghostGrid[iLoop];
		if (tObj.Active)
		{
			// Update timer.
			
			tObj.Timer += 1;
			
			// Update hit stuff.
			
			if (tObj.beenHit)
			{
				if (--tObj.hitTimer <= 0)
				{
					tObj.hitTimer = 0;
					tObj.beenHit = false;
				}
			}
			
			// Handle transitions.
			
			if (tObj.hitPoints <= 0)
			{
				tObj.Alpha -= 0.067;
				if (tObj.Alpha <= 0)
				{
					tObj.Alpha = 0;
					tObj.Active = false;
				}
			}
			else if (tObj.fadingOut)
			{
				tObj.Alpha -= 0.067;
				if (tObj.Alpha <= 0)
				{
					tObj.Alpha = 0;
					tObj.fadingOut = false;
					tObj.fadingIn = false;
					tObj.stayOut = true;
					tObj.stayOutTimer = room_speed;
				}
			}
			else if (tObj.stayOut)
			{
				if (--tObj.stayOutTimer == 0)
				{
					tObj.Alpha = 0;
					tObj.fadingOut = false;
					tObj.fadingIn = true;
					tObj.stayOut = false;
					tObj.stayOutTimer = 0;
				}
			}
			else if (tObj.fadingIn)
			{
				tObj.Alpha += 0.067;
				if (tObj.Alpha >= 1)
				{
					tObj.Alpha = 1;
					tObj.fadingOut = false;
					tObj.fadingIn = false;
					tObj.stayOut = false;
				}
			}
			else if (tObj.attacking)
			{
			}
			else if (--tObj.transTimer == 0)
			{
				tObj.transTimer = irandom_range(30, 120);
				tObj.fadingOut = true;
				tObj.fadingIn = false;
				tObj.Alpha = 1;
			}
			
			// Now handle animation.
			
			if (++tObj.FrameDelay == 4)
			{
				tObj.FrameDelay = 0;
				if (tObj.attacking)
				{
					if (++tObj.Frame >= 9)
					{
						tObj.Frame = 0;
						tObj.attacking = false;
						scr_ShotAddEnemy(tObj.x, tObj.y, irandom_range(0, 3));
					}
				}
				else
				{
					if (++tObj.Frame >= 19)
					{
						tObj.Frame = 0;
						dy = abs(global.playerObj.y - tObj.y);
						if (dy < 128 && global.playerObj.x < tObj.x)
						{
							tObj.attacking = true;
						}
					}
				}
			}
			
			// Now handle movement.
			
			if (tObj.attacking)
			{
				tObj.x += 0;
			}
			else
			{
				tObj.x -= 5;
			}
			
			// Now see if we need to die of screen.
			
			if (tObj.x <= (global.scrollX[5] - 64))
			{
				tObj.Active = false;
			}
		}
	}
}