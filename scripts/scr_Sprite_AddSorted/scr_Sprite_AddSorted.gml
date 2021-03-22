//-----------------------------------------------------------------------------
// scr_Sprite_AddSorted
//-----------------------------------------------------------------------------
// Inputs   -   X position      (arg0)
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

function scr_Sprite_AddSorted(nx, ny, nz, nxh, nyh, nxs, nys, nRot, nAlpha, nSprFrame, nSprName, nCol, nScreen, nxf, nyf)
{

	// Declare locals.

	// Adjust x and y based on screen space flag.

	if (nScreen == true)
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

	nxs = nxs * global.virtualToScreenScaleX;
	nys = nys * global.virtualToScreenScaleY;

	// Create new x and y based on scale and handles.

	nx -= (nxh * nxs);
	ny -= (nyh * nys);

	// Handle x flip.

	if (nxf)
	{
	    nx = nx + (sprite_get_width(nSprName) * nxs);
	    nxs = nxs * -1;
	}

	// Handle y flip.

	if (nyf)
	{
	    ny = ny + (sprite_get_height(nSprName) * nys);
	    nys = nys * -1;
	}

	// Now create an object.

	obj = instance_create_depth(nx, ny, -10000, obj_Sprite);
	obj.x = nx;
	obj.y = ny;
	obj.z = nz;
	obj.hx = nxh;
	obj.hy = nyh;
	obj.image_xscale = nxs;
	obj.image_yscale = nys;
	obj.image_angle = nRot;
	obj.alpha = nAlpha;
	obj.sprite_index = nSprName;
	obj.image_index = nSprFrame;
	obj.colour = nCol;
	obj.list = SPR_SORTED;
	obj.inScreenSpace = nScreen;

	// Now add the object to an array.

	if (global.sprCount2 < MAX_SPR_SORTED)
	{
	    global.sprSorted[global.sprCount2] = obj;
	    global.sprCount2 = global.sprCount2 + 1;
	}


}
