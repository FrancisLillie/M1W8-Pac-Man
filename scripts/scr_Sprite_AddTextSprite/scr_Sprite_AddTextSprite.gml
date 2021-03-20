//-----------------------------------------------------------------------------
// scr_Sprite_AddTextSprite
//-----------------------------------------------------------------------------
// Inputs   -   X position      (arg0)
//          -   Y position      (arg1)
//          -   Z position      (arg2)
//          -   X handle        (arg3)
//          -   Y handle        (arg4)
//          -   X scale         (arg5)
//          -   Y scale         (arg6)
//          -   Rotation        (arg7)
//          -   Alpha           (arg8)
//          -   Frame           (arg9)
//          -   Sprite name     (arg10)
//          -   Colour          (arg11)
//          -   List to add to  (arg12)
//          -   Screen space    (arg13)
//-----------------------------------------------------------------------------

function scr_Sprite_AddTextSprite(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13)
{

	// Declare locals.

	// Adjust x and y based on screen space flag.

	if (argument13 == true)
	{
	    argument0 = (argument0 + global.virtualOffsetX) * global.virtualToScreenScaleX;
	    argument1 = (argument1 + global.virtualOffsetY) * global.virtualToScreenScaleY;
	}
	else
	{
	    argument0 = argument0 * global.virtualToScreenScaleX;
	    argument1 = argument1 * global.virtualToScreenScaleY;
	}

	// Create new scales base on virtual to screen scales.

	argument5 = argument5 * global.virtualToScreenScaleX;
	argument6 = argument6 * global.virtualToScreenScaleY;

	// Create new x and y based on scale and handles.

	argument0 -= (argument3 * argument5);
	argument1 -= (argument4 * argument6);

	// Now create an object.

	obj = instance_create(argument0, argument1, obj_Sprite);
	obj.x = argument0;
	obj.y = argument1;
	obj.z = argument2;
	obj.hx = argument3;
	obj.hy = argument4;
	obj.image_xscale = argument5;
	obj.image_yscale = argument6;
	obj.image_angle = argument7;
	obj.alpha = argument8;
	obj.iIndex = argument9;
	obj.sprite_index = argument10;
	obj.colour = argument11;
	obj.list = argument12;
	obj.inScreenSpace = argument13;

	// Now add the object to an array.

	if (global.sprCount3 < MAX_SPR_TEXT_SPRITE)
	{
	    global.sprTextSprite[global.sprCount3] = obj;
	    global.sprCount3 = global.sprCount3 + 1;
	}


}
