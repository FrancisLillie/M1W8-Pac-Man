// Clear sprite lists.

scr_Sprite_Clear();

// Process a fade.

scr_Fade_Process();

// Add the sprites.

scr_Screen_GetAspect();
switch (logoNum)
{
    case 0:
        //scr_Sprite_AddNormal(room_width / 2, room_height / 2, 0, 0, 0, 1 + sin(global.gTicks / 25), 1 + cos(global.gTicks / 25), radtodeg(global.gTicks / 25), 1, 0, spr_Logo2, c_white, true, false, false);
        scr_Sprite_AddNormal(room_width / 2, room_height / 2, 0, 0, 0, 1 + sin(global.gTicks / 25), 1 + cos(global.gTicks / 25), 0, 1, 0, spr_Logo2, c_white, true, false, false);
        break;
}

// Process the timers if we're not fading.

if (fadeActive = false)
{
    // Increment the timer.
    
    logoDelay += 1;
    if (logoDelay = (room_speed * 30))
    {
        logoDelay = 0;
        scr_Fade_InitDown(0.5);
    }
	if (keyboard_check_pressed(vk_enter))
	{
        logoDelay = 0;
        scr_Fade_InitDown(0.5);
	}
}

// If we were fading but not now we've just finished.

if (fadeActive = false && fadeActive_Old = true)
{
    if (fadeDir = FADE_DIR_DOWN)
    {
        scr_Fade_InitUp(0.5);
        logoNum = logoNum + 1;
        switch (logoNum)
        {
            case 0:
                break;
            case 1:
                logoNum = 0;
                global.gameState = GS_PREGAME;
                room_goto(rm_Game);
                break;
        }
    }
}

