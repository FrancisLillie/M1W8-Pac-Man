//-----------------------------------------------------------------------------
// scr_ScoresKillAll
//-----------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Kills all shots
//-----------------------------------------------------------------------------

function scr_ExplosionKillAll()
{

	// Declare locals.

	var iLoop;
	var tObj;

	// Kill all player shots.

	for (iLoop = 0; iLoop < MAX_EXPLOS; iLoop++)
	{
		tObj = exploGrid[iLoop];
		if (tObj != 0)
		{
			instance_destroy(tObj);
		}
		exploGrid[iLoop] = instance_create_depth(-64, -64, -10000, obj_Explosion);
	}
}