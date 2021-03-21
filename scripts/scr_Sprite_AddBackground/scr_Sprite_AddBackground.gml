//-----------------------------------------------------------------------------
// scr_Sprite_AddBackground
//-----------------------------------------------------------------------------
// Inputs   -   Background index        (arg0)
//          -   X position              (arg1)
//          -   Y position              (arg2)
//          -   X scale                 (arg3)
//          -   Y scale                 (arg4)
//          -   Angle of text           (arg5)
//          -   Colour                  (arg6)
//          -   Alpha                   (arg7)
//          -   Screen space flag       (arg8)
//-----------------------------------------------------------------------------

function scr_Sprite_AddBackground(argument0, argument1, argument2, argument3, argument4, argument5, tCol, tAlpha, screenSpace)
{

	// Adjust x and y based on screen space flag.

	if (screenSpace == true)
	{
	    argument1 = (argument1 + global.virtualOffsetX) * global.virtualToScreenScaleX;
	    argument2 = (argument2 + global.virtualOffsetY) * global.virtualToScreenScaleY;
	}
	else
	{
	    argument1 = argument1 * global.virtualToScreenScaleX;
	    argument2 = argument2 * global.virtualToScreenScaleY;
	}

	// Create new scales base on virtual to screen scales.

	argument3 = argument3 * global.virtualToScreenScaleX;
	argument4 = argument4 * global.virtualToScreenScaleY;

	// Now create an object.

	obj = instance_create(argument1, argument2, obj_Sprite);
	__background_set( e__BG.Index, 0, argument0 );
	obj.x = argument1;
	obj.y = argument2;
	obj.image_xscale = argument3;
	obj.image_yscale = argument4;
	obj.image_angle = argument5;
	obj.colour = tCol;
	obj.image_alpha = tAlpha;
	obj.inScreenSpace = screenSpace;
	obj.list = SPR_BACKGROUND;

	// Now add the object to an array.

	if (global.sprCount0 < MAX_SPR_BACKGROUND)
	{
	    global.sprBackground[global.sprCount0] = obj;
	    global.sprCount0 = global.sprCount0 + 1;
	}


}
