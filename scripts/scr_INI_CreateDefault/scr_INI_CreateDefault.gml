function scr_INI_CreateDefault(argument0) {
	//-----------------------------------------------------------------------------
	// scr_INI_CreateDefault
	//-----------------------------------------------------------------------------
	// Inputs   -   INI file name to process        (arg0)
	// Outputs  -   None
	// Notes    -   Creates a default INI if it doesn't exist
	//-----------------------------------------------------------------------------

	// Declare locals.

	var localStr;

	// Open the INI.

	ini_open(argument0);

	// Grab the existence flag.

	localStr = ini_read_string("Default", "Existence", "Error")

	// Process if we can't read.

	if (localStr == "Error")
	{
	    // Write the default section.
    
	    ini_write_string("Default", "Existence", "True");
    
	    // Create default high scores.
    
	    ini_write_string("High Scores", "Pos 01 Name", "Francis");
	    ini_write_real("High Scores", "Pos 01 Score", 500);
	    ini_write_string("High Scores", "Pos 02 Name", "Lisa");
	    ini_write_real("High Scores", "Pos 02 Score", 400);
	    ini_write_string("High Scores", "Pos 03 Name", "Ben");
	    ini_write_real("High Scores", "Pos 03 Score", 300);
	    ini_write_string("High Scores", "Pos 04 Name", "Jack");
	    ini_write_real("High Scores", "Pos 04 Score", 200);
	    ini_write_string("High Scores", "Pos 05 Name", "Emma");
	    ini_write_real("High Scores", "Pos 05 Score", 100);
	}

	// Close the file and return.

	ini_close();


}
