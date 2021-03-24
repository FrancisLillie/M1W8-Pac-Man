//-----------------------------------------------------------------------------
// scr_GlobalsGame
//-----------------------------------------------------------------------------
// Author   -   Francis Lillie
// Created  -   28/10/2013 12:40
// Abstract -   Script to contain all our globals
//-----------------------------------------------------------------------------

function scr_GlobalsGame()
{
	//-----------------------
	// Miscellaneous globals.
	//-----------------------

	globalvar gTicks;
	globalvar gameExitNeeded;
	globalvar Seed;

	//----------------
	// Game variables.
	//----------------

	globalvar nextGameState;
	globalvar gameState, gameType;
	globalvar preGamePhase;
	
	globalvar playerObj;
	
	globalvar lFrames;
	globalvar rFrames;
	globalvar uFrames;
	globalvar dFrames;
	
	globalvar playerScore, highScore;
	
	globalvar preGameSoundPlayed, preGameDelay;
	globalvar postGameDelay;
	
	globalvar pillArray;
	globalvar pillWakaDelay;
	
	globalvar wordArray;
	globalvar badWords, goodWords;
	globalvar wordDir;
	
	globalvar ghostArray;

	globalvar nodeArray;

	//-----------------------
	// Logo system variables.
	//-----------------------

	globalvar logoNum, logoDelay;

	//------------
	// Game texts.
	//------------

	globalvar gameStrings;
	
	// Game level data.
	
	globalvar levelMaster;
	globalvar levelData;
}
