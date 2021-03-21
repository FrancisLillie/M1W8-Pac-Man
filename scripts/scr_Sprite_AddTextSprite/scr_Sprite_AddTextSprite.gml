//-----------------------------------------------------------------------------
// scr_Sprite_AddTextSprite
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
//-----------------------------------------------------------------------------

function scr_Sprite_AddTextSprite(xPos, yPos, zPos, xHandle, yHandle, xScale, yScale, tRot, tAlpha, tFrame, tSprite, tCol, screenSpace)
{

	// Declare locals.

	// Adjust x and y based on screen space flag.

	if (screenSpace == true)
	{
	    xPos = (xPos + global.virtualOffsetX) * global.virtualToScreenScaleX;
	    yPos = (yPos + global.virtualOffsetY) * global.virtualToScreenScaleY;
	}
	else
	{
	    xPos = xPos * global.virtualToScreenScaleX;
	    yPos = yPos * global.virtualToScreenScaleY;
	}

	// Create new scales base on virtual to screen scales.

	xScale = xScale * global.virtualToScreenScaleX;
	yScale = yScale * global.virtualToScreenScaleY;

	// Create new x and y based on scale and handles.

	xPos -= (xHandle * xScale);
	yPos -= (yHandle * yScale);

	// Now create an object.

	obj = instance_create(xPos, yPos, obj_Sprite);
	obj.x = xPos;
	obj.y = yPos;
	obj.z = zPos;
	obj.hx = xHandle;
	obj.hy = yHandle;
	obj.image_xscale = xScale;
	obj.image_yscale = yScale;
	obj.image_angle = tRot;
	obj.alpha = tAlpha;
	obj.iIndex = tFrame;
	obj.sprite_index = tSprite;
	obj.colour = tCol;
	obj.list = SPR_TEXT;
	obj.inScreenSpace = screenSpace;

	// Now add the object to an array.

	if (global.sprCount3 < MAX_SPR_TEXT_SPRITE)
	{
	    global.sprTextSprite[global.sprCount3] = obj;
	    global.sprCount3 = global.sprCount3 + 1;
	}


}
