function scr_Zone_Clear()
{
	//-----------------------------------------------------------------------------
	// scr_Zone_Clear
	//-----------------------------------------------------------------------------
	// Inputs   -   None
	// Outputs  -   None
	// Notes    -   Clears the zone table
	//-----------------------------------------------------------------------------

	// Declare locals.

	var iLoop;

	// Free up the instances.

	for (iLoop = 0; iLoop < global.zoneCount; iLoop++)
	{
	    with (global.zoneArray[iLoop]) instance_destroy();
	}

	// Zero the count.

	global.zoneCount = 0;
}
