void Leave_Theodora_House_Diseased()
{
	if(gflags[HAD_RELATIONS])
	{
		if(gflags[KILL_THEODORA_EGG])
		{
		}
		else
		{
			UI_set_item_flag(AVATAR, POISONED);
			
			gflags[KILL_THEODORA_EGG] = true;
			var party = UI_get_party_list();			
			var cnt = UI_get_array_size(party);

			if (cnt == 1)
			{
				UI_set_npc_prop(AVATAR, INTELLIGENCE, -1);
				script AVATAR
				{
					say "I do not feel so good";
					actor frame KNEEL;
					wait 4;
					actor frame STAND;
					wait 3;
					say "I should see a healer";
				}
			}
			else
			{
				UI_set_npc_prop(AVATAR, INTELLIGENCE, -1);
			    var rand = UI_die_roll(2, cnt);
				var npc = party[rand];
				
				script AVATAR
				{
					say "I do not feel so good";
					actor frame KNEEL;
					wait 4;
					actor frame STAND;			
				}
				
				script npc
				{
					wait 10;
					say "You should see a healer";
				}
			}
		}
	}
}