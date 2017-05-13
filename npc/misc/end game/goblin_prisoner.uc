/*
End game, Akokothan in Jail
*/


void Goblin_Prisoner object#(0x5fc) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Mukaladooma Murgamoo!";
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
				UI_item_say(item, "Dunlakurn buggu!");
			else if (n == 2)
				UI_item_say(item, "Tursanupum kurlanumbup!");
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
    }
    // avatar's script here
    abort;
}
	
	

}