//-----------------------------------------------------------------------------
// scr_Font_Init
//-----------------------------------------------------------------------------
// Inputs   -   Sprite name             (arg0)
//          -   Frame width             (arg1)
//          -   Frame height            (arg2)
//          -   First character         (arg3)
//          -   Num characters          (arg4)
//          -   Kerning                 (arg5)
//          -   Font information base   (arg6)
//-----------------------------------------------------------------------------

function scr_Font_Init(sprName, frameW, frameH, firstChar, numChars, toKern, kernName)
{

	// Declare locals.

	var iLoop;
	var thisFile;

	// Create a new object and populate it.

	obj = instance_create(0, 0, obj_Font)
	obj.sprName = sprName;
	obj.frameWidth = frameW;
	obj.frameHeight = frameH;
	obj.firstChar = firstChar;
	obj.numChars = numChars;
	obj.kern = toKern;

	// Do we need to set up kerning.

	if (obj.kern)
	{
	    if (kernName != "")
	    {
	        // Initialise an empty table.
        
	        kernTable[obj.numChars * obj.numChars] = 0;
        
	        // Now read in from the included text file.
        
	        thisFile = file_text_open_read(kernName + ".txt");
        
	        for (iLoop = 0; iLoop < (obj.numChars * obj.numChars); iLoop++)
	        {
	            obj.kernTable[iLoop] = file_text_read_real(thisFile);
	        }
        
	        // Close the file.
        
	        file_text_close(thisFile);
	    }
	}

	// Do we need to set up the top and bottom table.

	if (obj.kern)
	{
	    if (kernName != "")
	    {
	        // Initialise an empty table.
        
	        tbTable[obj.numChars * 2] = 0;

	        // Now read in from the included text file.
        
	        thisFile = file_text_open_read(kernName + "_tb.txt");
        
	        for (iLoop = 0; iLoop < (obj.numChars * 2); iLoop++)
	        {
	            obj.tbTable[iLoop] = file_text_read_real(thisFile);
	        }
        
	        // Close the file.
        
	        file_text_close(thisFile);
	    }
	}

	// Do we need to set up the left and right table.

	if (obj.kern)
	{
	    if (kernName != "")
	    {
	        // Initialise an empty table.
        
	        tbTable[obj.numChars * 2] = 0;

	        // Now read in from the included text file.
        
	        thisFile = file_text_open_read(kernName + "_lr.txt");
        
	        for (iLoop = 0; iLoop < (obj.numChars * 2); iLoop++)
	        {
	            obj.lrTable[iLoop] = file_text_read_real(thisFile);
	        }
        
	        // Close the file.
        
	        file_text_close(thisFile);
	    }
	}

	// Store the object and update the global font count.

	global.fontArray[global.fontCount] = obj;
	global.fontCount = global.fontCount + 1;


}
