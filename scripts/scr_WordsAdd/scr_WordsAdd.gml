//-----------------------------------------------------------------------------
// scr_WordsAdd
//-----------------------------------------------------------------------------
// Inputs   -   Start X
//			-	Start Y
//			-	True for good, false otherwise
// Outputs  -   None
// Notes    -   Adds a word
//-----------------------------------------------------------------------------

function scr_WordsAdd(nx, ny, nType)
{
	// Declare locals.
	
	var iLoop;
	var oldestTime, oldestIndex;
	var wordIndex;
	
	// Create the array of words.
	
	oldestTime = 0;
	oldestIndex = -1;
	for (iLoop = 0; iLoop < MAX_WORDS; iLoop++)
	{
		// Get reference.
		
		tObj = global.wordArray[iLoop];
		
		// Find inactive entries.
		
		if (!tObj.wordActive)
		{
			wordIndex = irandom_range(0, 19)
			if (nType) tObj.wordString = global.goodWords[wordIndex];
			else tObj.wordString = global.badWords[wordIndex];
			if (global.playerObj.dx == 1)
			{
				tObj.wordDX = 0;
				tObj.wordDY = +(DEFAULT_SPEED * 1);
			}
			else if (global.playerObj.dy == -1)
			{
				tObj.wordDX = 0;
				tObj.wordDY = +(DEFAULT_SPEED * 1);
			}
			else if (global.playerObj.dx == -1)
			{
				tObj.wordDX = 0;
				tObj.wordDY = -(DEFAULT_SPEED * 1);
			}
			else
			{
				tObj.wordDX = 0;
				tObj.wordDY = -(DEFAULT_SPEED * 1);
			}
			tObj.wordRot = 0;
			tObj.wordScale = 1;
			tObj.wordAlpha = 1;
			tObj.wordTime = 0;
			tObj.wordGood = nType;
			tObj.x = nx;
			tObj.y = ny;
			tObj.wordActive = true;
			return;
		}
		else
		{
			if (tObj.wordTime > oldestTime)
			{
				oldestTime = tObj.wordTime;
				oldestIndex = iLoop;
			}
		}
	}
	
	// Have we got an oldest here?
	
	if (oldestIndex != -1)
	{
		tObj = global.wordArray[oldestIndex];
		wordIndex = irandom_range(0, 19)
		if (nType) tObj.wordString = global.goodWords[wordIndex];
		else tObj.wordString = global.badWords[wordIndex];
		if (global.playerObj.dx == 1)
		{
			tObj.wordDX = 0;
			tObj.wordDY = +(DEFAULT_SPEED * 1);
		}
		else if (global.playerObj.dy == -1)
		{
			tObj.wordDX = 0;
			tObj.wordDY = +(DEFAULT_SPEED * 1);
		}
		else if (global.playerObj.dx == -1)
		{
			tObj.wordDX = 0;
			tObj.wordDY = -(DEFAULT_SPEED * 1);
		}
		else
		{
			tObj.wordDX = 0;
			tObj.wordDY = -(DEFAULT_SPEED * 1);
		}
		tObj.wordRot = 0;
		tObj.wordScale = 1;
		tObj.wordAlpha = 1;
		tObj.wordTime = 0;
		tObj.wordGood = nType;
		tObj.x = nx;
		tObj.y = ny;
		tObj.wordActive = true;
	}
}