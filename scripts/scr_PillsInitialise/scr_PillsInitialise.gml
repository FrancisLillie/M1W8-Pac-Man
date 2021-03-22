//-----------------------------------------------------------------------------
// scr_PillsInitialise
//-----------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Initialise the pills
//-----------------------------------------------------------------------------

function scr_PillsInitialise()
{
	// Declare locals.
	
	var xLoop, yLoop;
	var pillCount;
	
	// Set sound delay to 0.
	
	global.pillWakaDelay = 0;
		
	// Now remove dots and pills.

	pillCount = 0;
	for (yLoop = 0; yLoop < 36; yLoop++)
	{
		for (xLoop = 0; xLoop < 28; xLoop++)
		{
			if (global.levelData[yLoop, xLoop] == 2 || global.levelData[yLoop, xLoop] == 3)
			{
				// Create a new entry.
				
				tObj = global.pillArray[pillCount];
				if (tObj != 0)
				{
					instance_destroy(tObj);
				}
				global.pillArray[pillCount] = instance_create_depth(-64, -64, -10000, obj_Pill);
				
				// What type is it?
				
				tObj = global.pillArray[pillCount];
				tObj.x = (xLoop * 32) + 16;
				tObj.y = (yLoop * 32) + 16;
				if (global.levelData[yLoop, xLoop] == 2)
				{
					tObj.pillType = PILL_GOOD;
					tObj.pillScore = 10;
					tObj.pillFrame = 0;
					tObj.pillTargetFrame = 0;
					tObj.pillActive = true;
				}
				else
				{
					tObj.pillType = PILL_SEROTONIN;
					tObj.pillScore = 50;
					tObj.pillFrame = 0;
					tObj.pillTargetFrame = 0;
					tObj.pillActive = true;
				}
				
				// Clear from the map.
				
				global.levelData[yLoop, xLoop] = 0;
				
				// Change pill count.
				
				pillCount++;
			}
		}
	}
}