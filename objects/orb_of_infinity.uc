void orb_of_infinity shape#(1379)()
{

var loc = get_object_position(AVATAR);

    if (event == DOUBLECLICK)
    {
		if(loc[1] >= 929 && loc[2] >= 290 && loc[1] <= 1008 && loc[2] <= 349)
		{
			if(gflags[FINAL_ICE_AREA])
			{
				UI_close_gumps();
				UI_set_item_flag(AVATAR, DONT_MOVE);
				script AVATAR
				{
					call Remove_All_Party_Members;
				}
				UI_si_path_run_usecode(AVATAR, [961, 320, 0], SCRIPTED, AVATAR, Avatar_Infinity_Beginning, 0);
			}
		}
		else
		{		
			UI_close_gumps();
			UI_earthquake(15);
			script AVATAR
			{
				say "It is highly unstable";
			}
		}
    }
}

