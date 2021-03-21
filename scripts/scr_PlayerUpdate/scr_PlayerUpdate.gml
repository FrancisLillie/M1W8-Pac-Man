//------------------------------------------------------------------------------
// scr_PlayerUpdate
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Renders the player
//------------------------------------------------------------------------------

function scr_PlayerUpdate()
{
	// Declare locals.
	
	var tObj;
	
	// Get the player object.
	
	tObj = global.playerObj;
	
	// Do literally nothing for pre-game.
	
	if (global.gameState == GS_PREGAME)
	{
		tObj.animFrameIndex = 2;
		return;
	}
	
	// Update the animation frame index.
	
	if (tObj.moving)
	{
		tObj.animFrameIndex += 0.25;
		if (tObj.animFrameIndex >= 2)
		{
			tObj.animFrameIndex-= 2;
		}
	}
	
	// Move the player if it doesn't involve a collision.

	dx = global.playerObj.dx * 5.87;
	dy = global.playerObj.dy * 5.87;
	
	if (scr_CanWeMove(tObj.x + dx, tObj.y + dy, tObj.dx, tObj.dy) == 0)
	{
		global.playerObj.x += dx;
		global.playerObj.y += dy;
		tObj.moving = true;
	}
	else
	{
		global.playerObj.x = ((global.playerObj.x div 32) * 32) + 16;
		global.playerObj.y = ((global.playerObj.y div 32) * 32) + 16;
		tObj.moving = false;
	}
	
	// Handle change of direction.
	
	if (keyboard_check(vk_left) && global.playerObj.dx != -1)
	{
		if (scr_IsMoveValid(tObj.x, tObj.y, -1, 0) == 0)
		{
			tObj.dx = -1;
			tObj.dy = 0;
			global.playerObj.x = ((global.playerObj.x div 32) * 32) + 16;
			global.playerObj.y = ((global.playerObj.y div 32) * 32) + 16;
		}
	}
	else if (keyboard_check(vk_right) && global.playerObj.dx != 1)
	{
		if (scr_IsMoveValid(tObj.x, tObj.y, 1, 0) == 0)
		{
			tObj.dx = 1;
			tObj.dy = 0;
			global.playerObj.x = ((global.playerObj.x div 32) * 32) + 16;
			global.playerObj.y = ((global.playerObj.y div 32) * 32) + 16;
		}
	}
	else if (keyboard_check(vk_up) && global.playerObj.dy != -1)
	{
		if (scr_IsMoveValid(tObj.x, tObj.y, 0, -1) == 0)
		{
			tObj.dx = 0;
			tObj.dy = -1;
			global.playerObj.x = ((global.playerObj.x div 32) * 32) + 16;
			global.playerObj.y = ((global.playerObj.y div 32) * 32) + 16;
		}
	}
	else if (keyboard_check(vk_down) && global.playerObj.dy != 1)
	{
		if (scr_IsMoveValid(tObj.x, tObj.y, 0, 1) == 0)
		{
			tObj.dx = 0;
			tObj.dy = 1;
			global.playerObj.x = ((global.playerObj.x div 32) * 32) + 16;
			global.playerObj.y = ((global.playerObj.y div 32) * 32) + 16;
		}
	}
}