/*

Sailor loitering around Medina

*/


void Livesey object#(0x565) ()
	{

var bark = "Arrr";
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
				UI_item_say(item, "I care not for the land");
			else if (n == 2)
				UI_item_say(item, "The sea is where I belong");
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
        call Livesey, TALK;
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
		say("@Why do ye pester me over and over?@");
		UI_remove_answer("Name");
	}
else
	{

		say("@What?");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

converse
{
    if (response == "Bye")
    {
        say("@Ye not be missed.@");
        break;
    }
    else if (response == "Name")
    {
        say("@Livesey and we be leavin' it at that.@");
    }
    else if (response == "Job")
    {
        if (gflags[LECHUCK_DEAD])
        {
            say("@I be waiting for someone to pick me up for some sailing... and that not be ye. Be on yer way before I make ye be on yer way.@");
            break;
        }
        else
        {
            say("@I be sitting around town with ye land folk until some good ships will sail again. May I add that I do not enjoy talking to them? Now scram!@");
            break;
        }
        UI_remove_answer("Job");
    }

}


	
	UI_remove_npc_face(item);
	}
}
