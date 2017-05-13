/*

Guard of the bar in Brentonia

*/


void Rackon object#(0x4ee) ()
	{

var bark = "Do not cause trouble";
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
				UI_item_say(item, "Stay out of trouble");
			else if (n == 2)
				UI_item_say(item, "I am watching you");
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
        call Rackon, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

        UI_show_npc_face(item);
if (UI_get_item_flag(item, MET))
	{
		say("@Please, be brief. I must stay on guard.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Halt, what do you wish of me?");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


converse
{
    if (response == "Bye")
    {
        say("@Stay out of trouble.@");
        break;
    }
    else if (response == "Name")
    {
        say("@Rackon.@");
        UI_remove_answer("Name");
    }
    else if (response == "Job")
    {
        say("@I guard the pub here in Brentonia. If you wish to avoid a conflict with me then cause no problems and we shall be fine.@");
        UI_remove_answer("Job");
        UI_add_answer("Pub");
    }
    else if (response == "Pub")
    {
        say("@It is run by Lucilla.@");
        UI_remove_answer("Pub");
    }


}


	
	UI_remove_npc_face(item);
	}
}
