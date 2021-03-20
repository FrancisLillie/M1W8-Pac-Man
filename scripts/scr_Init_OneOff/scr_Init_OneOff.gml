function scr_Init_OneOff()
{
	//-----------------------------------------------------------------------------
	// scr_Init_OneOff
	//-----------------------------------------------------------------------------
	// Inputs   -   None
	// Outputs  -   None
	// Notes    -   One off initialisation
	//-----------------------------------------------------------------------------

	// Declare locals.

	var iLoop;

	// Randomise.
	
	randomize();
	
	// One off initialisation.

	scr_Texts();
	global.gTicks = 0;
	global.gameExitNeeded = false;

	// Sprite initialisation.

	global.sprCount = 0;
	global.sprCount0 = 0;
	global.sprCount1 = 0;
	global.sprCount2 = 0;
	global.sprCount3 = 0;
	global.sprCount4 = 0;
	scr_Sprite_Clear();

	// Font initialisation.

	global.fontCount = 0
	scr_Font_Clear();

	// Zone initialisation.

	global.zoneCount = 0;
	scr_Zone_Clear();

	// Audio channel initialisation.

	scr_Sound_Init();
	global.masterVolume = 1;

	// Game initialisation.

	global.nextGameState = GS_LOGOS;
	global.gameState = GS_LOGOS;

	// Create the player.
	
	global.playerObj = instance_create_depth(0, 0, 0, obj_Player);
	
	// Create the monolith.

	global.monolithObj = instance_create_depth(0, 0, 0, obj_Monolith);

// Create the shot array.
	
	for (iLoop = 0; iLoop < MAX_SHOTS; iLoop++)
	{
		global.shotGrid[iLoop] = instance_create(-64, -64, obj_Shot);
	}
	
	// Create the enemy shot array.
	
	for (iLoop = 0; iLoop < MAX_NME_SHOTS; iLoop++)
	{
		global.nmeShotGrid[iLoop] = instance_create(-64, -64, obj_Shot);
	}

	// Create the ghost array.
	
	for (iLoop = 0; iLoop < MAX_GHOSTS; iLoop++)
	{
		global.ghostGrid[iLoop] = instance_create(-64, -64, obj_EnemyGhost);
	}

	// Create the explosion array.
	
	for (iLoop = 0; iLoop < MAX_EXPLOS; iLoop++)
	{
		global.exploGrid[iLoop] = instance_create(-64, -64, obj_Explosion);
	}

	// Create the default INI if it doesn't exist.

	scr_INI_CreateDefault("m1w5seu.ini");
	scr_HighScore_ReadWrite("read");
}
