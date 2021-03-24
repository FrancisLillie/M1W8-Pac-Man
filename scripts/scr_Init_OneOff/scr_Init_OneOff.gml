//-----------------------------------------------------------------------------
// scr_Init_OneOff
//-----------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   One off initialisation
//-----------------------------------------------------------------------------

function scr_Init_OneOff()
{
	// Randomise.
	
	randomize();
	
	// One off initialisation.

	scr_Texts();
	global.gTicks = 0;
	global.gameExitNeeded = false;

	// Sprite initialisation.

	global.sprCount = 0;
	global.sprCount0 = 0;
	global.sprCount1 = 0;
	global.sprCount2 = 0;
	global.sprCount3 = 0;
	global.sprCount4 = 0;
	scr_Sprite_Clear();

	// Font initialisation.

	global.fontCount = 0
	scr_Font_Clear();

	// Zone initialisation.

	global.zoneCount = 0;
	scr_Zone_Clear();

	// Audio channel initialisation.

	scr_Sound_Init();
	global.masterVolume = 1;

	// Game initialisation.

	global.nextGameState = GS_LOGOS;
	global.gameState = GS_LOGOS;

	// Create the player.
	
	global.playerObj = instance_create_depth(0, 0, 0, obj_Player);
	
	// Create the bad words.
	
	global.badWords[0] = "I HATE YOU!";
	global.badWords[1] = "YOU'RE HORRIBLE!";
	global.badWords[2] = "GO AWAY!";
	global.badWords[3] = "NO-ONE LIKES YOU!";
	global.badWords[4] = "YOU SMELL!";
	global.badWords[5] = "STUPID!";
	global.badWords[6] = "UGLY!";
	global.badWords[7] = "FAT!";
	global.badWords[8] = "THICK!";
	global.badWords[9] = "POOR!";
	global.badWords[10] = "LONER!";
	global.badWords[11] = "DISAPPOINTMENT!";
	global.badWords[12] = "WEIRDO!";
	global.badWords[13] = "BURDEN!";
	global.badWords[14] = "NAZI!";
	global.badWords[15] = "HOPELESS!";
	global.badWords[16] = "HAPLESS!";
	global.badWords[17] = "GORMLESS!";
	global.badWords[18] = "IDIOT!";
	global.badWords[19] = "FREAK!";
	
	// Create the bad words.
	
	global.goodWords[0] = "BRILLIANT!";
	global.goodWords[1] = "WELL DONE!";
	global.goodWords[2] = "THANKS!";
	global.goodWords[3] = "PRETTY!";
	global.goodWords[4] = "CLEVER!";
	global.goodWords[5] = "AWESOME!";
	global.goodWords[6] = "LOVE YOU!";
	global.goodWords[7] = "BEST MATE!";
	global.goodWords[8] = "FUNNY!";
	global.goodWords[9] = "HAPPY!";
	global.goodWords[10] = "BUDDY!";
	global.goodWords[11] = "SUCH A LAUGH!";
	global.goodWords[12] = "HUGS!";
	global.goodWords[13] = "INSPIRATION!";
	global.goodWords[14] = "SUNSHINE!";
	global.goodWords[15] = "STYLISH!";
	global.goodWords[16] = "PERFECT!";
	global.goodWords[17] = "MY WORLD!";
	global.goodWords[18] = "SOULMATE!";
	global.goodWords[19] = "SUPERHERO";
	
	// Initialise the ghosts.
	
	global.ghostArray[0] = instance_create_depth(0, 0, 0, obj_Ghost);
	global.ghostArray[1] = instance_create_depth(0, 0, 0, obj_Ghost);
	global.ghostArray[2] = instance_create_depth(0, 0, 0, obj_Ghost);
	global.ghostArray[3] = instance_create_depth(0, 0, 0, obj_Ghost);
	
	// Create the level data.
	
	var r01 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	var r02 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
	var r03 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var r04 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
	var r05 = [1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,1];
	var r06 = [1,2,1,1,1,1,2,1,1,1,1,1,2,1,1,2,1,1,1,1,1,2,1,1,1,1,2,1];
	var r07 = [1,3,1,1,1,1,2,1,1,1,1,1,2,1,1,2,1,1,1,1,1,2,1,1,1,1,3,1];
	var r08 = [1,2,1,1,1,1,2,1,1,1,1,1,2,1,1,2,1,1,1,1,1,2,1,1,1,1,2,1];
	var r09 = [1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1];
	var r10 = [1,2,1,1,1,1,2,1,1,2,1,1,1,1,1,1,1,1,2,1,1,2,1,1,1,1,2,1];
	var r11 = [1,2,1,1,1,1,2,1,1,2,1,1,1,1,1,1,1,1,2,1,1,2,1,1,1,1,2,1];
	var r12 = [1,2,2,2,2,2,2,1,1,2,2,2,2,1,1,2,2,2,2,1,1,2,2,2,2,2,2,1];
	var r13 = [1,1,1,1,1,1,2,1,1,1,1,1,0,1,1,0,1,1,1,1,1,2,1,1,1,1,1,1];
	var r14 = [1,1,1,1,1,1,2,1,1,1,1,1,0,1,1,0,1,1,1,1,1,2,1,1,1,1,1,1];
	var r15 = [1,1,1,1,1,1,2,1,1,0,0,0,0,0,0,0,0,0,0,1,1,2,1,1,1,1,1,1];
	var r16 = [1,1,1,1,1,1,2,1,1,0,1,1,1,4,4,1,1,1,0,1,1,2,1,1,1,1,1,1];
	var r17 = [1,1,1,1,1,1,2,1,1,0,1,0,0,0,0,0,0,1,0,1,1,2,1,1,1,1,1,1];
	var r18 = [0,0,0,0,0,0,2,0,0,0,1,0,0,0,0,0,0,1,0,0,0,2,0,0,0,0,0,0];
	var r19 = [1,1,1,1,1,1,2,1,1,0,1,0,0,0,0,0,0,1,0,1,1,2,1,1,1,1,1,1];
	var r20 = [1,1,1,1,1,1,2,1,1,0,1,1,1,1,1,1,1,1,0,1,1,2,1,1,1,1,1,1];
	var r21 = [1,1,1,1,1,1,2,1,1,0,0,0,0,0,0,0,0,0,0,1,1,2,1,1,1,1,1,1];
	var r22 = [1,1,1,1,1,1,2,1,1,0,1,1,1,1,1,1,1,1,0,1,1,2,1,1,1,1,1,1];
	var r23 = [1,1,1,1,1,1,2,1,1,0,1,1,1,1,1,1,1,1,0,1,1,2,1,1,1,1,1,1];
	var r24 = [1,2,2,2,2,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,2,2,2,2,1];
	var r25 = [1,2,1,1,1,1,2,1,1,1,1,1,2,1,1,2,1,1,1,1,1,2,1,1,1,1,2,1];
	var r26 = [1,2,1,1,1,1,2,1,1,1,1,1,2,1,1,2,1,1,1,1,1,2,1,1,1,1,2,1];
	var r27 = [1,3,2,2,1,1,2,2,2,2,2,2,2,0,0,2,2,2,2,2,2,2,1,1,2,2,3,1];
	var r28 = [1,1,1,2,1,1,2,1,1,2,1,1,1,1,1,1,1,1,2,1,1,2,1,1,2,1,1,1];
	var r29 = [1,1,1,2,1,1,2,1,1,2,1,1,1,1,1,1,1,1,2,1,1,2,1,1,2,1,1,1];
	var r30 = [1,2,2,2,2,2,2,1,1,2,2,2,2,1,1,2,2,2,2,1,1,2,2,2,2,2,2,1];
	var r31 = [1,2,1,1,1,1,1,1,1,1,1,1,2,1,1,2,1,1,1,1,1,1,1,1,1,1,2,1];
	var r32 = [1,2,1,1,1,1,1,1,1,1,1,1,2,1,1,2,1,1,1,1,1,1,1,1,1,1,2,1];
	var r33 = [1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1];
	var r34 = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
	var r35 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	var r36 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	
	for (xLoop = 0; xLoop < 28; xLoop++)
	{
		global.levelMaster[0, xLoop] = r01[xLoop];
		global.levelMaster[1, xLoop] = r02[xLoop];
		global.levelMaster[2, xLoop] = r03[xLoop];
		global.levelMaster[3, xLoop] = r04[xLoop];
		global.levelMaster[4, xLoop] = r05[xLoop];
		global.levelMaster[5, xLoop] = r06[xLoop];
		global.levelMaster[6, xLoop] = r07[xLoop];
		global.levelMaster[7, xLoop] = r08[xLoop];
		global.levelMaster[8, xLoop] = r09[xLoop];
		global.levelMaster[9, xLoop] = r10[xLoop];
		
		global.levelMaster[10, xLoop] = r11[xLoop];
		global.levelMaster[11, xLoop] = r12[xLoop];
		global.levelMaster[12, xLoop] = r13[xLoop];
		global.levelMaster[13, xLoop] = r14[xLoop];
		global.levelMaster[14, xLoop] = r15[xLoop];
		global.levelMaster[15, xLoop] = r16[xLoop];
		global.levelMaster[16, xLoop] = r17[xLoop];
		global.levelMaster[17, xLoop] = r18[xLoop];
		global.levelMaster[18, xLoop] = r19[xLoop];
		global.levelMaster[19, xLoop] = r20[xLoop];

		global.levelMaster[20, xLoop] = r21[xLoop];
		global.levelMaster[21, xLoop] = r22[xLoop];
		global.levelMaster[22, xLoop] = r23[xLoop];
		global.levelMaster[23, xLoop] = r24[xLoop];
		global.levelMaster[24, xLoop] = r25[xLoop];
		global.levelMaster[25, xLoop] = r26[xLoop];
		global.levelMaster[26, xLoop] = r27[xLoop];
		global.levelMaster[27, xLoop] = r28[xLoop];
		global.levelMaster[28, xLoop] = r29[xLoop];
		global.levelMaster[29, xLoop] = r30[xLoop];
		
		global.levelMaster[30, xLoop] = r31[xLoop];
		global.levelMaster[31, xLoop] = r32[xLoop];
		global.levelMaster[32, xLoop] = r33[xLoop];
		global.levelMaster[33, xLoop] = r34[xLoop];
		global.levelMaster[34, xLoop] = r35[xLoop];
		global.levelMaster[35, xLoop] = r36[xLoop];
	}
	
	// Build the node array.
	
	scr_NodesInitialise();
}
