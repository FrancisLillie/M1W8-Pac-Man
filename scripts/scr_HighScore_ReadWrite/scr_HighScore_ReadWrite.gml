function scr_HighScore_ReadWrite(argument0) {
	//-----------------------------------------------------------------------------
	// scr_INI_Read
	//-----------------------------------------------------------------------------
	// Inputs   -   "read" or "write"               (arg0)
	// Outputs  -   None
	// Notes    -   Read or write high score data
	//-----------------------------------------------------------------------------

	// Do we want to read or write?

	if (argument0 == "read")
	{
	    global.hsNames[0] = scr_INI_Read("cc.ini", "High Scores", "Pos 01 Name", "string");
	    global.hsNames[1] = scr_INI_Read("cc.ini", "High Scores", "Pos 02 Name", "string");
	    global.hsNames[2] = scr_INI_Read("cc.ini", "High Scores", "Pos 03 Name", "string");
	    global.hsNames[3] = scr_INI_Read("cc.ini", "High Scores", "Pos 04 Name", "string");
	    global.hsNames[4] = scr_INI_Read("cc.ini", "High Scores", "Pos 05 Name", "string");

	    global.hsScores[0] = scr_INI_Read("cc.ini", "High Scores", "Pos 01 Score", "real");
	    global.hsScores[1] = scr_INI_Read("cc.ini", "High Scores", "Pos 02 Score", "real");
	    global.hsScores[2] = scr_INI_Read("cc.ini", "High Scores", "Pos 03 Score", "real");
	    global.hsScores[3] = scr_INI_Read("cc.ini", "High Scores", "Pos 04 Score", "real");
	    global.hsScores[4] = scr_INI_Read("cc.ini", "High Scores", "Pos 05 Score", "real");
	}
	else
	{
	    scr_INI_Write("cc.ini", "High Scores", "Pos 01 Name", "string", global.hsNames[0]);
	    scr_INI_Write("cc.ini", "High Scores", "Pos 02 Name", "string", global.hsNames[1]);
	    scr_INI_Write("cc.ini", "High Scores", "Pos 03 Name", "string", global.hsNames[2]);
	    scr_INI_Write("cc.ini", "High Scores", "Pos 04 Name", "string", global.hsNames[3]);
	    scr_INI_Write("cc.ini", "High Scores", "Pos 05 Name", "string", global.hsNames[4]);

	    scr_INI_Write("cc.ini", "High Scores", "Pos 01 Score", "real", global.hsScores[0]);
	    scr_INI_Write("cc.ini", "High Scores", "Pos 02 Score", "real", global.hsScores[1]);
	    scr_INI_Write("cc.ini", "High Scores", "Pos 03 Score", "real", global.hsScores[2]);
	    scr_INI_Write("cc.ini", "High Scores", "Pos 04 Score", "real", global.hsScores[3]);
	    scr_INI_Write("cc.ini", "High Scores", "Pos 05 Score", "real", global.hsScores[4]);
	}


}
