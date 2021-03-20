//------------------------------------------------------------------------------
// scr_PlayerRender
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Renders the player
//------------------------------------------------------------------------------

function scr_PlayerRender()
{
	// Declare locals.
	
	var lx, ly, lFrame, lSpr;
	
	// Don't render if we are dead.
	
	if (global.playerObj.Dead)
	{
		return;
	}
	
	// Set up x, y and frame.
	
	lx = global.playerObj.x - global.scrollX[5];
	ly = global.playerObj.y - global.scrollY[5];
	lFrame = global. playerObj.Frame;
	
	// What are we doing?
	
	if (global.playerObj.Exploding)
	{
		lSpr = spr_PlayerDie;
	}
	else if (global.playerObj.Flying)
	{
		lSpr = spr_PlayerFly;
	}
	else if (global.playerObj.Shooting1)
	{
		lSpr = spr_PlayerAttack1;
	}
	else if (global.playerObj.Shooting2)
	{
		lSpr = spr_PlayerAttack2;
	}
	
	// Now we can display the sprite.
	
	scr_Sprite_AddSorted(lx, ly, 10, 0, 0, PLAYER_SCALE_X, PLAYER_SCALE_Y, 0, 1, lFrame, lSpr, c_white, SPR_SORTED, true, false, false);
}