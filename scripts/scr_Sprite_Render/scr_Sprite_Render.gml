//-----------------------------------------------------------------------------
// scr_Sprite_Render
//-----------------------------------------------------------------------------
// Inputs   -   None
// Outputs  -   None
// Notes    -   Renders all three sprite lists
//-----------------------------------------------------------------------------

function scr_Sprite_Render()
{

	// Declare locals.

	var iLoop;
	var Sorted;
	var obj1, obj2, obj3;

	// Update the global tick counter.

	global.gTicks = global.gTicks + 1

	// Sort the sorted sprite list.

	if (global.sprCount2 != 0)
	{
	    do
	    {
	        Sorted = false;
	        for (iLoop = 0; iLoop < global.sprCount2 - 1; iLoop++)
	        {
	            obj1 = global.sprSorted[iLoop + 0];
	            obj2 = global.sprSorted[iLoop + 1];
            
	            if (obj2.z < obj1.z)
	            {
	                obj3 = global.sprSorted[iLoop + 1];
	                global.sprSorted[iLoop + 1] = global.sprSorted[iLoop + 0];
	                global.sprSorted[iLoop + 0] = obj3;
	                Sorted = true;
	            }
	        }
	    }
	    until (!Sorted);
	}

	// Render background sprites.

	for (iLoop = 0; iLoop < global.sprCount0; iLoop++)
	{
	    obj1 = sprBackground[iLoop];
	    draw_background_ext(obj1.image_index, obj1.x, obj1.y, obj1.image_xscale, obj1.image_yscale, obj1.image_angle, obj1.colour, obj1.alpha * global.fadeAlpha);
	}

	// Render normal sprites.

	for (iLoop = 0; iLoop < global.sprCount1; iLoop++)
	{
	    obj1 = sprNormal[iLoop];
	    draw_sprite_ext(obj1.sprite_index, obj1.image_index, obj1.x, obj1.y, obj1.image_xscale, obj1.image_yscale, obj1.image_angle, obj1.colour, obj1.alpha * global.fadeAlpha);
	}

	// Render sorted sprites.

	for (iLoop = 0; iLoop < global.sprCount2; iLoop++)
	{
	    obj1 = sprSorted[iLoop];
	    draw_sprite_ext(obj1.sprite_index, obj1.image_index, obj1.x, obj1.y, obj1.image_xscale, obj1.image_yscale, obj1.image_angle, obj1.colour, obj1.alpha * global.fadeAlpha);
	}

	// Render text as sprites.

	for (iLoop = 0; iLoop < global.sprCount3; iLoop++)
	{
	    obj1 = sprTextSprite[iLoop];
	    draw_sprite_ext(obj1.sprite_index, obj1.iIndex, obj1.x, obj1.y, obj1.image_xscale, obj1.image_yscale, obj1.image_angle, obj1.colour, obj1.alpha * global.fadeAlpha);
	}

	// Render text.

	for (iLoop = 0; iLoop < global.sprCount4; iLoop++)
	{
	    obj1 = sprText[iLoop];
	    scr_Font_Print(obj1.text, obj1.x, obj1.y, obj1.xscale, obj1.yscale, obj1.rot, obj1.colTL, obj1.colTR, obj1.colBR, obj1.colBL, obj1.alpha * global.fadeAlpha, obj1.font, obj1.halign,obj1.valign, 0, -1);
	}

	// Once drawn it's safe to clear lists.

	scr_Sprite_Clear();

	// Draw the zones.

	scr_Zone_Draw();
}
