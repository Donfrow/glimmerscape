/*

Trainee Smithington

*/

void Smithington object#(0x532) ()
	{

var bark = "Please be brief, I must continue my training";
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
				UI_item_say(item, "I will fight to the end!");
			else if (n == 2)
				UI_item_say(item, "All hail Lord Dew");
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
        call Smithington, TALK;
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
	say("@Yes sir?@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Yes sir?@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Sir yes sir!");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Trainee Smithington reporting sir.@");
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
			UI_remove_answer("Fine knight");
			UI_add_answer("Strong and noble warrior");
			}
		else if (response == "Strong and noble warrior")
			{
			say("@Dewtopia deserves to have only the best defenders of its honour sir. I will make Dewtopia proud by the time my training is complete.@");
			UI_remove_answer("Strong and noble warrior");
			}

		}
	UI_remove_npc_face(item);
	}
}
