//------------------------------------------------------------------------------
// scr_InitLevel
//------------------------------------------------------------------------------
// Inputs   -   Level being initialised     (arg0)
//          -   Start flag                  (arg1)
// Outputs  -   None
// Notes    -   Initialises a level
//------------------------------------------------------------------------------

function scr_InitLevel(nLevel, nStart)
{
	// Declare locals.
	
	var pillsFound;

	// Make sure a paint is not possible.

	global.SettingUp = true;

	// Miscellaneous variable initialisation.

	global.Level = nLevel;

	global.gameState = GS_PREGAME;

	// Things to do if this is a true start.

	if (nStart)
	{
		global.playerScore = 0;
		global.Level = 1;
	}

	// Set up the player.

	if (global.playerObj != 0)
	{
		instance_destroy(global.playerObj);
	}
	global.playerObj = instance_create_depth(0, 0, 0, obj_Player);
	
	global.playerObj.cx = 14;
	global.playerObj.cy = 26;
	global.playerObj.x = (global.playerObj.cx * 32);
	global.playerObj.y = (global.playerObj.cy * 32) + 16;
	global.playerObj.dx = -1;
	global.playerObj.dy = 0;
	global.playerObj.animFrameIndex = 2;
	global.playerObj.moving = false;
	
	global.playerScore = 0;
	global.highScore = 0;
	
	// Set up anim tables.
	
	global.lFrames[0] = 4;
	global.lFrames[1] = 3;

	global.rFrames[0] = 0;
	global.rFrames[1] = 1;

	global.uFrames[0] = 5;
	global.uFrames[1] = 6;

	global.dFrames[0] = 7;
	global.dFrames[1] = 8;
	
	// Set up the level from the master data.
	
	pillsFound = 0;
	for (yLoop = 0; yLoop < 36; yLoop++)
	{
		for (xLoop = 0; xLoop < 28; xLoop++)
		{
			global.levelData[yLoop, xLoop] = global.levelMaster[yLoop, xLoop];
			if (global.levelData[yLoop, xLoop] == 2 || global.levelData[yLoop, xLoop] == 3)
			{
				global.pillArray[pillsFound] = instance_create_depth(-64, -64, -10000, obj_Pill);
				pillsFound++;
			}
		}
	}

	// Initialise the pills.
	
	scr_PillsInitialise();

	// Various setup.
	
	global.preGameSoundPlayed = false;
	global.preGameDelay = 0;
	
	// Make sure a paint is now possible.

	global.SettingUp = false;
}
