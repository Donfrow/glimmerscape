/*

Pirates at the southern mountains

*/

void Pirate1 object#(0x556) ()
	{

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{		// Sleeping.
			UI_item_say(item, "Zzz");
			
			return;
			}
		var n = UI_get_random(4);// 1-2.
		if (n == 1)
			UI_item_say(item, "Much booty is to be had");
		else if (n == 2)
			UI_item_say(item, "Arrrr");
		else if (n == 3)
			UI_item_say(item, "Shiver me timbers");
		else if (n == 4)
			UI_item_say(item, "Yarg");

		return;
		}

	UI_show_npc_face(item);


		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (UI_get_item_flag(item, MET)) 
	{
	say("@Arrr.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Arr ye are not a pirate!@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	


		converse
		{
	if (response == "Bye")
			{
			say("Arrrrr thou will now be slain.");
			UI_set_alignment(-343, 2);
			UI_set_alignment(-344, 2);
			UI_set_alignment(-345, 2);

			UI_set_opponent(-343, AVATAR);
			UI_set_opponent(-344, AVATAR);
			UI_set_opponent(-345, AVATAR);

			UI_set_schedule_type(-343, IN_COMBAT);
			UI_set_schedule_type(-344, IN_COMBAT);
			UI_set_schedule_type(-345, IN_COMBAT);

			break;
			}
		else if (response == "Name")
			{
			say("@My name is not important.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@To sail the seas and take booty. Now, tis time to take yours ye land lubber.@");
			UI_remove_answer("Job");
			UI_set_alignment(-343, 2);
			UI_set_alignment(-344, 2);
			UI_set_alignment(-345, 2);

			UI_set_opponent(-343, AVATAR);
			UI_set_opponent(-344, AVATAR);
			UI_set_opponent(-345, AVATAR);

			UI_set_schedule_type(-343, IN_COMBAT);
			UI_set_schedule_type(-344, IN_COMBAT);
			UI_set_schedule_type(-345, IN_COMBAT);

			break;
			}

		


		}
	UI_remove_npc_face(item);
	}
