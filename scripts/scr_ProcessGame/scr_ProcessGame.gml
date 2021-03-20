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

	scr_BackgroundUpdate();
	scr_PlayerUpdate();
	scr_ShotUpdatePlayer();
	scr_ShotUpdateEnemy();
	scr_EnemyGhostUpdate();
	scr_ExplosionUpdate();
	scr_OverlaysUpdate();
	scr_MonolithUpdate();

	//------------------------------------------------------------------------------
	// Game logic with no render.
	//------------------------------------------------------------------------------

	scr_ShakeProcess();

	//------------------------------------------------------------------------------
	// Game rendering with matching logic.
	//------------------------------------------------------------------------------

	scr_BackgroundRender();
	scr_PlayerRender();
	scr_ShotRenderPlayer();
	scr_ShotRenderEnemy();
	scr_EnemyGhostRender();
	scr_ExplosionRender();
	scr_OverlaysRender();
	scr_MonolithRender();
	
	//------------------------------------------------------------------------------
	// Collision detection.
	//------------------------------------------------------------------------------

	scr_PlayerShotToGhost();
	scr_GhostShotToPlayer();
	scr_PlayerToMonolith();

	//------------------------------------------------------------------------------
	// Check zone stuff.
	//------------------------------------------------------------------------------

	scr_Zone_CheckHit();
}
