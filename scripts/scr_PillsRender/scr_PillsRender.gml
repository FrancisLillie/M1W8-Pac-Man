//-----------------------------------------------------------------------------
// scr_PillsInitialise
//-----------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Initialise the pills
//-----------------------------------------------------------------------------

function scr_PillsRender()
{
	// Declare locals.
	
	var numEntries, iLoop;
	
	// Intitialisation.
	
	numEntries = array_length_1d(global.pillArray);
	
	// Loop through all entries.

	for (iLoop = 0; iLoop < numEntries; iLoop++)
	{
		// Get object reference.
		
		tObj = global.pillArray[iLoop];
		
		// Only process if active.
		
		if (tObj.pillActive)
		{
			if (tObj.pillType != PILL_SEROTONIN)
			{
				scr_Sprite_AddSorted(tObj.x, tObj.y, 50, 0, 0, 1, 1, 0, 1, tObj.pillFrame, spr_Pills1, c_white, true, false, false);
			}
			else
			{
				if ((global.gTicks & 16) == 0)
				{
					scr_Sprite_AddSorted(tObj.x, tObj.y, 50, 0, 0, 1, 1, 0, 1, 0, spr_PowerPill, c_white, true, false, false);
				}
			}
		}
	}
}