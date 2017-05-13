/* BANDITS
*/


void Bandit object#(0x51e) ()
	{

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{		// Sleeping.
			UI_item_say(item, "Zzzz...");
			
			return;
			}
		var n = UI_get_random(2);// 1-2.
		if (n == 1)
			UI_item_say(item, "..gold..");
		else if (n == 2)
			UI_item_say(item, "I am watching you");
		return;
		}

	UI_show_npc_face(item);
	UI_set_item_flag(item, MET, true);
	say("@Speak with Geth.@");
	
	UI_remove_npc_face(item);
	}

