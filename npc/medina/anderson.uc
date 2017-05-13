/*

Sailor loitering around Medina

*/


void Anderson object#(0x4b4) ()
	{
	
var bark = "Hello";
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
				UI_item_say(item, "I want coin");
			else if (n == 2)
				UI_item_say(item, "I be restless");
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
        call Anderson, TALK;
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
		say("@Yar?");
		UI_remove_answer("Name");
	}
else
	{

		say("@I say this now. I will not sail for someone with such sea legs as you.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

converse
{
    if (response == "Bye")
    {
        say("@I be seeing ye.@");
        break;
    }
    else if (response == "Name")
    {
        say("@Anderson be my name, Job Anderson.@");
		UI_remove_answer("Name");
    }
    else if (response == "Job")
    {
        if (gflags[LECHUCK_DEAD])
        {
            say("@Ye be asking my job or checking my first name? Har har! That never gets old! I be waiting for a ship to need a crew now that they be sailing again.@");
        }
        else
        {
            say("@Yar, that be my name! Har har! That never gets old! I be waiting here in Medina until sailing be happening again.@");
        }
        UI_remove_answer("Job");
        UI_add_answer("Sailing");
    }
    else if (response == "Sailing")
    {
        say("@Sailing be my job and name, har har har! I tells ya, that joke will never get old. I do enjoy the sea air more than this land air. But until someone picks me up to sail, I be stuck with it.@");
        UI_remove_answer("Sailing");
    }

}
	}

	
	UI_remove_npc_face(item);
	}

