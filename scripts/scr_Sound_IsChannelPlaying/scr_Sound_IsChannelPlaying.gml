//-----------------------------------------------------------------------------
// scr_Sound_IsChannelPlaying
//-----------------------------------------------------------------------------
// Inputs   -   Channel to check
// Outputs  -   True for playing, false otherwise
// Notes    -   Checks to see if a channel is playing
//-----------------------------------------------------------------------------

function scr_Sound_IsChannelPlaying(channelID)
{
	return (audio_is_playing(channelID))
}