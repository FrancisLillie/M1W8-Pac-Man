function scr_Zone_Draw()
{
	//-----------------------------------------------------------------------------
	// scr_Zone_Draw
	//-----------------------------------------------------------------------------
	// Inputs   -   None
	// Outputs  -   None
	// Notes    -   Draws all zones
	//-----------------------------------------------------------------------------

	// Declare locals.

	var iLoop;

	// Draw if in debug mode.

	if (DEBUG_MODE == 1)
	{
	    for (iLoop = 0; iLoop < global.zoneCount; iLoop++)
	    {
	        draw_set_color(c_black);
	        draw_rectangle(global.zoneArray[iLoop].zoneX, global.zoneArray[iLoop].zoneY, global.zoneArray[iLoop].zoneX + global.zoneArray[iLoop].zoneW, global.zoneArray[iLoop].zoneY + global.zoneArray[iLoop].zoneH, true);
	    }
	}
}
