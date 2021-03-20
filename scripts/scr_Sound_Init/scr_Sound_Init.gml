function scr_Sound_Init() {
	//-----------------------------------------------------------------------------
	// scr_Sound_Init
	//-----------------------------------------------------------------------------
	// Inputs   -   None
	// Outputs  -   None
	// Notes    -   Build the channel objects
	//-----------------------------------------------------------------------------

	// Declare locals.

	var iLoop;
	var obj;

	// Set up the channels.

	for (iLoop = 0; iLoop < MAX_CHANNELS; iLoop++)
	{
	    obj = instance_create(0, 0, obj_SoundChannel);
	    global.audioChannels[iLoop] = obj;
	    scr_Sound_ChannelReset(obj);
	}


}
