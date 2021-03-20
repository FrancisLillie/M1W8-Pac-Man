//-----------------------------------------------------------------------------
// scr_Fade_Process
//-----------------------------------------------------------------------------
// Author   -   Francis Lillie
// Created  -   28/10/2013 12:34
// Abstract -   Process a fade
//-----------------------------------------------------------------------------

function scr_Fade_Process()
{

	if (fadeActive)
	{
	    // Store off state of fade.
    
	    fadeActive_Old = fadeActive;

	    // Now process the fade.
    
	    if (fadeDir = FADE_DIR_UP)
	    {
	        fadeAlpha += (1 / (room_speed * fadeSpeed));
	        if (fadeAlpha >= 1)
	        {
	            fadeAlpha = 1;
	            fadeActive = false;
	        }
	    }
	    else if (fadeDir = FADE_DIR_DOWN)
	    {
	        fadeAlpha -= (1 / (room_speed * fadeSpeed));
	        if (fadeAlpha <= -0.2)
	        {
	            fadeAlpha = 0;
	            fadeActive = false;
	            if (global.gameExitNeeded)
	            {
	                game_end();
	            }
	            else
	            {
					if (global.monolithObj.hasBeenHit)
					{
						global.Level++;
						scr_InitLevel(global.Level, false);
						scr_Fade_InitUp(1);
					}
	            }
	        }
        
	        // Process game specific stuff.
        
	        if (!fadeActive)
	        {
				if (global.playerObj.Dead)
				{
	                scr_InitLevel(global.Level, false);
	                scr_Fade_InitUp(1);
				}
	        }
	    }
	}
}
