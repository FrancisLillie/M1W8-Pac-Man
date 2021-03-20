//------------------------------------------------------------------------------
// scr_ExplosionUpdate
//------------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Updates all explosions
//------------------------------------------------------------------------------

function scr_ExplosionUpdate()
{
	// Declare locals.

	var Loop;

	// Search for a free slot.

	global.ExpActive = 0;

	for (Loop = 0; Loop < MAX_EXPLOS; Loop++)
	{
	    if (global.exploGrid[Loop].Active)
	    {
	        global.ExpActive++;

	        // Update frame wait.

	        if (--global.exploGrid[Loop].Delay <= 0)
	        {
	            global.exploGrid[Loop].Delay = EXPLO_DELAY;

	            // Update frame.
            
	            global.exploGrid[Loop].Frame++;

				// Are at the end.
				
				if (exploGrid[Loop].Frame == 8)
				{
	                // Reset.
                
	                global.exploGrid[Loop].Active = false;
	                global.exploGrid[Loop].Frame = 0;
	                global.exploGrid[Loop].Delay = 0;

	                global.exploGrid[Loop].x = 0;
	                global.exploGrid[Loop].y = 0;
				}
	        }
	    }
	}
}
