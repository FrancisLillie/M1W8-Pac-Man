//-----------------------------------------------------------------------------
// scr_WordsRender
//-----------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Render  words
//-----------------------------------------------------------------------------

function scr_WordsRender()
{
	// Declare locals.
	
	var iLoop;
	var tObj, s, col;
	
	// Create the array of words.
	
	for (iLoop = 0; iLoop < MAX_WORDS; iLoop++)
	{
		// Get reference.
		
		tObj = global.wordArray[iLoop];
		
		// Only process active entries.
		
		if (tObj.wordActive)
		{
			s = tObj.wordScale;
			if (tObj.wordGood) col = c_white;
			else col = c_red;
			scr_Font_Print_Sprite(tObj.wordString, tObj.x, tObj.y, s, s, s, s, col, tObj.wordAlpha, 0, fa_center, fa_middle);
		}
	}
}