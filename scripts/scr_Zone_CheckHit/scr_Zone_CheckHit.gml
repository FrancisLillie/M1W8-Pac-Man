function scr_Zone_CheckHit()
{
	//-----------------------------------------------------------------------------
	// scr_Zone_CheckHit
	//-----------------------------------------------------------------------------
	// Inputs   -   None
	// Outputs  -   None
	// Notes    -   Checks to see if any zones have been touched
	//-----------------------------------------------------------------------------

	// Declare locals.

	var iLoop;
	var obj;

	// Only do if first 'left mouse button' is released.

	if (device_mouse_check_button_released(0, mb_left) && !global.fadeActive)
	{
	    // Now see if any zones have been hit.
    
	    for (iLoop = 0; iLoop < global.zoneCount; iLoop++)
	    {
	        // Get zone object.
        
	        obj = global.zoneArray[iLoop];
        
	        // Check boundaries.
        
	        if (device_mouse_x(0) >= obj.zoneX && device_mouse_x(0) < (obj.zoneX + obj.zoneW))
	        {
	            if (device_mouse_y(0) >= obj.zoneY && device_mouse_y(0) < (obj.zoneY + obj.zoneH))
	            {
	                // Now handle the zone hit.
                
	                switch (obj.zoneType)
	                {
	                    case 0:
	                        break;
	                }
	            }
	        }
	    }
	}
}
