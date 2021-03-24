function macros()
{
	#macro DEBUG_MODE 1

	#macro MAX_ZONES 64

	#macro FADE_DIR_DOWN -1
	#macro FADE_DIR_UP 1

	#macro VIRTUAL_WIDTH 896
	#macro VIRTUAL_HEIGHT 1152

	#macro MAX_SPR_BACKGROUND 1024
	#macro MAX_SPR_NORMAL 1024
	#macro MAX_SPR_SORTED 1024
	#macro MAX_SPR_TEXT_SPRITE 1024
	#macro MAX_SPR_TEXT 1024
	#macro SPR_BACKGROUND 0
	#macro SPR_NORMAL 1
	#macro SPR_SORTED 2
	#macro SPR_TEXT_SPRITE 3
	#macro SPR_TEXT 4

	#macro MAX_CHANNELS 32

	#macro GS_LOGOS 0
	#macro GS_PREGAME 1
	#macro GS_GAME 2
	#macro GS_POSTGAME 3
	
	#macro PILL_GOOD 0
	#macro PILL_BAD 1
	#macro PILL_SEROTONIN 2
	
	#macro DEFAULT_SPEED 3.6
	
	#macro MAX_WORDS 32
	
	#macro MODE_SCATTER 0
	#macro MODE_CHASE 1
	#macro MODE_FRIGHTENED 2
	#macro MODE_DEAD 3
	
	#macro MIN_SCATTER_TIME (3 * room_speed)
	#macro MAX_SCATTER_TIME (7 * room_speed)
	#macro MIN_CHASE_TIME (10 * room_speed)
	#macro MAX_CHASE_TIME (30 * room_speed)
	#macro TIME_FRIGHTENED (10 * room_speed)
	
	#macro COLL_RADIUS 32
}