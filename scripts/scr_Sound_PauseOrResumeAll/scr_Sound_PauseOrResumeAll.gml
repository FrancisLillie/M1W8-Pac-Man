function scr_Sound_PauseOrResumeAll(argument0) {
	//-----------------------------------------------------------------------------
	// scr_Sound_PauseOrResumeAll
	//-----------------------------------------------------------------------------
	// Inputs   -   True for pause, false for resume    (arg0)
	// Outputs  -   None
	// Notes    -   Pauses all active sounds
	//-----------------------------------------------------------------------------

	var iLoop;
	var channelObj;

	// Main loop.

	for (iLoop = 0; iLoop < MAX_CHANNELS; iLoop++)
	{
	    // Set up the channel object.
    
	    channelObj = global.audioChannels[iLoop];

	    // Puase or resume.
    
	    if (argument0)
	    {
	        // Only attempt to pause if playing and not paused.
    
	        if (channelObj.isPlaying && !channelObj.isPaused)
	        {
	            audio_pause_sound(channelObj.sfxID);
	            channelObj.isPaused = true;
	        }
	    }
	    else
	    {
	        // Only attempt to resume if playing and paused.
    
	        if (channelObj.isPlaying && channelObj.isPaused)
	        {
	            audio_resume_sound(channelObj.sfxID);
	            channelObj.isPaused = false;
	        }
	    }
	}


}
