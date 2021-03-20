//------------------------------------------------------------------------------
// scr_ShotAddEnemy
//------------------------------------------------------------------------------
// Inputs	-	X position
//			-	Y position
//			-	Shot type
// Outputs	-	None
// Notes	-	Adds an enemy shot
//------------------------------------------------------------------------------

function scr_ShotAddEnemy(nx, ny, nType)
{
	// Declare locals.
	
	var iLoop;
	var oldest, oldestIndex;
	
	// Initialisation.
	
	oldest = -1;
	
	// Find a free slot.
	
	for (iLoop = 0; iLoop < MAX_NME_SHOTS; iLoop++)
	{
		if (!global.nmeShotGrid[iLoop].Active)
		{
			global.nmeShotGrid[iLoop].x = nx;
			global.nmeShotGrid[iLoop].y = ny;
			global.nmeShotGrid[iLoop].Age = 0;
			global.nmeShotGrid[iLoop].Active = true;
			global.nmeShotGrid[iLoop].dx = -12;
			global.nmeShotGrid[iLoop].dy = 0;
			global.nmeShotGrid[iLoop].Damage = 25;
			global.nmeShotGrid[iLoop].Type = nType;
			scr_Sound_Play(snd_Fireball, 1, 1, false, true, false);
			return 0;
		}
		else
		{
			if (global.nmeShotGrid[iLoop].Age > oldest)
			{
				oldestIndex = iLoop;
				oldest = global.nmeShotGrid[iLoop].Age;
			}
		}
	}
	
	// If we get here we do not have a free slot.

	global.nmeShotGrid[oldestIndex].x = nx;
	global.nmeShotGrid[oldestIndex].y = ny;
	global.nmeShotGrid[oldestIndex].Age = 0;
	global.nmeShotGrid[oldestIndex].Active = true;
	global.nmeShotGrid[oldestIndex].dx = -12;
	global.nmeShotGrid[oldestIndex].dy = 0;
	global.nmeShotGrid[oldestIndex].Damage = 25;
	global.nmeShotGrid[oldestIndex].Type = nType;
	scr_Sound_Play(snd_Fireball, 1, 1, false, true, false);
}