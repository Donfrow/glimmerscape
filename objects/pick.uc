



void pick shape#(624)()
{
if(event == DOUBLECLICK)
{
	var pick = UI_get_readied(AVATAR, 1);
	var pick_readied = UI_get_item_shape(pick);
	var time = UI_game_hour();
	if(gflags[UNEARTH_STAIRCASE] && time >= 6 && time <= 17)
	{
		UI_set_item_flag(AVATAR, DONT_MOVE);
		UI_si_path_run_usecode(AVATAR, [741, 2502, 0], SCRIPTED, AVATAR, 0);
		UI_si_path_run_usecode(-446, [747, 2509, 0], SCRIPTED, -446, 0);
	}
}
}
