//------------------------------------------------------------------------------
// scr_ShotAddPlayer
//------------------------------------------------------------------------------
// Inputs	-	X position
//			-	Y position
//			-	Type
// Outputs	-	None
// Notes	-	Adds a player shot
//------------------------------------------------------------------------------

function scr_ShotAddPlayer(nx, ny, nType)
{
	// Declare locals.
	
	var iLoop;
	var oldest, oldestIndex;
	
	// Initialisation.
	
	oldest = -1;
	
	// Find a free slot.
	
	for (iLoop = 0; iLoop < MAX_SHOTS; iLoop++)
	{
		if (!global.shotGrid[iLoop].Active)
		{
			global.shotGrid[iLoop].x = nx;
			global.shotGrid[iLoop].y = ny;
			global.shotGrid[iLoop].Age = 0;
			global.shotGrid[iLoop].Active = true;
			global.shotGrid[iLoop].dx = 24;
			global.shotGrid[iLoop].dy = 0;
			global.shotGrid[iLoop].Damage = 25;
			global.shotGrid[iLoop].Type = nType;
			scr_Sound_Play(snd_Whoosh, 1, 1, false, true, true);
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

	global.shotGrid[oldestIndex].x = nx;
	global.shotGrid[oldestIndex].y = ny;
	global.shotGrid[oldestIndex].Age = 0;
	global.shotGrid[oldestIndex].Active = true;
	global.shotGrid[oldestIndex].dx = 24;
	global.shotGrid[oldestIndex].dy = 0;
	global.shotGrid[oldestIndex].Damage = 25;
	global.shotGrid[oldestIndex].Type = nType;
	scr_Sound_Play(snd_Whoosh, 1, 1, false, true, true);
}