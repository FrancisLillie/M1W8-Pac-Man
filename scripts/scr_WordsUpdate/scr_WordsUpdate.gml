//-----------------------------------------------------------------------------
// scr_WordsUpdate
//-----------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Initialise the pills
//-----------------------------------------------------------------------------

function scr_WordsUpdate()
{
	// Declare locals.
	
	var iLoop;
	var lifeSpan;
	
	// Create the array of words.
	
	for (iLoop = 0; iLoop < MAX_WORDS; iLoop++)
	{
		// Get reference.
		
		tObj = global.wordArray[iLoop];
		
		// Only handle active ones.
		
		if (tObj.wordActive)
		{
			// Adjust the position.
			
			tObj.x += tObj.wordDX;
			tObj.y += tObj.wordDY;
			
			// Adjust the deltas.
			
			tObj.wordDX *= 1.02;
			tObj.wordDY *= 1.02;
			
			// Based on half room speed (30) adjust values.
			
			lifeSpan = room_speed / 1;
			tObj.wordAlpha -= (1 / lifeSpan);
			tObj.wordScale += (1 / lifeSpan) * 0.2;
			
			// Adjust the timer.
			
			tObj.wordTime++;
			
			// Are we at the end.
			
			if (tObj.wordAlpha <= 0)
			{
				tObj.wordAlpha = 0;
				tObj.wordActive = false;
			}
		}
	}
}