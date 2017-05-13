void Slippers_Arrival()
{
	gflags[PASSED_SLIPPERS_TEST] = true;
	gflags[SLIPPERS_PATHING_ON] = false;
	script AVATAR
	{
		nohalt;
		say "It seems I have arrived";
		wait 3;
		call UnFreezeAvatar;
	}
}

void Slippers_Path_7 object#()()
{
	UI_si_path_run_usecode(AVATAR, [360, 326], SCRIPTED, AVATAR, Slippers_Arrival, 0);	
}

void Slippers_Path_Script_7 object#()()
{
	script AVATAR
	{
		nohalt;
		call Slippers_Path_7;
	}
}

void Slippers_Path_6 object#()()
{
	UI_si_path_run_usecode(AVATAR, [360, 347], SCRIPTED, AVATAR, Slippers_Path_Script_7, 0);	
}

void Slippers_Path_Script_6 object#()()
{
	script AVATAR
	{
		nohalt;
		call Slippers_Path_6;
	}
}

void Slippers_Path_5 object#()()
{
	UI_si_path_run_usecode(AVATAR, [372, 328], SCRIPTED, AVATAR, Slippers_Path_Script_6, 0);	
}

void Slippers_Path_Script_5 object#()()
{
	script AVATAR
	{
		nohalt;
		call Slippers_Path_5;
	}
}


void Slippers_Path_4 object#()()
{
	UI_si_path_run_usecode(AVATAR, [349, 324], SCRIPTED, AVATAR, Slippers_Path_Script_5, 0);	
}

void Slippers_Path_Script_4 object#()()
{
	script AVATAR
	{
		nohalt;
		call Slippers_Path_4;
	}
}

void Slippers_Path_3 object#()()
{
	UI_si_path_run_usecode(AVATAR, [374, 335], SCRIPTED, AVATAR, Slippers_Path_Script_4, 0);	
}

void Slippers_Path_Script_3 object#()()
{
	script AVATAR
	{
		nohalt;
		call Slippers_Path_3;
	}
}

void Slippers_Path_2 object#()()
{
	UI_si_path_run_usecode(AVATAR, [348, 328], SCRIPTED, AVATAR, Slippers_Path_Script_3, 0);	
}

void Slippers_Path_Script_2 object#()()
{
	script AVATAR
	{
		nohalt;
		call Slippers_Path_2;
	}
}

void Slippers_Path_1 object#()()
{
	UI_si_path_run_usecode(AVATAR, [340, 347], SCRIPTED, AVATAR, Slippers_Path_Script_2, 0);	
}

void Slippers_Path_Script_1()
{
	script AVATAR
	{
		nohalt;
		call Slippers_Path_1;
	}
}



void egg_slippers_test object#()()
{

var slippers_equipped = UI_is_readied(AVATAR, 13, SLIPPERS_OF_FATE, ANY);

if(gflags[PASSED_SLIPPERS_TEST]) // have already done the walking through the room
{
}

else
{
if(gflags[ON_SLIPPERS_TEST])
{
}
else
{
if(slippers_equipped)
{
	UI_set_item_flag(AVATAR, DONT_MOVE);
	gflags[ON_SLIPPERS_TEST] = true;
	gflags[SLIPPERS_PATHING_ON] = true;
	UI_play_music(33);
	script AVATAR
	{
		say "I cannot control myself...";
	}
	UI_si_path_run_usecode(AVATAR, [348, 340], SCRIPTED, AVATAR, Slippers_Path_Script_1, 0);
}
else
{

var tele_spot = UI_die_roll(8);
 
	if(tele_spot == 1)
	{
		UI_move_object(AVATAR, [339, 329]); // top left of room
		UI_play_sound_effect(48);
	}
	else if (tele_spot == 2)
	{
		UI_move_object(AVATAR, [340, 345]); // bottom left of room
		UI_play_sound_effect(48);
	}
	else if (tele_spot == 3)
	{
		UI_move_object(AVATAR, [350, 333]); // Mid left of room
		UI_play_sound_effect(48);
	}
	else if (tele_spot == 4)
	{
		UI_move_object(AVATAR, [359, 346]); // Entrance to room
		UI_play_sound_effect(48);
	}
	else if (tele_spot == 5)
	{
		UI_move_object(AVATAR, [367, 340]); // mid right of room
		UI_play_sound_effect(48);
	}
	else if (tele_spot == 6)
	{
		UI_move_object(AVATAR, [369, 333]); // mid right of room # 2
		UI_play_sound_effect(48);
	}
	else if (tele_spot == 7)
	{
		UI_move_object(AVATAR, [380, 323]); // top right of room
		UI_play_sound_effect(48);
	}
	else if (tele_spot == 8)
	{
		UI_move_object(AVATAR, [381, 348]); // bottom right of room
		UI_play_sound_effect(48);
	}
}	
}
}

}