//------------------------------------------------------------------------------
// scr_PreGameUpdate
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Update the pre-game sequence
//------------------------------------------------------------------------------

function scr_PreGameUpdate()
{
	// Wait for fade to finish.
	
	if (!global.fadeActive && global.gameState == GS_PREGAME && !global.preGameSoundPlayed)
	{
		global.preGameSoundPlayed = true;
		scr_Sound_Play(snd_PreGame, 1, 1, false, true, true);
	}
	else if (!global.fadeActive && global.gameState == GS_PREGAME && global.preGameSoundPlayed)
	{
		++global.preGameDelay;
		if (global.preGameDelay >= (room_speed * 2.1) && global.preGamePhase == 0)
		{
			global.preGamePhase = 1;
		}
		else if (global.preGameDelay >= (room_speed * 4.2) && global.preGamePhase == 1)
		{
			global.gameState = GS_GAME;
			global.preGameDelay = 0;
			global.playerObj.animFrameIndex = 0;
			global.playerObj.dx = -1;
			global.playerObj.dy = 0;
		}
	}
}		
