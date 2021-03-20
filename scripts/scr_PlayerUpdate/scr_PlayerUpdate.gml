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
	
	var iLoop, count;
	var boundX, boundY;
	
	// Initialisation.
	
	boundX = (PLAYER_W * PLAYER_SCALE_X) / 2;
	boundY = (PLAYER_H * PLAYER_SCALE_Y) / 2;
	
	//---------------------
	// Exit if we are dead.
	//---------------------
	
	if (global.playerObj.Dead || global.monolithObj.hasBeenHit)
	{
		return;
	}
	
	//---------------------
	// Exploding animation.
	//---------------------
	
	if (global.playerObj.Exploding)
	{
		if (++global.playerObj.FrameDelay == 2)
		{
			global.playerObj.FrameDelay = 0;
			if (++global.playerObj.Frame == 17)
			{
				if (!global.cheatFlag)
				{
					global.playerObj.Frame = 0;
					global.playerObj.Dead = true;
					scr_Fade_InitDown(0.5);
				}
			}
		}
		return;
	}
	
	//-------------------
	// Flying animations.
	//-------------------
	
	if (global.playerObj.Flying)
	{
		if (++global.playerObj.FrameDelay == 4)
		{
			global.playerObj.FrameDelay = 0;
			if (++global.playerObj.Frame == 8)
			{
				global.playerObj.Frame = 0;
				scr_Sound_Play(snd_Flap, 1, 1, false, true, false);
			}
		}
	}
	
	//---------------------------------
	// Handle the shooting 1 animation.
	//---------------------------------

	if (global.playerObj.Shooting1)
	{
		if (++global.playerObj.FrameDelay == 2)
		{
			global.playerObj.FrameDelay = 0;
			global.playerObj.Frame++;
			if (global.playerObj.Frame == 3)
			{
				scr_ShotAddPlayer(global.playerObj.x, global.playerObj.y, SHOT_SCYTHE1);
			}
			else if (global.playerObj.Frame == 4)
			{
				global.playerObj.Frame = 0;
				global.playerObj.Shooting1 = false;
				global.playerObj.Flying = true;
			}
		}
	}
	
	//---------------------------------
	// Handle the shooting 2 animation.
	//---------------------------------

	if (global.playerObj.Shooting2)
	{
		if (++global.playerObj.FrameDelay == 1)
		{
			global.playerObj.FrameDelay = 0;
			global.playerObj.Frame++;
			if (global.playerObj.Frame == 6)
			{
				scr_ShotAddPlayer(global.playerObj.x, global.playerObj.y, SHOT_SCYTHE2);
			}
			else if (global.playerObj.Frame == 11)
			{
				global.playerObj.Frame = 0;
				global.playerObj.Shooting2 = false;
				global.playerObj.Flying = true;
			}
		}
	}

	//-------------------------------
	// Handle the scrolling/movement.
	//-------------------------------

	// Keep up with scrolling.
	
	if (global.scrollX[5] < ((SCROLL_SCREEN_W * 3) - room_width))
	{
		global.playerObj.x += 6;
	}
	
	// Now handle X control.
	
	if (keyboard_check(vk_right))
	{
		global.playerObj.dx += DX_ADJUST;
		if (global.playerObj.dx >= MAX_PLAYER_X_SPEED)
		{
			global.playerObj.dx = MAX_PLAYER_X_SPEED;
		}
	}
	else if (keyboard_check(vk_left))
	{
		global.playerObj.dx -= DX_ADJUST;
		if (global.playerObj.dx <= -MAX_PLAYER_X_SPEED)
		{
			global.playerObj.dx = -MAX_PLAYER_X_SPEED;
		}
	}
	else
	{
		if (global.playerObj.dx < 0)
		{
			global.playerObj.dx += DX_ADJUST;
			if (global.playerObj.dx >= 0)
			{
				global.playerObj.dx = 0;
			}
		}
		else if (global.playerObj.dx > 0)
		{
			global.playerObj.dx -= DX_ADJUST;
			if (global.playerObj.dx <= 0)
			{
				global.playerObj.dx = 0;
			}
		}
	}
	
	// Update x position from deltas.
	
	global.playerObj.x += global.playerObj.dx;
	
	// Clip X position.
	
	if (global.playerObj.x <= (global.scrollX[5] + boundX))
	{
		global.playerObj.x = (global.scrollX[5] + boundX);
		global.playerObj.dx = 0;
	}
	if (global.playerObj.x >= ((global.scrollX[5] + room_width) - boundX))
	{
		global.playerObj.x = ((global.scrollX[5] + room_width) - boundX);
		global.playerObj.dx = 0;
	}

	// Now handle Y control.
	
	if (keyboard_check(vk_up))
	{
		global.playerObj.dy -= DY_ADJUST;
		if (global.playerObj.dy <= -MAX_PLAYER_Y_SPEED)
		{
			global.playerObj.dy = -MAX_PLAYER_Y_SPEED;
		}
	}
	else if (keyboard_check(vk_down))
	{
		global.playerObj.dy += DY_ADJUST;
		if (global.playerObj.dy >= MAX_PLAYER_Y_SPEED)
		{
			global.playerObj.dy = MAX_PLAYER_Y_SPEED;
		}
	}
	else
	{
		if (global.playerObj.dy < 0)
		{
			global.playerObj.dy += DY_ADJUST;
			if (global.playerObj.dy >= 0)
			{
				global.playerObj.dy = 0;
			}
		}
		else if (global.playerObj.dy > 0)
		{
			global.playerObj.dy -= DY_ADJUST;
			if (global.playerObj.dy <= 0)
			{
				global.playerObj.dy = 0;
			}
		}
	}
	
	// Update x position from deltas.
	
	global.playerObj.y += global.playerObj.dy;

	// Clip Y position.
	
	if (global.playerObj.y <= (170 + boundY))
	{
		global.playerObj.y = (170 + boundY);
		global.playerObj.dy = 0;
	}
	if (global.playerObj.y >= (SCROLL_H - boundY))
	{
		global.playerObj.y = (SCROLL_H - boundY);
		global.playerObj.dy = 0;
	}
	
	//--------------------
	// Do we want to fire?
	//--------------------
	
	if (global.playerObj.Flying && keyboard_check(ord("Z")))
	{
		global.playerObj.Flying = false;
		global.playerObj.Shooting1 = true;
		global.playerObj.Shooting2 = false;
		global.playerObj.Frame = 0;
		global.playerObj.FrameDelay = 0;
	}
	if (global.playerObj.Flying && keyboard_check(ord("X")))
	{
		global.playerObj.Flying = false;
		global.playerObj.Shooting1 = false;
		global.playerObj.Shooting2 = true;
		global.playerObj.Frame = 0;
		global.playerObj.FrameDelay = 0;
	}
}