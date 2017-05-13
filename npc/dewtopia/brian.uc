/*

Trainee Brian

*/

void Brian object#(0x535) ()
	{

var bark = "Hail";
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
				UI_item_say(item, "For Dewtopia");
			else if (n == 2)
				UI_item_say(item, "I shall do my best");
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
        call Brian, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (UI_get_item_flag(item, MET)) 
	{
	say("@Yes sir?");
	UI_remove_answer("Name");
	}
else
	{
	say("@Yes sir?");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Sir yes sir!@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Trainee Brian reporting sir");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@To become a fine knight of Dewtopia sir!@");
			UI_remove_answer("Job");
			UI_add_answer("Fine knight");
			}
		else if (response == "Fine knight")
			{
			say("@I will not let Dewtopia down sir! I will be a strong and noble warrior sir!@");
			UI_remove_answer("Fine knight");
			UI_add_answer("Dewtopia");
			}
		else if (response == "Dewtopia")
			{
			say("@The fine city that you are in is Dewtopia sir! It needs defenders to hold off the goblin hordes and other dangers it may face sir!@");
			UI_remove_answer("Dewtopia");
			UI_add_answer("Goblin hordes");
			UI_add_answer("Other dangers");
			}
		else if (response == "Goblin hordes")
			{
			say("@A green menance which wishes Dewtopia to be a pile of rubble sir! My fellow trainees and I will not let that happen sir!@");
			UI_remove_answer("Goblin hordes");
			}
		else if (response == "Other dangers")
			{
			say("@Dewtopia faces other dangers sir! The Plains Bandits are one of them sir! I look forward to eradicating that menace sir!@");
			UI_remove_answer("Other dangers");
			UI_add_answer("Plains Bandits");
			}
		else if (response == "Plains Bandits")
			{
			say("@They are a scruffy bunch which pray on the weak and feable sir! After the goblin threat is dealt with I hope to aid in ridding the lands of them as well sir!@");
			UI_remove_answer("Plains Bandits");
			}

		}
	UI_remove_npc_face(item);
	}
	}
