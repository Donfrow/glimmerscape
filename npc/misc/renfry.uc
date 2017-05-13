/*
Renfry in the cremotorium
*/


void Renfry object#(0x449) ()
	{

var has_soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);
var has_infinity_orb = UI_count_objects(PARTY, ORB_OF_INFINITY, ANY, ANY);

var bark = "Ugggh";
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
				UI_item_say(item, "Ugggh");
			else if (n == 2)
				UI_item_say(item, "Ungh");
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
        call Renfry, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

say("@Uuggghh.@");


if(has_soul_orb >0 || has_infinity_orb > 0)
	{

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Uuuuggghh.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Ugh... Renfry...@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@Tombs protect... uggghh... watch over royal tombs...@");
			
			/* THIS IS FOR WHEN YOU NEED TO FIND AKAKOTHEN
			if (gflags[])
				{
				}
			*/
			UI_remove_answer("Job");
			UI_add_answer("Tombs");

			}
		else if (response == "Tombs")
			{
			say("@Royal tombs... uggh, Ophidians... protect the bodies of the lords...@");
			UI_remove_answer("Tombs");
			UI_add_answer("Ophidians");
			}
		else if (response == "Ophidians")
			{
			say("@This land... ugh... Ophidian empire once lay...@");
			UI_remove_answer("Ophidians");
			}
		}

	}

else
	{
	AVATAR.say("@If only we had an object which let us speak with the dead.@");
	}
	UI_remove_npc_face(item);
	}
}
