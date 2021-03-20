// Initialisation.

scr_Sprite_Clear();
scr_Zone_Clear();

scr_Font_Clear();
scr_Font_Init(fnt_Roboto, 43, 65, 32, 224, false, "");

scr_Sound_Init();

scr_InitLevel(1, true);
