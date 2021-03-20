//------------------------------------------------------------------------------
// scr_ShotRenderPlayer
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Renders all enemy shots
//------------------------------------------------------------------------------

function scr_ShotRenderPlayer()
{
	// Declare locals.

	var Loop;
	var tObj;
	var screenX, screenY;

	// Render all active explosions.

	for (Loop = 0; Loop < MAX_SHOTS; Loop++)
	{
		tObj = global.shotGrid[Loop];
	    if (tObj.Active == true)
	    {
			screenX = tObj.x - global.scrollX[5];
			screenY = tObj.y - global.scrollY[5];
		    scr_Sprite_AddSorted(screenX, screenY, 0, 0, 0, 0.4, 0.4, tObj.Rotation, 1, tObj.Type, spr_ShotPlayerScythe, c_white, SPR_SORTED, true, false, false);
		}
	}
}