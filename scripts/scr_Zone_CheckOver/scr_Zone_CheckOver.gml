function scr_Zone_CheckOver(argument0)
{
	//-----------------------------------------------------------------------------
	// scr_Zone_CheckOver
	//-----------------------------------------------------------------------------
	// Inputs   -   Zone to check for       (arg0)
	// Outputs  -   None
	// Notes    -   Checks to see if any zones are being hovered over
	//-----------------------------------------------------------------------------

	// Declare locals.

	var iLoop;
	var obj;
	var retValue;

	// Only do if we're on windows or HTML5.
	retValue = false;

	if (os_type == os_windows)
	{
	    // Now see if any zones have been hit.
        
	    for (iLoop = 0; iLoop < global.zoneCount; iLoop++)
	    {
	        // Get zone object.
        
	        obj = global.zoneArray[iLoop];

	        // Is this the right type.
        
	        if (obj.zoneType == argument0)
	        {
	            // Check boundaries.
            
	            if (device_mouse_x(0) >= obj.zoneX && device_mouse_x(0) < (obj.zoneX + obj.zoneW))
	            {
	                if (device_mouse_y(0) >= obj.zoneY && device_mouse_y(0) < (obj.zoneY + obj.zoneH))
	                {
	                    global.zoneArray[iLoop].zoneOver = true;
	                    retValue = true;
	                }
	                else
	                {
	                    global.zoneArray[iLoop].zoneOver = false;
	                    retValue = false;
	                }
	            }        
	        }
	    }
	}

	// Return the correct value.

	return retValue;
}
