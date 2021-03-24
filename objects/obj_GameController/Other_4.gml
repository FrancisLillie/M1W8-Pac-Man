// Initialisation.

scr_Sprite_Clear();
scr_Zone_Clear();

scr_Font_Clear();

scr_Font_Init(fnt_Font01, 32, 32, 32, 59, false, "");
scr_Font_Init(fnt_Font02, 32, 32, 32, 59, false, "");
scr_Font_Init(fnt_Font03, 32, 32, 32, 59, false, "");
scr_Font_Init(fnt_Font04, 32, 32, 32, 59, false, "");
scr_Font_Init(fnt_Font05, 32, 32, 32, 59, false, "");
scr_Font_Init(fnt_Font06, 32, 32, 32, 59, false, "");
scr_Font_Init(fnt_Font07, 32, 32, 32, 59, false, "");
scr_Font_Init(fnt_Font08, 32, 32, 32, 59, false, "");

scr_Sound_Init();

scr_InitLevel(1, true, true);
