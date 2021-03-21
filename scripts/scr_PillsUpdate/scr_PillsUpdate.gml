//-----------------------------------------------------------------------------
// scr_PillsInitialise
//-----------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Initialise the pills
//-----------------------------------------------------------------------------

function scr_PillsUpdate()
{
	// Declare locals.
	
	var iLoop, numEntries;
	var tObj;
	var numActive, numGood, numBad;
	var pcBad;
	var needABadOne;
	var dx, dy, dist;
	var changedState;
	var count;
	
	// Intitialisation.
	
	numEntries = array_length_1d(global.pillArray);
	needABadOne = false;
	
	//---------------------------------------------------------
	// Find out how many we have active, and how mnay good/bad.
	//---------------------------------------------------------

	numActive = 0;
	numGood = 0;
	numBad = 0;
	for (iLoop = 0; iLoop < numEntries; iLoop++)
	{
		// Get object reference.
		
		tObj = global.pillArray[iLoop];
		
		// Only process if active.
		
		if (tObj.pillActive)
		{
			if (tObj.pillType != PILL_SEROTONIN)
			{
				numActive++;
				if (tObj.pillType == PILL_GOOD) numGood++;
				if (tObj.pillType == PILL_BAD) numBad++;
			}
		}
	}
	
	// Get a percentage of bad.
	
	pcBad = (100 / numActive) * numBad;
	if (pcBad < 10) needABadOne = true;
	
	
	//-------------------------------
	// Now actually process them all.
	//-------------------------------
	
	for (iLoop = 0; iLoop < numEntries; iLoop++)
	{
		// Get object reference.
		
		tObj = global.pillArray[iLoop];
		
		// Only process if active.
		
		if (tObj.pillActive)
		{
			// Adjust frames if needed.
			
			if (tObj.pillFrame < tObj.pillTargetFrame)
			{
				tObj.pillFrame += 0.25;
				if (tObj.pillFrame > tObj.pillTargetFrame)
				{
					tObj.pillFrame = tObj.pillTargetFrame;
				}
			}
			if (tObj.pillFrame > tObj.pillTargetFrame)
			{
				tObj.pillFrame -= 0.25;
				if (tObj.pillFrame < tObj.pillTargetFrame)
				{
					tObj.pillFrame = tObj.pillTargetFrame;
				}
			}
			
			// How close is the player to the object?
			
			dx = global.playerObj.x - tObj.x;
			dy = global.playerObj.y - tObj.y;
			dist = sqrt((dx * dx) + (dy * dy));
			
			if (dist < 24)
			{
				tObj.pillActive = false;
				scr_Sound_Play(snd_WakaWaka, 1, 1, false, true, false);
				global.playerScore += tObj.pillScore;
				if (global.playerScore < 0) global.playerScore = 0;
				numActive--;
			}
		}
	}
	
	//-------------------------
	// Add a bad one if needed.
	//-------------------------
	
	newBadIndex = random_range(0, numEntries - 1);
	changedState = false;
	count = 0;
	while (!changedState)
	{
		tObj = global.pillArray[newBadIndex];
		if (tObj.pillActive && tObj.pillType == PILL_GOOD)
		{
			tObj.pillType = PILL_BAD;
			tObj.pillScore = -10;
			tObj.pillFrame = 0;
			tObj.pillTargetFrame = 17;
		}
	}
	
}