//------------------------------------------------------------------------------
// scr_PostGameUpdate
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Updates the post-game sequence
//------------------------------------------------------------------------------

function scr_PostGameUpdate()
{
	// Check for space.
	
	if (keyboard_check_released(vk_space))
	{
		scr_Sound_Play(snd_Select, 0, 1, false, true, false);
		if (global.Success == false)
		{
		    global.ExitGame = true;
			scr_Fade_InitDown(0.5);
			global.nextGameState = GS_MENUS;
		}
		else
		{
			scr_Fade_InitDown(0.5);
			global.nextGameState = GS_PREGAME;
		}
	}
}
