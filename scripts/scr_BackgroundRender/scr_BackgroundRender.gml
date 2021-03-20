//-----------------------------------------------------------------------------
// scr_BackgroundRender
//-----------------------------------------------------------------------------
// Author   -   Francis Lillie
// Created  -   28/02/2021 17:54
// Abstract -   Render the background
//-----------------------------------------------------------------------------

function scr_BackgroundRender()
{
	// Declare locals.
	
	var pLevel;
	var sx, sy;
	var sprBank, sprValue;
	var xLoop, yLoop;
	var numSpr;
	var xOffset, yOffset;
	var nLevel;
	
	// Intialisation.
	
	nLevel = global.Level mod 5;
	
	// Do all levels.
	
	numSpr = 0;
	for (pLevel = 0; pLevel < 6; pLevel++)
	{
		// Get the base sprite.
		
		switch (pLevel)
		{
			case 0:
				if (nLevel == 0) sprBank = spr_Canyon_01;
				if (nLevel == 1) sprBank = spr_Cave1_01;
				if (nLevel == 2) sprBank = spr_Cave2_01;
				if (nLevel == 3) sprBank = spr_Field_01;
				if (nLevel == 4) sprBank = spr_Iceland_01;
				xOffset = global.shakeX * 3.5;
				yOffset = global.shakeY * 3.5;
				break;
			case 1:
				if (nLevel == 0) sprBank = spr_Canyon_02;
				if (nLevel == 1) sprBank = spr_Cave1_02;
				if (nLevel == 2) sprBank = spr_Cave2_02;
				if (nLevel == 3) sprBank = spr_Field_02;
				if (nLevel == 4) sprBank = spr_Iceland_02;
				xOffset = global.shakeX * 4;
				yOffset = global.shakeY * 4;
				break;
			case 2:
				if (nLevel == 0) sprBank = spr_Canyon_03;
				if (nLevel == 1) sprBank = spr_Cave1_03;
				if (nLevel == 2) sprBank = spr_Cave2_03;
				if (nLevel == 3) sprBank = spr_Field_03;
				if (nLevel == 4) sprBank = spr_Iceland_03;
				xOffset = global.shakeX * 4.5;
				yOffset = global.shakeY * 4.5;
				break;
			case 3:
				if (nLevel == 0) sprBank = spr_Canyon_04;
				if (nLevel == 1) sprBank = spr_Cave1_04;
				if (nLevel == 2) sprBank = spr_Cave2_04;
				if (nLevel == 3) sprBank = spr_Field_04;
				if (nLevel == 4) sprBank = spr_Iceland_04;
				xOffset = global.shakeX * 5;
				yOffset = global.shakeY * 5;
				break;
			case 4:
				if (nLevel == 0) sprBank = spr_Canyon_05;
				if (nLevel == 1) sprBank = spr_Cave1_05;
				if (nLevel == 2) sprBank = spr_Cave2_05;
				if (nLevel == 3) sprBank = spr_Field_05;
				if (nLevel == 4) sprBank = spr_Iceland_05;
				xOffset = global.shakeX * 5.5;
				yOffset = global.shakeY * 5.5;
				break;
			case 5:
				if (nLevel == 0) sprBank = spr_Canyon_06;
				if (nLevel == 1) sprBank = spr_Cave1_06;
				if (nLevel == 2) sprBank = spr_Cave2_06;
				if (nLevel == 3) sprBank = spr_Field_06;
				if (nLevel == 4) sprBank = spr_Iceland_06;
				xOffset = global.shakeX * 6;
				yOffset = global.shakeY * 6;
				break;
		}
		
		// Set up start y position.
		
		sy = -global.scrollY[pLevel];
		
		// Outer Y loop.
		
		for (yLoop = 0; yLoop < (SCROLL_H / SCROLL_BLOCK_H); yLoop++)
		{
			// Set up start x position.
	
			sx = -global.scrollX[pLevel];
			
			// Inner X loop.
			
			for (xLoop = 0; xLoop < (SCROLL_W / SCROLL_BLOCK_W); xLoop++)
			{
				// Get the sprite value.
				
				sprValue = (xLoop mod (SCROLL_SCREEN_W / SCROLL_BLOCK_W)) + (yLoop * (SCROLL_SCREEN_W / SCROLL_BLOCK_W));
				
				// Check bounds.
				
				if ((sx + SCROLL_BLOCK_W) >= 0 && (sx < room_width))
				{
					if ((sy + SCROLL_BLOCK_H) >= 0 && (sy < room_height))
					{
						scr_Sprite_AddNormal(sx + xOffset, sy + yOffset, 0, 0, 0, 1, 1, 0, 1, sprValue, sprBank, c_white, SPR_NORMAL, true, false, false);
						numSpr++;
					}
				}
				
				// Increment the x position.
				
				sx += SCROLL_BLOCK_W;
			}
			
			// Incerment the y position.
			
			sy += SCROLL_BLOCK_H;
		}
	}
}