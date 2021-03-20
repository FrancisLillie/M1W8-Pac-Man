function scr_PauseRender() {
	//------------------------------------------------------------------------------
	// scr_PauseRender
	//------------------------------------------------------------------------------
	// Inputs   -   None
	// Outputs  -   None
	// Notes    -   Render the pause game
	//------------------------------------------------------------------------------

	if ((global.gTicks & 32) == 0)
	{
	    scr_Font_Print_Sprite(scr_String_GetPtr(TXT_PAUSED), VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, 1, 1, 1, 1, c_red, 1, fnt_8BitWonder, fa_center, fa_middle);
	}


}
