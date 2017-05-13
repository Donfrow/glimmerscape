// RIGHT DOOR PATHING

void Dice_End_Path() // End path for both left and right
{
	gflags[DICE_PATH1] = false;
	script AVATAR
	{
		nohalt;
		actor frame STAND;
		face NORTH;
		wait 7;
		say "I can move again";
		call UnFreezeAvatar;
	}
	
}

void Dice_Right_Script_3 object#()()
{
		UI_si_path_run_usecode(AVATAR, [359, 262], SCRIPTED, AVATAR, Dice_End_Path, 0);	
}

void Path_Right_Door_3()
{
	script AVATAR
	{
		nohalt;
		call Dice_Right_Script_3;
	}
}

void Dice_Right_Script_2 object#()()
{
		UI_si_path_run_usecode(AVATAR, [355, 262], SCRIPTED, AVATAR, Path_Right_Door_3, 0);	
}

void Path_Right_Door_2()
{
	script AVATAR
	{
		nohalt;
		call Dice_Right_Script_2;
	}
}

void Dice_Right_Script_1 object#()()
{
		UI_si_path_run_usecode(AVATAR, [355, 250], SCRIPTED, AVATAR, Path_Right_Door_2, 0);	
}

void Path_Right_Door_1()
{
	script AVATAR
	{
		call Dice_Right_Script_1;
	}
}


// LEFT DOOR PATHING

void Dice_Left_Script_3 object#()()
{
		UI_si_path_run_usecode(AVATAR, [359, 262], SCRIPTED, AVATAR, Dice_End_Path, 0);	
}

void Path_Left_Door_3()
{
	script AVATAR
	{
		nohalt;
		call Dice_Left_Script_3;
	}
}

void Dice_Left_Script_2 object#()()
{
		UI_si_path_run_usecode(AVATAR, [362, 262], SCRIPTED, AVATAR, Path_Left_Door_3, 0);	
}

void Path_Left_Door_2()
{
	script AVATAR
	{
		nohalt;
		call Dice_Left_Script_2;
	}
}

void Dice_Left_Script_1 object#()()
{
		UI_si_path_run_usecode(AVATAR, [362, 250], SCRIPTED, AVATAR, Path_Left_Door_2, 0);	
}

void Path_Left_Door_1()
{
	script AVATAR
	{
		nohalt;
		call Dice_Left_Script_1;
	}
}



void egg_dice_test_path object#()()
{

var loc = get_object_position();

var x = loc[1];
var y = loc[2];


	if(gflags[DICE_PATH1])
	{
	}
	else
	{
		if(x == 355) // left door
		{
			UI_play_music(45);
			gflags[DICE_PATH1] = true;
			UI_set_item_flag(AVATAR, DONT_MOVE);
			UI_si_path_run_usecode(AVATAR, [355, 250], SCRIPTED, AVATAR, Path_Left_Door_1, 0);
		}
		else if (x == 363) // right door
		{
			if(gflags[DICE_ROLLED])
			{
			}
			else
			{
				UI_play_music(45);
				gflags[DICE_PATH1] = true;
				UI_set_item_flag(AVATAR, DONT_MOVE);
				UI_si_path_run_usecode(AVATAR, [362, 250], SCRIPTED, AVATAR, Path_Right_Door_1, 0);
			}
		}
	}


}