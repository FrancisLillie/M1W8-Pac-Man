function scr_Sound_ChannelReset(argument0) {
	//-----------------------------------------------------------------------------
	// scr_Sound_ChannelManager
	//-----------------------------------------------------------------------------
	// Inputs   -   Channel object                  (arg0)
	// Outputs  -   None
	// Notes    -   Manages the channels of audio
	//-----------------------------------------------------------------------------

	// Declare locals.

	var channelObj;

	// Get object.

	channelObj = argument0;

	// Reset object.

	channelObj.sfxName = -1;
	channelObj.sfxID = -1;
	channelObj.isPlaying = false;
	channelObj.isPaused = false;
	channelObj.isActive = false;
	channelObj.isLooped = false;
	channelObj.isStandAlone = false;
	channelObj.fadesWithDisplay = false;
	channelObj.pri = 0;
	channelObj.volume = 0;
	channelObj.x = 0;
	channelObj.y = 0;
	channelObj.z = 0;


}
