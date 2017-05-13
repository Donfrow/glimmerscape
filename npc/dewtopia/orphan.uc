/*

Orphan

*/

void Orphan object#(0x539) ()
	{

var bark = "Are you here to take me away?";
var bark_intro = "Hail child";

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
				UI_item_say(item, "Catch me catch me");
			else if (n == 2)
				UI_item_say(item, "Weee");
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
        call Orphan, TALK;
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
	say("@Yyou again you again.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@hi I like pie.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@I want my daddy.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I have no name.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I live here and play with the other orphans.@");
			UI_remove_answer("Job");
			UI_add_answer("Orphans");
			}
		else if (response == "Orphans")
			{
			say("@Patterson takes care of us!@");
			
			UI_remove_answer("Orphans");
			UI_add_answer("Patterson");
			}
		else if (response == "Patterson")
			{
			say("@He is an old grouchy man who does not like to have fun.@");
			UI_remove_answer("Patterson");
			}

		}
	UI_remove_npc_face(item);
	}
}
