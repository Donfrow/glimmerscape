

void Avatar_Lynel_Comment()
{
	script AVATAR
	{
		say "Hardass...";
	}
	UnFreezeAvatar_NonScript();
}


void Avatar_Path_Out_of_Kitchener object#()()
{
UI_si_path_run_usecode(AVATAR, [2247, 552], SCRIPTED, AVATAR, Avatar_Lynel_Comment, 0);
}



void Remove_Avatar_From_Kitchen()
{
	var loc = get_object_position(AVATAR);
	UI_show_npc_face(399);
	say("@Hey you, get out of my kitchen!@");
	script AVATAR
	{
		nohalt;
		wait 4;
		call Avatar_Path_Out_of_Kitchener;
	}
	// The below is not being called for some reason so had to do a script block
	//UI_si_path_run_usecode(AVATAR, [2247, 552], SCRIPTED, AVATAR, Avatar_Lynel_Comment, 1);	


	
}

void egg_mr_frumps object#()()
{

	var loc = get_object_position();
	var loc2 = get_object_position(-489);
	var toy_on_egg = loc->find_nearby(MR_FRUMPS, 25, MASK_NONE);
	var toy_in_inventory = UI_count_objects(PARTY, MR_FRUMPS, ANY, ANY);
	if(toy_on_egg || toy_in_inventory > 0)
	{
		if(gflags[PICKED_UP_TOY])
		{
		}
		else
		{
			var lynel_tend_shop = UI_get_schedule_type(-489);
			if(lynel_tend_shop == TEND_SHOP)
			{
				FreezeAvatar_NonScript();		
				UI_si_path_run_usecode(AVATAR, [2234, 0552], SCRIPTED, AVATAR, Remove_Avatar_From_Kitchen, 0);
				
				var toy1 = loc->find_nearby(MR_FRUMPS, 255, MASK_NONE);
				var toy2 = UI_count_objects(PARTY, MR_FRUMPS, ANY, ANY);
				
				UI_remove_item(toy1);
				UI_remove_item(toy2);
				UI_remove_party_items(1, 1515, ANY, ANY); // MR FRUMPS is 1515
				
				UI_create_new_object(MR_FRUMPS);
				UI_update_last_created([2235, 556, 2]);
			}
			else
			{
				AVATAR.say("@Sleep well Lynel...@");
				gflags[PICKED_UP_TOY] = true;
			}
		}
	}
}