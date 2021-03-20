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
	
	globalvar scrollX, scrollY;
	
	globalvar playerObj;
	globalvar shotGrid, nmeShotGrid, ghostGrid;
	globalvar ghostDelay;
	
	globalvar bossActive, bossDestroyed, bossEnergy;
	globalvar bossHit, bossHitTimer;
	
	globalvar exploGrid;
	
	globalvar shakeDuration, shakeMagnitude;
	globalvar shakeX, shakeY;
	
	globalvar monolithObj;
	
	globalvar cheatFlag;

	//-----------------------
	// Logo system variables.
	//-----------------------

	globalvar logoNum, logoDelay;

	//------------
	// Game texts.
	//------------

	globalvar gameStrings;
}
