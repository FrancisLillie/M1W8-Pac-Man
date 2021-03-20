function scr_Sound_ChannelManager() {
	//-----------------------------------------------------------------------------
	// scr_Sound_ChannelManager
	//-----------------------------------------------------------------------------
	// Inputs   -   None
	// Outputs  -   None
	// Notes    -   Manages the channels of audio
	//-----------------------------------------------------------------------------

	// Declare locals.

	var iLoop;
	var channelObj;

	// Loop round all channels.

	for (iLoop = 0; iLoop < MAX_CHANNELS; iLoop++)
	{
	    // Get the channel object.
    
	    channelObj = global.audioChannels[iLoop];
    
	    // Now process.
    
	    if  (channelObj.isActive)
	    {
	        // Set the playing/paused flags.
        
	        channelObj.isPlaying = audio_is_playing(channelObj.sfxID);
	        channelObj.isPaused = audio_is_paused(channelObj.sfxID);
        
	        // Control the fading volume.
        
	        if (channelObj.fadesWithDisplay)
	        {
				audio_sound_gain(channelObj.sfxID, global.fadeAlpha * global.masterVolume * channelObj.volume, 0);
	        }

	        // If it's now no longer playing.
        
	        if (!channelObj.isPlaying && !channelObj.isPaused)
	        {
	            scr_Sound_ChannelReset(channelObj);
	        }
	    }
	}


}
