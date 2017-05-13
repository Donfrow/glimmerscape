/*

Sailor loitering around Medina

*/


void Isabella object#(0x4c9) ()
	{

var bark = "What do ye want?";
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
				UI_item_say(item, "Do not be trying anything funny");
			else if (n == 2)
				UI_item_say(item, "I be watching ye");
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
        call Isabella, TALK;
    }
    // avatar's script here
    abort;
}

else if (event == TALK)
{
		}

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

UI_show_npc_face(item);
if (UI_get_item_flag(item, MET))
	{
		say("@What do ye want?@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Who be ye and what do ye want?@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

converse
{
    if (response == "Bye")
    {
        say("@Do not try anything funny.@");
        break;
    }
    else if (response == "Name")
    {
        say("@Isabella to you.@");
		UI_remove_answer("Name");
    }
    else if (response == "Job")
    {
        if (gflags[LECHUCK_DEAD])
        {
            say("@I be waiting for some captain to come and hire me for their crew now that ships be sailing again. About time the Nautical Guild let ships sail again but until then I will continue to wander Medina.@");
        }
        else
        {
            say("@I be wandering Medina until the Nautical Guild allows ships to be sailing again. Until then ye can buzz off.@");
        }
        UI_remove_answer("Job");
        UI_add_answer("Nautical Guild");
    }
    else if (response == "Nautical Guild")
    {
        say("@They be in charge of the good named ships that be sailing the land. If ye sail with a member of the Nautical Guild it is a good chance ye will not be cheated out of yer pay.@");
        UI_remove_answer("Nautical Guild");
        UI_add_answer("Cheated");
    }
    else if (response == "Cheated")
    {
        say("@If a member of the Nautical Guild cheats ye than ye can be sure that ye can get paid by the guild itself. I may not be a fan of some of their policies but this one I be.@");
        UI_remove_answer("Cheated");
    }
}


	
	UI_remove_npc_face(item);
	}

