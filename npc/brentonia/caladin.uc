/*
Caladin in Brentonia
*/


void Caladin object#(0x4ed) ()
	{

var bark = "Hail to you";
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
				UI_item_say(item, "Steady");
			else if (n == 2)
				UI_item_say(item, "Watch yourself");
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
        call Caladin, TALK;
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
		say("@Again we meet, what can I do for you?");
		UI_remove_answer("Name");

	}
else
	{

		say("@Welcome, stranger.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Watch yourself. I would not fancy having to hurt you.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am surprised you have not heard of me. I am Caladin.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the personal bodyguard to Lord Brent.@");
            UI_remove_answer("Job");
            UI_add_answer("Bodyguard");
            UI_add_answer("Lord Brent");
        }
        else if (response == "Bodyguard")
        {
            say("@It is my job to ensure that no trouble approaches my liege, and if it does, to make quick work of it.@");
			say("@So do not think that just because I am nice to you I would not strike you down if you were to try something.@");
            UI_remove_answer("Bodyguard");
        }
        else if (response == "Lord Brent")
        {
            say("@He is the founder of this city and a great ruler. It has prospered thanks to him. Not even Dewtopia is a rival to its greatness.@");
            UI_remove_answer("Lord Brent");
			UI_add_answer("Dewtopia");
        }
		else if (response == "Dewtopia")
		{
			say("@I suppose you could call it Brentonia's sister city to the south. It is a fair city but nothing compared to Brentonia in its sheer greatness.@");
			UI_remove_answer("Dewtopia");
		}

		}
	UI_remove_npc_face(item);
	}
}
