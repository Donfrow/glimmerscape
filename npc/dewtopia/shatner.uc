/*
William Shatner
*/

void Shatner object#(0x428)()
	{
var n = UI_get_random(2);// 1-2.

var bark = "Something...";
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
				UI_item_say(item, "Where are all the green women?");
			else if (n == 2)
				UI_item_say(item, "Scotty?");
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
        call Shatner, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

	UI_show_npc_face(item);
if (n == 1) 
	{
	say("@KHAAAAAAAAAAAN!@");
	UI_set_item_flag(item, MET, true);
	}
else
	{
say("@There's@");
	say("@Something on the wing.@");
	say("@Some@");
	say("@Thing@");
	say("@Is on the wing.@");
	UI_set_item_flag(item, MET, true);
	}

	UI_remove_npc_face(item);
	}
}
