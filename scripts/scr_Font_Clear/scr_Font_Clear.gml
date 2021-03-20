function scr_Font_Clear() {
	//-----------------------------------------------------------------------------
	// scr_Font_Clear
	//-----------------------------------------------------------------------------
	// Inputs   -   None
	// Outputs  -   None
	// Notes    -   Clears the font lists
	//-----------------------------------------------------------------------------

	// Declare locals.

	var iLoop;

	// Free up the instances.

	for (iLoop = 0; iLoop < global.fontCount; iLoop++)
	{
	    with (global.fontArray[iLoop]) instance_destroy();
	}

	// Zero the counts.

	global.fontCount = 0;


}
