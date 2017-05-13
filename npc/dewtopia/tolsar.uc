/*

Tolsar - Farmer husband in Dewtopia

*/

void Tolsar  object#(0x52b) ()
	{

var bark = "What can I do for you?";
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
				UI_item_say(item, "Hail Lord Dew");
			else if (n == 2)
				UI_item_say(item, "Sidara is my love");
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
        call Tolsar, TALK;
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
	say("@Hello again");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to my farm");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@So long");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Tolsar.@");
			UI_remove_answer("Name");
			
			}
		else if (response == "Job")
			{
			say("@I tend Lord Dew's special fields along with my wife Sidara.@");
			UI_remove_answer("Job");
			UI_add_answer("Sidara");
			UI_add_answer("Special fields");
			}
		else if (response == "Sidara")
			{
			say("@She is my lovely wife who works the fields with me for our liege Lord Dew.@");
			UI_remove_answer("Sidara");
			}
		else if (response == "Special fields")
			{
			say("@Lord Dew derserves only the finest produce and these fields bring him such.@");
			say("@We tend to the crops without fear of bandits nor goblins and are always able to bring him a bountiful harvest.@");
			UI_remove_answer("Special fields");
			UI_add_answer("Goblins");
			UI_add_answer("Bandits");
			}
		else if (response == "Goblins")
			{
			say("@They continue to try and raid this great city, but the guards manage keep them back.@");
			UI_remove_answer("Goblins");
			}
		else if (response == "Bandits")
			{
			say("@Highway men, bandits, rogues, take your choice in name, they are all scum. They do not cause much of an issue for us though as we are behind the safety of the walls.@");
			UI_remove_answer("Bandits");
			}

		}
	UI_remove_npc_face(item);
	}
}


