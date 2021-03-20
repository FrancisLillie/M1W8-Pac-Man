//-----------------------------------------------------------------------------
// scr_Sprite_AddNormal
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
//          -   X flip          (arg14)
//          -   Y flip          (arg15)
//-----------------------------------------------------------------------------

function scr_Sprite_AddNormal(nx, ny, nz, nxh, nyh, nXScale, nYScale, nRot, nAlpha, nFrame, nSprName, nColor, nList, nScreenSpace, nXFlip, nYFlip)
{
	// Declare locals.

	// Adjust x and y based on screen space flag.

	if (nScreenSpace == true)
	{
	    nx = (nx + global.virtualOffsetX) * global.virtualToScreenScaleX;
	    ny = (ny + global.virtualOffsetY) * global.virtualToScreenScaleY;
	}
	else
	{
	    nx = nx * global.virtualToScreenScaleX;
	    ny = ny * global.virtualToScreenScaleY;
	}

	// Create new scales base on virtual to screen scales.

	nXScale = nXScale * global.virtualToScreenScaleX;
	nYScale = nYScale * global.virtualToScreenScaleY;

	// Create new x and y based on scale and handles.

	nx -= (nxh * nXScale);
	ny -= (nyh * nYScale);

	// Handle x flip.

	if (nXFlip)
	{
	    nx = nx + (sprite_get_width(nSprName) * nXScale);
	    nXScale = nXScale * -1;
	}

	// Handle y flip.

	if (nYFlip)
	{
	    ny = ny + (sprite_get_height(nSprName) * nYScale);
	    nYScale = nYScale * -1;
	}

	// Now create an object.

	obj = instance_create(nx, ny, obj_Sprite);
	obj.x = nx;
	obj.y = ny;
	obj.z = nz;
	obj.hx = nxh;
	obj.hy = nyh;
	obj.image_xscale = nXScale;
	obj.image_yscale = nYScale;
	obj.image_angle = nRot;
	obj.alpha = nAlpha;
	obj.image_index = nFrame;
	obj.sprite_index = nSprName;
	obj.colour = nColor;
	obj.list = nList;
	obj.inScreenSpace = nScreenSpace;

	// Now add the object to an array.

	if (global.sprCount1 < MAX_SPR_NORMAL)
	{
	    global.sprNormal[global.sprCount1] = obj;
	    global.sprCount1 = global.sprCount1 + 1;
	}


}
