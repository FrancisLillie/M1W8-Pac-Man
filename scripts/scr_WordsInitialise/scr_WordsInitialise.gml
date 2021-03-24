//-----------------------------------------------------------------------------
// scr_WordsInitialise
//-----------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Initialise the pills
//-----------------------------------------------------------------------------

function scr_WordsInitialise()
{
	// Declare locals.
	
	var iLoop;
	
	// Create the array of words.
	
	for (iLoop = 0; iLoop < MAX_WORDS; iLoop++)
	{
		// Destroy and re-create.
		
		tObj = global.wordArray[iLoop];
		if (tObj != 0)
		{
			instance_destroy(tObj);
		}
		global.wordArray[iLoop] = instance_create_depth(-64, -64, -10000, obj_Words);

		// Set up the object.
		
		tObj = global.wordArray[iLoop];
		tObj.wordRot = 0;
		tObj.wordScale = 1;
		tObj.wordAlpha = 1;
		tObj.wordTime = 0;
		tObj.wordActive = false;
		tObj.wordString = "";
		tObj.wordDX = 0;
		tObj.wordDY = 0;
		tObj.wordGood = true;
	}
}