/*
Gabbie Mardoddle head of the Solusek Mining Company
*/


void Gabbie object#(0x4bf) ()
	{

var flanwald_head = UI_count_objects(PARTY, BODY_PARTS, 1, 5);

var bark = "What do you want?";
var bark_intro = "Hail";

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
			}
		else
			{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Profits are nice this quarter");
			else if (n == 2)
				UI_item_say(item, "Operations are at an all time high");
			}
		}

if (event == DOUBLECLICK)
{

script AVATAR
{
    actor frame STAND;
    say bark_intro;
    wait 10;
}
    script item
    {
        wait 5;
        say bark;
        wait 8;
        call Gabbie, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@You again?@");
	}
else
	{

	say("@What do you want of me?@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag


// Check if you have flanwald's head in your party

if (gflags[QUEST_FOR_MOLTEN_CLOAK])
{
    UI_add_answer("Molten Cloak");
}



		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Yes, yes, bye.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Gabbie Mardoddle.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@Ha! I am the head of the Solusek Mining Company. Now, what business do you have with me?@");
			UI_remove_answer("Job");
			UI_add_answer("Solusek Mining Company");
			UI_add_answer("Business");
			}
		else if (response == "Solusek Mining Company")
			{
			say("@If you do not know what the Solusek Mining Company is I am not sure why you are asking me. If you truely want to know go ask the receptionist.@");
			UI_remove_answer("Solusek Mining Company");	
			}

		else if (response == "Business")
			{
			say("@Yes, that is what I said. What business do you have with me?@");
			UI_remove_answer("Business");
				// Check if you have flanwald's head in your party

				if (gflags[FLANWALD_BOUNTY]) // If you already have been given admittance
					{
					UI_add_answer("Collect on Bounty");
					}
				else
					{
					UI_add_answer("Nothing I suppose");
					}
						
			}

		else if (response == "Collect on Bounty")
			{

			if (flanwald_head > 0)
				{
				say("@I see you have brought that incompetant boobs head. Lovely, I shall have it put on my wall.@");
				say("@Take this note to Captain Bignubble outside of my office, he will provide you with payment.@");
				UI_add_party_items(1, 797, 66, 2); // Adds scroll to get gold
				UI_remove_party_items(1, 799, 1, 5); // Removes the head
				UI_remove_answer("Collect on Bounty");
				}
			else
				{
				say("@Well, I am glad to hear that Flanwald has been dealt with, but I will not pay a bounty unless you bring me his head.@");
				UI_remove_answer("Collect on Bounty");
				}
			
			
			}
		else if (response == "Nothing I suppose")
			{
			say("@Then please leave me be.@");
			break;
			}
        else if (response == "Molten Cloak")
        {
            say("@I am not quite sure why I would discuss such matters with you... therefore I will not. Begone.@");
            break;
        }

		}
	UI_remove_npc_face(item);
	}
}
