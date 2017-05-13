/*

Sailor loitering around Medina

*/


void Gunn object#(0x564) ()
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
				UI_item_say(item, "I be restless");
			else if (n == 2)
				UI_item_say(item, "Where be my coin");
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
        call Gunn, TALK;
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
		say("@What do ye want with me?");
		UI_remove_answer("Name");
	}
else
	{

		say("@Why do ye pester me?");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

converse
{
    if (response == "Bye")
    {
        say("@Ye be on yer way then.@");
        break;
    }
    else if (response == "Name")
    {
        say("@I be known as Gunn.@");
		UI_remove_answer("Name");
    }
    else if (response == "Job")
    {
        if (gflags[LECHUCK_DEAD])
        {
            say("@I be waiting for a ship that be needing a crew now that the ban is no longer in place by the Nautical Guild");
        }
        else
        {
            say("@I be passing the time while the Nautical Guild has its ban on sailing. Until then no reputable ships be needing a crew.@");
        }
        UI_remove_answer("Job");
        UI_add_answer("Nautical Guild");
        UI_add_answer("Reputable ships");
    }
    else if (response == "Nautical Guild")
    {
        say("@They be the crew that all the captains and reputable ships belong to. If they say not to sail, there be no good ships sailing. If they say to sail, there be good ships sailing.@");
        UI_remove_answer("Nautical Guild");
    }
    else if (response == "Reputable ships")
    {
        say("@There be non-reputable ships that be sailing but I would not dare sail with one of those. Too often do they cheat the crew out of their payments.@");
        say("The man lowers his brow. @Or just deserts them on some island...@");
        UI_remove_answer("Reputable ships");
		UI_add_answer("Cheat");
    }
	else if (response == "Cheat")
	{
		say("@Some ships who not be part of the guild will lure sailors with promise of a handsome payment then when payment comes due either sail away or threaten them.@");
		say("@Pretty much everyone has a story of a friend of a friend who this happened to. That be why so many people are wary about sailing with ships that do not belong to the Nautical Guild.@");
		say("@And I cannot say I blame them. I feel the same way.@");
		UI_remove_answer("Cheat");
	}
}


	
	UI_remove_npc_face(item);
	}
}
