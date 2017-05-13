/*

Chicky Dew the Orphan

*/

void Chicky object#(0x538) ()
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
			UI_item_say(item, "Dewak!!");
		else if (n == 2)
			UI_item_say(item, "Chicky Dew!");
		return;
		}

	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (UI_get_item_flag(item, MET)) 
	{
	say("@Hewwo@");
	UI_remove_answer("Name");
	}
else
	{
	say("@hi I like pie.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@catch me catch me.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Chicky!@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I play tag! You are it!@");
			UI_remove_answer("Job");
			UI_add_answer("You are it");
			}
		else if (response == "You are it")
			{
			say("@No you are!@");
			
			UI_remove_answer("You are it");
			UI_add_answer("You are annoying");
			}
		else if (response == "You are annoying")
			{
			say("@waaahh you are a big poopoo head.@");
			break;
			}

		}
	UI_remove_npc_face(item);
	}

