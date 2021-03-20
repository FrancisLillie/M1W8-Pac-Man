//------------------------------------------------------------------------------
// scr_ShakeCreate
//------------------------------------------------------------------------------
// Inputs   -   Magintude
// Outputs  -   None
// Notes    -   Add an explosion
//------------------------------------------------------------------------------

function scr_ShakeCreate(newMagnitude)
{
	// Set up screen shake.
			
	if (global.shakeDuration == 0)
	{
		global.shakeDuration = room_speed;
		global.shakeMagnitude = newMagnitude;
	}
}
