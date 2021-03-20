//------------------------------------------------------------------------------
// scr_ShotRenderEnemy
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Renders all enemy shots
//------------------------------------------------------------------------------

function scr_ShotRenderEnemy()
{
	// Declare locals.

	var Loop;
	var tObj;
	var screenX, screenY, lBank;

	// Render all active explosions.

	for (Loop = 0; Loop < MAX_NME_SHOTS; Loop++)
	{
		tObj = global.nmeShotGrid[Loop];
	    if (tObj.Active == true)
	    {
			screenX = tObj.x - global.scrollX[5];
			screenY = tObj.y - global.scrollY[5];
			lBank = spr_GhostShot1;
			switch (tObj.Type)
			{
				case 0:
					lBank = spr_GhostShot1;
					break;
				case 1:
					lBank = spr_GhostShot2;
					break;
				case 2:
					lBank = spr_GhostShot3;
					break;
				case 3:
					lBank = spr_GhostShot4;
					break;
			}
		    scr_Sprite_AddSorted(screenX, screenY, 50, 0, 0, 0.75, 0.75, 0, 1, tObj.Frame, lBank, c_white, SPR_SORTED, true, false, false);
		}
	}
}