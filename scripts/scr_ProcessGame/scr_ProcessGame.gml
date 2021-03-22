//------------------------------------------------------------------------------
// scr_ProcessGame
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Process the game
//------------------------------------------------------------------------------

function scr_ProcessGame()
{
	//------------------------------------------------------------------------------
	// Game engine updates.
	//------------------------------------------------------------------------------

	// Clear sprite lists.

	scr_Sprite_Clear();
	scr_Zone_Clear();

	// Process a fade.

	scr_Fade_Process();

	// Get aspect ratio.

	scr_Screen_GetAspect();

	// Audio channel manager.
	
	scr_Sound_ChannelManager();
	
	//------------------------------------------------------------------------------
	// Game logic with matching renders.
	//------------------------------------------------------------------------------

	scr_PreGameUpdate();
	scr_PlayerUpdate();
	scr_OverlaysUpdate();
	scr_PillsUpdate();
	scr_WordsUpdate();

	//------------------------------------------------------------------------------
	// Game logic with no render.
	//------------------------------------------------------------------------------

	//------------------------------------------------------------------------------
	// Game rendering with matching logic.
	//------------------------------------------------------------------------------

	scr_PreGameRender();
	scr_PlayerRender();
	scr_OverlaysRender();
	scr_PillsRender();
	scr_WordsRender();
	
	//------------------------------------------------------------------------------
	// Collision detection.
	//------------------------------------------------------------------------------

	//------------------------------------------------------------------------------
	// Check zone stuff.
	//------------------------------------------------------------------------------

	scr_Zone_CheckHit();
}
