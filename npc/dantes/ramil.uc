/*
Ramil - Guard at Dante's outpost
*/

void Ramil object#(0x4c7) ()
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
				UI_item_say(item, "Do not cause trouble");
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
        call Ramil, TALK;
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
		say("@Continue to keep out of trouble and we shall have no problems.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Keep out of trouble and we shall have no problems.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{

	if (response == "Bye")
			{
			say("@I am watching you.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Ramil, and do not forget it.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I keep trouble makers from causing trouble here at the trading post. If you are here to cause trouble, then we will have a problem.@");
			UI_remove_answer("Job");
			UI_add_answer("Trading Post");
			UI_add_answer("Trouble");

			}
		else if (response == "Trading Post")
			{
            say("@You are at Dante's Trading Post.@");
			UI_remove_answer("Trading Post");
			}
        else if (response == "Trouble")
            {
            say("@Their are no laws here but I am ready to deal with any trouble makers. Do not expect a trial or any other process if you decide to cause trouble.@");
            UI_remove_answer("Trouble");

            }

		}
	UI_remove_npc_face(item);
	}
}
