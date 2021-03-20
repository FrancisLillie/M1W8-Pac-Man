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

	// Make sure a paint is not possible.

	global.SettingUp = true;

	// Miscellaneous variable initialisation.

	global.Level = nLevel;

	global.gameState = GS_PREGAME;

	// Things to do if this is a true start.

	if (nStart)
	{
		global.Score = 0;
		global.Level = 1;
	}

	// Set up scroll psoitions.
	
	global.scrollX = array_create(6);
	global.scrollY = array_create(6);

	for (iLoop = 0; iLoop < 6; iLoop++)
	{
		global.scrollX[iLoop] = 0
		global.scrollY[iLoop] = 170;
	}

	// Set up the player.

	if (global.playerObj != 0)
	{
		instance_destroy(global.playerObj);
	}
	global.playerObj = instance_create_depth(0, 0, 0, obj_Player);
	
	global.playerObj.x = 64;
	global.playerObj.y = 170 + (room_height / 2);
	global.playerObj.dx = 0;
	global.playerObj.dy = 0;
	global.playerObj.Frame = 0;
	global.playerObj.FrameDealy = 0;
	global.playerObj.FireDelay = 0
	global.playerObj.FireDelayMaster = 15;
	global.playerObj.Exploding = false;
	global.playerObj.Energy = 1000;
	global.playerObj.Dead = false;

	global.FireDelay = 10;
	
	global.ghostDelay = irandom_range(MIN_GHOST_DELAY, MAX_GHOST_DELAY);
	
	global.bossActive = false;
	global.bossDestroyed = false;
	global.bossEnergy BOSS_ENERGY;
	
	global.shakeDuration = 0;
	global.shakeMagnitude = 0;
	global.shakeX = 0;
	global.shakeY = 0;
	
	// Set up the monolith.
	
	if (global.monolithObj != 0)
	{
		instance_destroy(global.monolithObj);
	}
	global.monolithObj = instance_create_depth(0, 0, 0, obj_Monolith);
	
	global.monolithObj.sinOffset = 0;
	global.monolithObj.yAdjust = 0;
	global.monolithObj.x = SCROLL_W - 100;
	global.monolithObj.y = 170 + (room_height / 2);
	global.monolithObj.lightningWait = irandom_range(room_speed * 1, room_speed * 5);
	global.monolithObj.lightningActive = false;
	global.monolithObj.frameNum = 0;
	global.monolithObj.hasBeenHit = false;

	// Kill all objects.
	
	scr_ShotKillAll();
	scr_EnemyGhostKillAll();
	scr_ExplosionKillAll();
	
	// Set up cheating.
	
	cheatFlag = false;
	
	// Play music.
	
	scr_Sound_Play(snd_BGM, 1, 0.25, true, true, true);

	// Make sure a paint is now possible.

	global.SettingUp = false;
}
