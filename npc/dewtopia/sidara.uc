/*

Sidara - Wife farmer in Dewtopia

*/
void Sidara object#(0x52c) ()
	{

var bark = "Hello there";
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
				UI_item_say(item, "Tolsar is my love");
			else if (n == 2)
				UI_item_say(item, "Thank Lord Dew for such a city");
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
        call Sidara, TALK;
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
	say("@You wish to speak with me again?@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to our farm!@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Have a wonderful day!@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Sidara good sir.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I tend this farm with my husband Tolsar.@");
			UI_remove_answer("Job");
			UI_add_answer("Tolsar");
			UI_add_answer("Farm");
			}
		else if (response == "Tolsar")
			{
			say("@He is my love and co-owner of this farm.@");
			UI_remove_answer("Tolsar");
			}
		else if (response == "Farm")
			{
			say("@This farm provides Lord Dew with the finest and freshest produce without fear of Goblins or Bandits.@");
			UI_remove_answer("Farm");
			UI_add_answer("Goblins");
			UI_add_answer("Bandits");
			}
		else if (response == "Goblins")
			{
			say("@Large, green and ugly is how I would describe them! If you venture outside the walls beware of them for they will eat you while you still live!@");
			UI_remove_answer("Goblins");
			}
		else if (response == "Bandits")
			{
			say("@A petty annoyance to those of us in Dewtopia. I would not concern yourself with them.@");
			UI_remove_answer("Bandits");
			}

		}
	UI_remove_npc_face(item);
	}
}
