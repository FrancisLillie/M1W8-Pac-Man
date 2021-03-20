//------------------------------------------------------------------------------
// scr_MonolithUpdate
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Updates the overlays
//------------------------------------------------------------------------------

function scr_MonolithUpdate()
{
	// Declare locals.

	var sinValue;
	var screenX;
	
	// Get the sin value and scale.
	
	sinValue = sin(global.monolithObj.sinOffset);
	sinValue = sinValue * 30;
	
	// Store it and update sin offset.
	
	global.monolithObj.yAdjust = sinValue;
	global.monolithObj.sinOffset += 2 * pi / room_speed / 3;
	
	// Update the lightning part.
	
	if (!global.monolithObj.lightningActive)
	{
		if (--global.monolithObj.lightningWait <= 0)
		{
			global.monolithObj.lightningWait = irandom_range(room_speed * 1, room_speed * 5);
			global.monolithObj.lightningActive = true;
			
			screenX = global.monolithObj.x - global.scrollX[5];
			if (screenX < (room_width * 1.05))
			{
			    scr_Sound_Play(snd_Shock, 0, 1, false, true, false);
				scr_ShakeCreate(1.2);
			}
		}
	}
	else
	{
		global.monolithObj.frameNum += 0.75;
		if (global.monolithObj.frameNum >= 20)
		{
			global.monolithObj.frameNum = 0;
			global.monolithObj.lightningActive = false;
		}
	}
}
