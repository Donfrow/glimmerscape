/*

Trainee Otoole

*/

void Otoole object#(0x533) ()
	{

var bark = "Yes?";
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
				UI_item_say(item, "Hail Lord Dew");
			else if (n == 2)
				UI_item_say(item, "For Dewtopia!");
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
        call Otoole, TALK;
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
			say("@Trainee Otoole reporting sir");
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
			say("@I will make Hectar proud sir! I will be a strong and noble warrior sir!@");
			say("@I will not let Dewtopia down when my training is complete sir!@");
			UI_remove_answer("Fine knight");
			UI_add_answer("Training");
			}
		else if (response == "Training")
			{
			say("@I entered into training to defend against the goblin hordes sir!@");
			UI_remove_answer("Training");
			UI_add_answer("Goblin hordes");
			}
		else if (response == "Goblin hordes")
			{
			say("@They constantly attack Dewtopia and breed like rabbits sir! Dewtopia needs all the help it can get to defend such a fine city sir!@");
			UI_remove_answer("Goblin hordes");
			}

		}
	UI_remove_npc_face(item);
	}
}
