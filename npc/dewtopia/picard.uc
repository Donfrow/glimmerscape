/*
Picard in the crazy house
*/

void Picard object#(0x42a)()
	{
var n = UI_get_random(2);// 1-2.

var bark = "I do tend to ramble on";
var bark_intro = "Sir";

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
				UI_item_say(item, "Make it so");
			else if (n == 2)
				UI_item_say(item, "Engage");
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
        call Picard, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

	UI_show_npc_face(item);
if (n == 1) 
	{
	say("@There are four lights!@");
	UI_set_item_flag(item, MET, true);
	}
else
	{
	say("@The line must be drawn here!@");
	UI_set_item_flag(item, MET, true);
	}

	UI_remove_npc_face(item);
	}
}
