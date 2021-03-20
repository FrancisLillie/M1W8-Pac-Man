function scr_Zone_Add(argument0, argument1, argument2, argument3, argument4)
{
	//-----------------------------------------------------------------------------
	// scr_Zone_Add
	//-----------------------------------------------------------------------------
	// Inputs   -   X position          (arg0)
	//          -   Y position          (arg1)
	//          -   Width               (arg2)
	//          -   Height              (arg3)
	//          -   Zone type/ID        (arg4)
	// Outputs  -   None
	// Notes    -   Adds a zone to the table.
	//-----------------------------------------------------------------------------

	// Declare locals.

	var obj;

	// Only add if we have space.

	if (global.zoneCount < MAX_ZONES)
	{
	    obj = instance_create(0, 0, obj_Zone);
	    obj.zoneX = argument0;
	    obj.zoneY = argument1;
	    obj.zoneW = argument2;
	    obj.zoneH = argument3;
	    obj.zoneType = argument4;
    
	    global.zoneArray[global.zoneCount] = obj;
	    global.zoneCount = global.zoneCount + 1;
	}
}
