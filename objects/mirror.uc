void Move_Avatar_Good_Test_Corrupt object#()()
{
	UI_move_object(AVATAR, [952, 1353, 0, 1]);
}

void Move_Avatar_Bad_Test_Corrupt object#()()
{
	UI_move_object(AVATAR, [571, 2615, 0, 2]);
}

void mirror shape#(1354)()
{
    if (event == DOUBLECLICK)
    {
        if(gflags[LEFT_KARMA_TEST])
        {
			if(gflags[ENTER_GOOD_MIRROR])
			{
				if(gflags[FINISHED_CORRUPT_GOOD_TEST])
				{
				}
				else
				{
					gflags[IN_GOOD_TEST] = true;
					script AVATAR
					{
						nohalt;
						call Remove_All_Party_Members;
						call Fade;
						wait 4;
						call Move_Avatar_Good_Test_Corrupt;
						actor frame STAND;
						face SOUTH;
						wait 4;
						call Teleport_In_Sound;
						call UnFade;
					}
				}
			}
			// SET BAD MIRROR ENTER HERE LATER
			else if(gflags[ENTER_BAD_MIRROR])
			{
				if(gflags[FINISHED_CORRUPT_BAD_TEST])
				{
				}
				else
				{
					gflags[IN_BAD_TEST] = true;
					script AVATAR
					{
						nohalt;
						call Remove_All_Party_Members;
						call Fade;
						wait 4;
						call Move_Avatar_Bad_Test_Corrupt;
						actor frame STAND;
						face EAST;
						wait 4;
						call Teleport_In_Sound;
						call UnFade;
					}
				}
			}
        }
        else
        {
			if(gflags[KARMA_TEST_EVIL])
	        {
	            var facing = EAST;
	            GenericPaletteFade(facing);
	            UI_move_object(AVATAR, [840, 2984, 0, 2]);
				UI_set_item_flag(AVATAR, BLINKER_DISABLED);
				script AVATAR
				{
					nohalt;
					call Teleport_In_Sound;
					call Remove_All_Party_Members;
				}
	        }
	        else if (gflags[KARMA_TEST_GOOD])
	        {
	            var facing = SOUTH;
	            GenericPaletteFade(facing);
	            UI_move_object(AVATAR, [887, 2817, 0, 2]);
				UI_set_item_flag(AVATAR, BLINKER_DISABLED);
				script AVATAR
				{
					nohalt;
					call Teleport_In_Sound;
					call Remove_All_Party_Members;
				}
	        }
		}
    }
}

