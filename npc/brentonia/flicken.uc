/*
Flicken the guard in Brentonia
*/


void Flicken object#(0x450) ()
	{

var bark = "Ten-hut!";
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
				UI_item_say(item, "Hut two three four");
			else if (n == 2)
				UI_item_say(item, "Standy ready");
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
        call Flicken, TALK;
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
		say("@What is your business?@");
		UI_remove_answer("Name");

	}
else
	{

		say("@State your business.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Do not cause trouble.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am Flicken.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I guard the gate to inner Brentonia.@");
            UI_remove_answer("Job");
            UI_add_answer("Inner Brentonia");
        }
        else if (response == "Inner Brentonia")
        {
            say("@It is the city which you are at of course. It is one of the main kingdoms of these lands. But you should ask others about this. I must get back to my duties.@");
            break;
        }

		}
	UI_remove_npc_face(item);
	}
}
