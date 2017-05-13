

void Start_Prisoner_Transport_Egg object#()()
{

var egg_loc = get_object_position();

if(gflags[KNIGHT])
{
	if(gflags[TRANSPORT_PRISONER_KILL_FLAG])
	{
	
	}
	else
	{

		UI_set_item_flag(AVATAR, 16); // Freeze Avatar
		var avatar_loc = UI_get_object_position(AVATAR);
		avatarx = avatar_loc[1];
		avatary = avatar_loc[2];
// 58 test num  241 real num
		if(egg_loc[1] == 1595) // West gate
		{
			UI_move_object(-241, [1636, 1737, 0]); // Move Thomas for the start of his walk
			UI_si_path_run_usecode(-241, [avatarx+5, avatary, 0], SCRIPTED, AVATAR, Thomas_Transport_Talk, 1);
			gflags[TRANSPORT_PRISONER_KILL_FLAG] = true;
		}
		else if (egg_loc[1] == 1735) // South gate
		{
			UI_move_object(-241, [1734, 1911, 0]); // Move Thomas for the start of his walk
			UI_si_path_run_usecode(-241, [avatarx, avatary-5, 0], SCRIPTED, AVATAR, Thomas_Transport_Talk, 1);
			gflags[TRANSPORT_PRISONER_KILL_FLAG] = true;
		}

	}
}
}


void Goblin_Ambush object#()()
{
	if(inParty(-382))
	{
		UI_set_item_flag(AVATAR, 16); // Freeze Avatar
		UI_si_path_run_usecode(AVATAR, [1928, 1126, 0], SCRIPTED, AVATAR, Markus_Transport_Talk, 1);
		UI_si_path_run_usecode(-382, [1928, 1128, 0], SCRIPTED, AVATAR);
	}
}