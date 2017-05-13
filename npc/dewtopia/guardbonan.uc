/*
Guard Bonan west gate of dewtopia
*/

void GuardBonan object#(0x476) ()
	{

var bark = "State your business";
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
				UI_item_say(item, "North East South West");
			else if (n == 2)
				UI_item_say(item, "Goblins shall not enter this city");
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
        call GuardBonan, TALK;
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
		
if (UI_get_schedule_type(118) == PACE_VERTICAL)
{
    UI_add_answer("Open gate");
}

if (UI_get_item_flag(item, MET)) 
	{
		say("@What can I do for you?@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Halt - what do you want?@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{
        if (response == "Bye")
        {
            say("@Slay a goblin.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Guard Bonan.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@Are you truely that daft? I am a guard.@");
            UI_remove_answer("Job");
        }
        else if (response == "Open gate")
        {
            say("@Very well. Stand back.@");
            var winch = UI_find_nearest(118, 949, 10);
            UI_si_path_run_usecode(118, [1597, 1730, 0], 0, winch, DOUBLECLICK, true);
            UI_remove_answer("Open gate");

        }

		}
	UI_remove_npc_face(item);
	}
	}

