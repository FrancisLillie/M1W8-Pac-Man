//-----------------------------------------------------------------------------
// scr_Sound_Play
//-----------------------------------------------------------------------------
// Inputs   -   Sound effect name to play           (arg0)
//          -   Priority (0 - 100)                  (arg1)
//          -   Volume to play at                   (arg2)
//          -   Looped flag                         (arg3)
//          -   Fades with display                  (arg4)
//          -   Only one occurence allowed          (arg5)
// Outputs  -   Boolean success/failure flag
// Notes    -   Attempts to play a sound
//-----------------------------------------------------------------------------

function scr_Sound_Play(nSound, nPri, nVolume, nLooped, nFades, nOnlyOne)
{
	// Declare locals.

	var iLoop;
	var channelObj;
	var canPlay, soundPlayed, channelFound;

	// Initialisation.,

	canPlay = true;
	soundPlayed = false;

	// If this is a stand alone then see if one is already playing.

	canPlay = true;
	if (nOnlyOne == true)
	{
	    for (iLoop = 0; iLoop < MAX_CHANNELS; iLoop++)
	    {
	        channelObj = global.audioChannels[iLoop];
	        if (channelObj.isPlaying && channelObj.sfxName == nSound)
	        {
	            canPlay = false;
	            soundPlayed = false;
	            break;
	        }
	    }
	}

	// Now we only want to attempt to play if allowed to.

	if (canPlay)
	{
	    // First try and find a free channel.
    
	    soundPlayed = false;
	    channelFound = false;
	    for (iLoop = 0; iLoop < MAX_CHANNELS; iLoop++)
	    {
	        channelObj = global.audioChannels[iLoop];
	        if (channelObj.isActive == false)
	        {
	            channelFound = true;
	            channelObj.sfxName = nSound;
	            channelObj.isPlaying = true;
	            channelObj.isActive = true;
	            channelObj.isPaused = false;
	            channelObj.isLooped = nLooped;
	            channelObj.isStandAlone = nOnlyOne;
	            channelObj.pri = nPri;
	            channelObj.volume = global.masterVolume * nVolume;
	            channelObj.fadesWithDisplay = nFades;
	            channelObj.pri = nPri;
	            channelObj.x = 0;
	            channelObj.y = 0;
	            channelObj.z = 0;
	            channelObj.sfxID = audio_play_sound(nSound, nPri, nLooped);
				audio_sound_gain(channelObj.sfxID , channelObj.volume, 0);
	            soundPlayed = true;
	            break;
	        }
	    }
    
	    // If we have no free channel then find lower priority channel.
    
	    if (!channelFound)
	    {
	        for (iLoop = 0; iLoop < MAX_CHANNELS; iLoop++)
	        {
	            channelObj = audioChannels[iLoop];
	            if (channelObj.pri < nPri)
	            {
	                if (channelObj.isPlaying)
	                {
	                    audio_stop_sound(channelObj.sfxID);
	                }
	                scr_Sound_ChannelReset(channelObj);
	                channelFound = true;
	                channelObj.sfxName = nSound;
	                channelObj.isPlaying = true;
		            channelObj.isActive = true;
	                channelObj.isPaused = false;
	                channelObj.isLooped = nLooped;
	                channelObj.isStandAlone = nOnlyOne;
	                channelObj.pri = nPri;
	                channelObj.volume = global.masterVolume * nVolume;
	                channelObj.fadesWithDisplay = nFades;
	                channelObj.pri = nPri;
	                channelObj.x = 0;
	                channelObj.y = 0;
	                channelObj.z = 0;
	                channelObj.sfxID = audio_play_sound(nSound, nPri, nLooped);
					audio_sound_gain(channelObj.sfxID , channelObj.volume, 0);
	                soundPlayed = true;
	                break;
	            }
	        }
	    }
	}

	// Now return the status.

	return soundPlayed;
}
