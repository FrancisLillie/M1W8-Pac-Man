//------------------------------------------------------------------------------
// scr_MonolithRender
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Updates the overlays
//------------------------------------------------------------------------------

function scr_MonolithRender()
{
	// Declare locals.
	
	var screenX, screenY;
	var yScale, topOfMonolith;

	// Render the monolith.
	
	screenX = global.monolithObj.x - global.scrollX[5];
	screenY = global.monolithObj.y - global.scrollY[5];
	screenY += global.monolithObj.yAdjust;
	scr_Sprite_AddSorted(screenX, screenY, 75, 0, 0, 1, 1, 0, 1, 0, spr_Monolith, c_white, SPR_SORTED, true, false, false);
	
	// Render the lightning.
	
	if (global.monolithObj.lightningActive)
	{
		// From the screen y of the monolith we can work out vertical scale.
		
		topOfMonolith = (screenY - 215);
		yScale = (topOfMonolith / 128) * 1.05;
		
		// Now add the lightning.
		
		scr_Sprite_AddSorted(screenX, 0, 75, 0, 0, 1, yScale, 0, 0.75, global.monolithObj.frameNum, spr_Lightning, c_white, SPR_SORTED, true, false, false);
	}
}
