/*
Ice goblin servant to the icewitch
*/

void Ice_Goblin_Servant object#(0x585) ()
	{

var bark = "Glumladoodlegrunka!";
var bark_intro = "Goblin";

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
				UI_item_say(item, "Grobbledunkle");
			else if (n == 2)
				UI_item_say(item, "Fragglerock");
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
    say "It does not speak common";
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
