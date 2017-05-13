/*

Dockmaster in Medina

*/


void Dockmaster object#(0x415) ()
	{

var bark = "Ahoy";
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
				UI_item_say(item, "Fine sailing weather");
			else if (n == 2)
				UI_item_say(item, "The air is fresh");
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
        call Dockmaster, TALK;
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
		say("@What do ye require?@");
		UI_remove_answer("Name");
	}
else
	{

		say("@How may I be of service to ye today?@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

converse
{
    if (response == "Bye")
    {
        say("@Beware of the tides.@");
        break;
    }
    else if (response == "Name")
    {
        say("@Me name? Why, noone has ever asked my name before, I do not think I was ever given one!");
        UI_remove_answer("Name");
    }
    else if (response == "Job")
    {
        if (gflags[LECHUCK_DEAD])
        {
            say("@I be the Dock Master here in Medina. I be having more work to do soon now that LeChuck be dead and sailing be happening more frequently.@");
        }
        else
        {
            say("@I be the Dock Master here in Medina. It be a hectic life when ships be sailing but it is not like that no more with LeChuck around.@");

        }
        UI_remove_answer("Job");
        UI_add_answer("Dock Master");
        UI_add_answer("LeChuck");
    }
    else if (response == "Dock Master")
    {
        say("@It be the one who records and keeps track of all the ships that be coming in and out of Medina. It be what everyone calls me and I suppose that is what me name might as well be.@");
        UI_remove_answer("Dock Master");
    }
    else if (response == "LeChuck")
    {
        if (gflags[LECHUCK_DEAD])
        {
            say("@He be a fearsome pirate who sails the seas, or should I say sailed. I be hearing that someone like ye hath put him over to the other side.@");
        }
        else
        {
            say("@He be a fearsome pirate. I tell ye I would not want to meet him on a dark night out at the seas... or a bright day for that matter.@");

        }
        UI_remove_answer("LeChuck");
    }

}


	
	UI_remove_npc_face(item);
	}
}
