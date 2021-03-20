function scr_INI_Read(argument0, argument1, argument2, argument3) {
	//-----------------------------------------------------------------------------
	// scr_INI_Read
	//-----------------------------------------------------------------------------
	// Inputs   -   INI file name to read from      (arg0)
	//          -   Section name to read from       (arg1)
	//          -   Key name to read from           (arg2)
	//          -   Value type                      (arg3)
	// Outputs  -   Value
	// Notes    -   Reads a value from specified INI file
	//-----------------------------------------------------------------------------

	// Declare locals.

	var retVal;

	// Grab the value.

	ini_open(argument0);
	if (argument3 == "real") retVal = ini_read_real(argument1, argument2, 0);
	else if (argument3 == "string") retVal = ini_read_string(argument1, argument2, "");
	else retVal = "Error";

	// Close the file and return.

	ini_close()

	return retVal;


}
