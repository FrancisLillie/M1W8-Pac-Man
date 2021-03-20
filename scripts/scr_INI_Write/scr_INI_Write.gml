function scr_INI_Write(argument0, argument1, argument2, argument3, argument4) {
	//-----------------------------------------------------------------------------
	// scr_INI_Write
	//-----------------------------------------------------------------------------
	// Inputs   -   INI file name to write to       (arg0)
	//          -   Section name to write to        (arg1)
	//          -   Key name to write to            (arg2)
	//          -   Value type                      (arg3)
	//          -   Value to write                  (arg4)
	// Outputs  -   None
	// Notes    -   Writes a value to tthe INI file
	//-----------------------------------------------------------------------------

	// Write the value.

	ini_open(argument0);
	if (argument3 == "real") ini_write_real(argument1, argument2, argument4);
	else if (argument3 == "string") ini_write_string(argument1, argument2, argument4);

	// Close the file and return.

	ini_close()


}
