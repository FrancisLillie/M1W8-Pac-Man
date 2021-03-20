function scr_Screen_GetAspect() {
	//-----------------------------------------------------------------------------
	// scr_Screen_GetAspect
	//-----------------------------------------------------------------------------
	// Inputs   -   None
	// Outputs  -   None
	// Notes    -   Sets up globals for aspects
	//-----------------------------------------------------------------------------

	// Declare locals.

	var lw, lh;

	// Get physical display dimensions in pixels.

	if (os_type == os_windows)
	{
	    lw = window_get_width();
	    lh = window_get_height();
	}
	else
	{
	    lw = display_get_width();
	    lh = display_get_height();
	    lw = VIRTUAL_WIDTH;
	    lh = VIRTUAL_HEIGHT;
	}

	// Only process further if we have width and height.

	if (lw != 0 && lh != 0)
	{
	    // Store physical display dimensions.
    
	    global.physicalScreenPixelWidth = lw;
	    global.physicalScreenPixelHeight = lh;
    
	    // Initialise virtual screen dimensions.
    
	    global.displayRectVirtualScreenWidth = VIRTUAL_WIDTH;
	    global.displayRectVirtualScreenHeight = VIRTUAL_HEIGHT;
    
	    // Work out aspect ratio.
    
	    global.screenAspecRatio = global.physicalScreenPixelWidth / global.physicalScreenPixelHeight;
    
	    // Recalculate the virtual screen width.
    
	    global.virtualScreenWidth = global.displayRectVirtualScreenWidth;
	    global.virtualScreenHeight = global.displayRectVirtualScreenWidth / global.screenAspecRatio;
    
	    // Calculate scale factor for sprites.
    
	    global.virtualToScreenScaleX = global.physicalScreenPixelWidth / global.virtualScreenWidth;
	    global.virtualToScreenScaleY = global.physicalScreenPixelHeight / global.virtualScreenHeight;
    
	    // Calculate an offset for sprites for virtual screen space.
    
	    global.virtualOffsetX = (global.virtualScreenWidth - global.displayRectVirtualScreenWidth) / 2;
	    global.virtualOffsetY = (global.virtualScreenHeight - global.displayRectVirtualScreenHeight) / 2;
	}


}
