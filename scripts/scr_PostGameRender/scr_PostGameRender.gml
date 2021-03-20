//------------------------------------------------------------------------------
// scr_PostGameShow
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Shows the post-game sequence
//------------------------------------------------------------------------------

function scr_PostGameRender()
{

	// Declare locals.

	var ly;
	var lStr;

	// Handle successful completion.

	if (global.Success)
	{
	    // Set up y position.

	    ly = ((VIRTUAL_HEIGHT - (LINE_SPACING * 4)) / 2);
	    ly += LINE_SPACING / 3;

	    // Draw box and text.

	    scr_Font_Print_Sprite(scr_String_GetPtr(TXT_POSTGAME4), VIRTUAL_WIDTH / 2, ly, 1, 1, 1, 1, c_white, 1, 0, fa_center, fa_top);
	    ly += LINE_SPACING;
	    scr_Font_Print_Sprite(scr_String_GetPtr(TXT_POSTGAME5), VIRTUAL_WIDTH / 2, ly, 1, 1, 1, 1, c_white, 1, 0, fa_center, fa_top);
	    ly += LINE_SPACING * 0.75;

		if ((global.gTicks & 32) == 0)
	    {
		    scr_Font_Print_Sprite(scr_String_GetPtr(TXT_PREGAME1), VIRTUAL_WIDTH / 2, ly, 1, 1, 1, 1, c_red, 1, 0, fa_center, fa_top);
		    scr_Zone_Add(global.zoneX, global.zoneY, global.zoneW, global.zoneH, ZONE_POSTGAME);
	    }
	}

	// Handle unsuccessful completion, Game Over.

	else
	{
	    // Set up y position.

	    ly = ((VIRTUAL_HEIGHT - (LINE_SPACING * 4)) / 2);
	    ly += LINE_SPACING / 3;

	    // Draw box and text.

	    scr_Font_Print_Sprite(scr_String_GetPtr(TXT_POSTGAME1), VIRTUAL_WIDTH / 2, ly, 1, 1, 1, 1, c_white, 1, 0, fa_center, fa_top);
	    ly += LINE_SPACING;
	    scr_Font_Print_Sprite(scr_String_GetPtr(TXT_POSTGAME2) + string(global.Score), VIRTUAL_WIDTH / 2, ly, 1, 1, 1, 1, c_white, 1, 0, fa_center, fa_top);
	    ly += LINE_SPACING * 0.75;
	    scr_Font_Print_Sprite(scr_String_GetPtr(TXT_POSTGAME3) + string(global.Level), VIRTUAL_WIDTH / 2, ly, 1, 1, 1, 1, c_white, 1, 0, fa_center, fa_top);
	    ly += LINE_SPACING * 0.75;

	    if ((global.gTicks & 32) == 0)
	    {
		    scr_Font_Print_Sprite(scr_String_GetPtr(TXT_PREGAME1), VIRTUAL_WIDTH / 2, ly, 1, 1, 1, 1, c_red, 1, 0, fa_center, fa_top);
		    scr_Zone_Add(global.zoneX, global.zoneY, global.zoneW, global.zoneH, ZONE_POSTGAME);
	    }
	}
}
