//------------------------------------------------------------------------------
// scr_ExplosionRender
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Renders all explosions
//------------------------------------------------------------------------------

function scr_ExplosionRender()
{

	// Declare locals.

	var screenX, screenY;
	var Loop, lBank, tObj;

	// Render all active explosions.

	for (Loop = 0; Loop < MAX_EXPLOS; Loop++)
	{
		tObj = global.exploGrid[Loop];
	    if (tObj.Active == true)
	    {
			lBank = spr_Explo1;
			switch (tObj.Type)
			{
				case 0:
					lBank = spr_Explo1;
					break;
				case 1:
					lBank = spr_Explo2;
					break;
				case 2:
					lBank = spr_Explo3;
					break;
				case 3:
					lBank = spr_Explo4;
					break;
			}
			screenX = tObj.x - global.scrollX[5];
			screenY = tObj.y - global.scrollY[5];
			scr_Sprite_AddSorted(screenX, screenY, 100, 0, 0, tObj.Scale, tObj.Scale, 0, 1, tObj.Frame, lBank, c_white, SPR_SORTED, true, false, false);
		}
	}
}
