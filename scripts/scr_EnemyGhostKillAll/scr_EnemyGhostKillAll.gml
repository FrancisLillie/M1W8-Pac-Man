//------------------------------------------------------------------------------
// scr_EnemyGhostRender
//------------------------------------------------------------------------------
// Inputs	-	None
// Outputs	-	None
// Notes	-	Kill all ghost enemies
//------------------------------------------------------------------------------

function scr_EnemyGhostKillAll()
{
	// Declare locals.

	var iLoop;
	var tObj;

	// Kill all ghosts.

	for (iLoop = 0; iLoop < MAX_GHOSTS; iLoop++)
	{
		tObj = ghostGrid[iLoop];
		if (tObj != 0)
		{
			instance_destroy(tObj);
		}
		ghostGrid[iLoop] = instance_create_depth(-64, -64, -10000, obj_EnemyGhost);
	}
}