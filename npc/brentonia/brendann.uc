/*
Brendann in Brentonia
*/


void Brendann object#(0x496) ()
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
				UI_item_say(item, "No trouble yet");
			else if (n == 2)
				UI_item_say(item, "It is a calm day");
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
        call Brendann, TALK;
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
		say("@What do you desire of me?");
		UI_remove_answer("Name");

	}
else
	{

		say("@Greetings, and I will only say this once. Stay out of trouble.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Continue to remain lawful and we shall get along fine.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Guard Brendann, at your service.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am one of the guards here in Brentonia. I partrol the inner city and ensure that everything is going well.@");
            UI_remove_answer("Job");
            UI_add_answer("Inner city");
            UI_add_answer("Brentonia");
        }
        else if (response == "Brentonia")
        {
            say("@It is the city in which you are in! Did you get lost and simply end up here somehow?@");
            UI_remove_answer("Brentonia");
            UI_add_answer("Lost");
        }
        else if (response == "Lost")
        {
            say("@I was attempting to insult you, but apparantly you are too daft to pick up on it. It is amazing the people they let into the city sometimes.@");
            UI_remove_answer("Lost");
            UI_add_answer("People");
        }
        else if (response == "People")
        {
            say("@All I have to say to that is look into a mirror.@");
            UI_remove_answer("People");
        }
        else if (response == "Inner city")
        {
            say("@The inner city is the main portion of Brentonia. To be honest, there is not much of an outer city, so I am not sure why this is referred to as the inner one.@");
            UI_remove_answer("Inner city");
        }

		}
	UI_remove_npc_face(item);
	}
	}
