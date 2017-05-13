/*
Ice troll servant to the icewitch
*/

void Ice_Troll_Servant object#(0x587) ()
	{

var bark = "Mes smash you if mistress commands";
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
				UI_item_say(item, "");
			else if (n == 2)
				UI_item_say(item, "");
			}
		}
if (event == DOUBLECLICK)
{

script AVATAR
{
    actor frame STAND;
    say bark_intro;
    wait 10;
    wait 5;
    say "I will just be going...";
}
    script item
    {
        wait 5;
        say bark;
        wait 8;
    }
    // avatar's script here
    abort;
}
}
