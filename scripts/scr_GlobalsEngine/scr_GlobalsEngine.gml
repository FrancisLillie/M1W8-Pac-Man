//-----------------------------------------------------------------------------
// scr_GlobalsEngine
//-----------------------------------------------------------------------------
// Author   -   Francis Lillie
// Created  -   28/10/2013 12:40
// Abstract -   Script to contain all our globals
//-----------------------------------------------------------------------------

function scr_GlobalsEngine()
{
	//------------------------------
	// Display/aspect ratio globals.
	//------------------------------

	globalvar screenAspecRatio;
	globalvar physicalScreenPixelWidth, physicalScreenPixelHeight;
	globalvar displayRectVirtualScreenWidth, displayRectVirtualScreenHeight;
	globalvar virtualToScreenScaleX, virtualToScreenScaleY;
	globalvar virtualOffsetX, virtualOffsetY;
	globalvar virtualScreenWidth, virtualScreenHeight;

	//------------------
	// Sprite variables.
	//------------------

	globalvar sprCount;
	globalvar sprCount0, sprCount1, sprCount2, sprCount3, sprCount4;
	globalvar sprBackground;
	globalvar sprNormal;
	globalvar sprSorted;
	globalvar sprTextSprite;
	globalvar sprText;

	//----------------
	// Font variables.
	//----------------

	globalvar fontCount;
	globalvar fontArray;

	//-----------------
	// Audio variables.
	//-----------------

	globalvar masterVolume;
	globalvar audioChannels;

	//----------------
	// Zone variables.
	//----------------

	globalvar zoneCount;
	globalvar zoneArray;
	globalvar zoneX, ZoneY, ZoneW, ZoneH;

	//-----------------------
	// Fade system variables.
	//-----------------------

	globalvar fadeActive, fadeActive_Old, fadeDir, fadeAlpha, fadeSpeed;
}
