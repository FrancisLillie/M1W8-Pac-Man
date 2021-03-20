//-----------------------------------------------------------------------------
// scr_ShotKillAll
//-----------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Kills all shots
//-----------------------------------------------------------------------------

function scr_ShotKillAll()
{
	// Declare locals.

	var iLoop;
	var tObj;

	// Kill all player shots.

	for (iLoop = 0; iLoop < MAX_SHOTS; iLoop++)
	{
		tObj = shotGrid[iLoop];
		if (tObj != 0)
		{
			instance_destroy(tObj);
		}
		shotGrid[iLoop] = instance_create_depth(-64, -64, -10000, obj_Shot);
	}

	// Kill all enemy shots.

	for (iLoop = 0; iLoop < MAX_NME_SHOTS; iLoop++)
	{
		tObj = nmeShotGrid[iLoop];
		if (tObj != 0)
		{
			instance_destroy(tObj);
		}
		nmeShotGrid[iLoop] = instance_create_depth(-64, -64, -10000, obj_Shot);
	}
}
