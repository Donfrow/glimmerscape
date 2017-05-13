/*
 *	Zoo Keeper
 */

void ZooKeeper object#(0x56A) ()
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
			UI_item_say(item, "Damn Kids");
		else if (n == 2)
			UI_item_say(item, "Watch the bars");
		return;
		}
	if (event != 1)
		return;
	UI_show_npc_face(item);
	say("Welcome to the Zoo!");
	
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{
		if (response == "Bye")
			break;
		else if (response == "Name")
			{
			say("I'm JoeJoe the Zookeeper");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("I tend the Zoo");
			UI_add_answer("Zoo?");
			}
		else if (response == "Zoo?")
			{
			say("Brentonia’s Zoo has a wide variety of wildlife");
			UI_remove_answer("Zoo?");
			UI_add_answer("Wildlife?");
			}
		else if (response == "Wildlife?")
			{
			say("We have 4 different species currently! ",
			"A goblin, a gargoyle, a skinless woman, and a catman!");
			UI_remove_answer("Wildlife?");
			
			}

		else if(UI_get_item_flag(item, MET))
			{
			say("opoo");
			}
		}
	UI_remove_npc_face(item);
	}

