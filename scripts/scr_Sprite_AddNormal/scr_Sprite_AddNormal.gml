//-----------------------------------------------------------------------------
// scr_Sprite_AddNormal
//-----------------------------------------------------------------------------
// Inputs   -   X position
//          -   Y position
//          -   Z position
//          -   X handle
//          -   Y handle
//          -   X scale
//          -   Y scale
//          -   Rotation
//          -   Alpha
//          -   Frame
//          -   Sprite name
//          -   Colour
//          -   Screen space
//          -   X flip
//          -   Y flip
//-----------------------------------------------------------------------------

function scr_Sprite_AddNormal(nx, ny, nz, nxh, nyh, nXScale, nYScale, nRot, nAlpha, nFrame, nSprName, nColor, nScreenSpace, nXFlip, nYFlip)
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
	obj.list = SPR_NORMAL;
	obj.inScreenSpace = nScreenSpace;
	obj.xFlip = nXFlip;
	obj.yFlip = nYFlip;

	// Now add the object to an array.

	if (global.sprCount1 < MAX_SPR_NORMAL)
	{
	    global.sprNormal[global.sprCount1] = obj;
	    global.sprCount1 = global.sprCount1 + 1;
	}


}
