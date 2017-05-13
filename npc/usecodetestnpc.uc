/*

Usecode Test NPC

*/


void Usecodetestnpc object#(0x4eb) ()
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
			UI_item_say(item, "");
		else if (n == 2)
			UI_item_say(item, "");
		return;
		}

UI_show_npc_face(item);
		
UI_add_answer("Name");
UI_add_answer("Bye");

UI_add_answer("Set gflag 250 to true");

UI_add_answer("Check gflag 250");

converse
{
    if (response == "Bye")
    {
        say("Ending.");
        break;
    }
    else if (response == "Name")
    {
        say("Usecode Test NPC.");
        UI_remove_answer("Name");
    }
	else if (response == "Set gflag 250 to true")
	{
		say("@Set to true.@");
		gflags[250] = true;
		UI_remove_answer("Set gflag 250 to true");
	}
	else if (response == "Check gflag 250")
	{
		if(gflags[250])
		{
			say("True");
		}
		else
		{
			say("False");
		}
		UI_remove_answer("Check gflag 250");
	}

}


	
	UI_remove_npc_face(item);
	}


