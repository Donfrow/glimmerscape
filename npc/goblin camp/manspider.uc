/*
Manspider with the orb
*/

void Manspider object#(0x434)()
	{

var bark = "You look tasty";
var bark_intro = "Abomination!";

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
				UI_item_say(item, "Hiss");
			else if (n == 2)
				UI_item_say(item, "Crunch");
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
        call Manspider, TALK;
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
	say("Face me once again you will.");
	}
else
	{
	say("Prepare to meet thy doom.");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	
if (gflags[MAN_SPIDER_HAS_ORB])
{
UI_add_answer("Orb of Transfiguration");
}


		converse
		{
	if (response == "Bye")
			{
			say("You will be a lovely meal.");
			AttackAvatar();
			break;
			}
		else if (response == "Name")
			{
			say("My name is not important. What is important is my next meal.");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("I serve the goblins, just as you will serve me as a meal.");
			UI_remove_answer("Job");
			}
		else if (response == "Orb of Transfiguration")
			{
			say("The orb, the orb! You will not get the orb! Prepare to be eaten!");
			AttackAvatar();
			break;
			}


		}
	UI_remove_npc_face(item);
	}
}
