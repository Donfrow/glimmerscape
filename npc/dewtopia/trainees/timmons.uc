/*

Trainee Timmons

*/

void Timmons object#(0x536) ()
	{

var bark = "Yes sir";
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
				UI_item_say(item, "For Dewtopia!");
			else if (n == 2)
				UI_item_say(item, "Long live Lord Dew!");
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
        call Timmons, TALK;
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
			say("@Sir yes sir!");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Trainee Timmons reporting sir.@");
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
			UI_add_answer("Fine warrior");
			}
		else if (response == "Fine warrior")
			{
			say("@I hope to be a fine warrior sir!");
			UI_remove_answer("Fine warrior");
			UI_add_answer("Hope?");

			}
		else if (response == "Hope?")
			{
			say("@Slip of the tongue sir! I will become a fine warrior sir!@");
			UI_remove_answer("Hope?");
			UI_add_answer("You can confide in me");
			}
		else if (response == "You can confide in me")
			{
			say("@To be honest sir I am not sure I am cut out to be a warrior for Dewtopia sir! I am not sure if I can pass the final task sir!@");
			UI_remove_answer("You can confide in me");
			UI_add_answer("You art a baby!");
			UI_add_answer("Final task");
			}
		else if (response == "Final task")
			{
			say("@I do not know what it is exactly sir but it is rumored to involve a cyclops.@");
			say("@I have spoken to much sir! I must end this conversation.@");
			break;
			}
		else if (response == "You art a baby!")
			{
			say("@That is mean and makes me cry! Waaaah!");
			break;
			}

		}
	UI_remove_npc_face(item);
	}
}
