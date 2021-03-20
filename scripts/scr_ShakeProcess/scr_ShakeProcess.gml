//-----------------------------------------------------------------------------
// scr_ShakeProcess
//-----------------------------------------------------------------------------
// Author   -   Francis Lillie
// Created  -   28/02/2021 17:54
// Abstract -   Update the background
//-----------------------------------------------------------------------------

function scr_ShakeProcess()
{
	// Process a shake.
	
	if (global.shakeDuration != 0)
	{
		global.shakeX = sin(random_range(0, 2 * pi));
		global.shakeY = cos(random_range(0, 2 * pi));
		global.shakeX = global.shakeX * global.shakeMagnitude;
		global.shakeY = global.shakeY * global.shakeMagnitude;
		global.shakeDuration--;
	}
	else
	{
		global.shakeX = 0;
		global.shakeY = 0;
	}
}