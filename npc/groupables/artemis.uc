/*
Artemis Batbane - need his head for the dragon to get orb of persuasion
*/


void Artemis object#(0x530) ()
	{

var fake_scroll = UI_count_objects(PARTY, GOOD_SCROLL, 69, ANY);



	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
			}
		else
			{
			if (inParty(-304))
			{
            }
            else
            {
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Sometimes I long for the simple life");
			else if (n == 2)
				UI_item_say(item, "It is nice to be home");
            }
			}
		}
	if (event != 1)
		return;
	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (UI_get_item_flag(item, MET)) 
	{
		say("@What brings you back?@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Greetings stranger.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


if (gflags[SEARCH_FOR_ARTEMIS] && UI_get_item_flag(item, MET)) // After talking to Severilious
{
	UI_add_answer("I need you to come with me");
}

		converse
		{

	if (response == "Bye")
			{
			say("@Safe travels. Watch out for bandits and goblins.@");
			break;
			}
		else if (response == "Name")
			{
			say("@You may call me Artemis Batbane.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am a Dragon Slayer, though at this moment I am taking some much needed time off to be with my wife.@");
			UI_remove_answer("Job");
			UI_add_answer("Dragon slayer");
			UI_add_answer("Wife");

			if (gflags[SEARCH_FOR_ARTEMIS]) // After talking to Severilious
				{
				UI_add_answer("I need you to come with me");
				}
			}
		else if (response == "Wife")
			{
			say("@Kylith is such a wonderful woman. She stays with me even though I travel the lands so often. I am lucky to have a woman like her.@");
			UI_remove_answer("Wife");
			}
		else if (response == "Dragon slayer")
			{
			say("@Well, I do not only slay dragons but that is what I am best known for. I have yet to meet a dragon that can survive an encounter with me.@");
			UI_remove_answer("Dragon slayer");
			}
		else if (response == "I need you to come with me")
			{

			if (fake_scroll > 0) // Need to go to Kintore to have Brene make the fake scroll
				{
				say("@I see that you have papers from the Solusek Mining Company. Just as I was beginning to enjoy my time off as well. Very well, take me to the operation.@");
				UI_add_to_party(-304);
				UI_clear_item_flag(-304, 29);
				UI_remove_answer("I need you to come with me");
				gflags[SEARCH_FOR_ARTEMIS] = false;
				}
			else
				{
				say("@I am sorry but I will not leave unless you have papers from the Solusek Mining Company. I am on their payroll right now and will not be tricked into doing free work for competitors.@");
				UI_remove_answer("I need you to come with me");
				gflags[FAKE_SCROLL] = true;
				}
			
			}
		}
	UI_remove_npc_face(item);
	}

