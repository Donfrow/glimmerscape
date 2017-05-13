/*

Orphan3

*/

void Orphan3 object#(0x53a) ()
	{

var bark = "Hello big person";
var bark_intro = "Hello child";

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
				UI_item_say(item, "Weeee");
			else if (n == 2)
				UI_item_say(item, "Teehee zoom");
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
        call Orphan3, TALK;
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
	say("@Have you come to take me away?@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Have you come to take me away?@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Don't leave me!@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I do not remember anymore I am just referred to as Orphan.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@To live in the orphanage.@");
			UI_remove_answer("Job");
			UI_add_answer("Orphanage");
			}
		else if (response == "Orphanage")
			{
			say("@I live in the orphanage with the other orphans. It is run by a grouchy old man Patterson.@");
			
			UI_remove_answer("Orphanage");
			UI_add_answer("Old man Patterson");
			}
		else if (response == "Old man Patterson")
			{
			say("@He takes care of us but he is always grouchy and not very fun. He yells and complains too much!@");
			UI_remove_answer("Old man Patterson");
			}

		}
	UI_remove_npc_face(item);
	}
}
