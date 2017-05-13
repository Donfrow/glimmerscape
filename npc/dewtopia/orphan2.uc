/*

Orphan2

*/

void Orphan2 object#(0x540) ()
	{

var bark = "Hello!";
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
				UI_item_say(item, "Teehee");
			else if (n == 2)
				UI_item_say(item, "Zoom zoom");
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
        call Orphan2, TALK;
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
	say("@You again you again@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Hi!@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@I want my mommy.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am just orphan.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I live here and run around and due other fun things.@");
			UI_remove_answer("Job");
			UI_add_answer("Fun things");
			}
		else if (response == "Fun things")
			{
			say("@I draw and play tag and run around!@");
			
			UI_remove_answer("Fun things");
			UI_add_answer("That does not sound fun");
			}
		else if (response == "That dos not sound fun")
			{
			say("@Waaaaah you are mean.@");
			break;
			}

		}
	UI_remove_npc_face(item);
	}
}

