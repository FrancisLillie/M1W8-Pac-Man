function scr_Sprite_Clear() {
	//-----------------------------------------------------------------------------
	// scr_Sprite_Clear
	//-----------------------------------------------------------------------------
	// Inputs   -   None
	// Outputs  -   None
	// Notes    -   Clears the sprite lists
	//-----------------------------------------------------------------------------

	// Declare locals.

	var iLoop;

	// Free up the instances.

	for (iLoop = 0; iLoop < global.sprCount0; iLoop++)
	{
	    with (global.sprBackground[iLoop]) instance_destroy();
	}

	for (iLoop = 0; iLoop < global.sprCount1; iLoop++)
	{
	    with (global.sprNormal[iLoop]) instance_destroy();
	}

	for (iLoop = 0; iLoop < global.sprCount2; iLoop++)
	{
	    with (global.sprSorted[iLoop]) instance_destroy();
	}

	for (iLoop = 0; iLoop < global.sprCount3; iLoop++)
	{
	    with (global.sprTextSprite[iLoop]) instance_destroy();
	}

	for (iLoop = 0; iLoop < global.sprCount4; iLoop++)
	{
	    with (global.sprText[iLoop]) instance_destroy();
	}

	// Zero the counts.

	global.sprCount = 0;
	global.sprCount0 = 0;
	global.sprCount1 = 0;
	global.sprCount2 = 0;
	global.sprCount3 = 0;
	global.sprCount4 = 0;

	// Get the aspect ratios.

	scr_Screen_GetAspect();


}
