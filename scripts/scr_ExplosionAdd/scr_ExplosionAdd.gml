//------------------------------------------------------------------------------
// scr_ExplosionAdd
//------------------------------------------------------------------------------
// Inputs   -   X position
//          -   Y position
//          -   Type of explosion
//			-	Scale
// Outputs  -   None
// Notes    -   Add an explosion
//------------------------------------------------------------------------------

function scr_ExplosionAdd(nx, ny, nType, nScale)
{
	// Declare locals.

	var Loop;
	var lx, ly, tm, rm, bm, lm;

	// Search for a free slot.

	for (Loop = 0; Loop < MAX_EXPLOS; Loop++)
	{
	    if (global.exploGrid[Loop].Active == false)
	    {
	        global.exploGrid[Loop].Active = true;
			global.exploGrid[Loop].Frame = 0;
	        global.exploGrid[Loop].Delay = EXPLO_DELAY;

	        // Get right position for explosion sprite.
        
			global.exploGrid[Loop].x = nx;
			global.exploGrid[Loop].y = ny;
			
			global.exploGrid[Loop].Type = nType;
			global.exploGrid[Loop].Scale = nScale;
			
			// Set up screen shake.
			
			scr_ShakeCreate(0.7);

	        // Play a sound and return.
		    
			scr_Sound_Play(snd_Explo1, 0, 1, false, true, false);

	        return 0;
	    }
	}
}
