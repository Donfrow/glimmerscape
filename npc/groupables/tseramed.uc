/*
Tseramed, bandit that can join you
*/


void Tseramed object#(0x4a2) ()
	{

var door_unlocked = UI_find_object([877, 2159, 0], 270, 11, 4); // open door

if(door_unlocked)
{
    gflags[FREED_TSERAMED] = true;
}

if (inParty(-162))
{
}
else
{
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
				UI_item_say(item, "Such a shame");
			else if (n == 2)
				UI_item_say(item, "Anyone?");
			}
		}
}

	if (event != 1)
		return;
	UI_show_npc_face(item);
	
var door_ref = UI_find_nearby([877, 2159, 0], 270, 2, MASK_NONE);
var door_frame = UI_get_item_frame(door_ref);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");
	
if(door_frame == 6)
{
	say("@Would you consider letting me out?");
}
else if (inParty(-162))
{
	say("@What do you desire of me?@");
	UI_add_answer("Leave");
}	
else
{
	say("@What can I do for you?@");
	UI_add_answer("Join");
}

converse
{

    if(response == "Bye")
    {
        say("@As you wish.@");
        break;
    }
    else if (response == "Name")
    {
        say("@You may call me Tseramed.@");
        UI_remove_answer("Name");
    }
    else if (response == "Job")
    {
        if(inParty(-162))
        {
            say("@Currently I am travelling with you.@");
        }
        else
        {
            say("@I have been gathering intelligence on the bandits as of late, however, when I was captured that was put to an end.@");
            UI_add_answer("Intelligence");
        }
        UI_remove_answer("Job");
    }
    else if (response == "Intelligence")
    {
        say("@Yesserm of Dewtopia hired me to gain information about the Northern Bandits.@");
        say("@I had learned much when I was spotted providing this information to a contact of Yesserm's. I was quickly subdued and knocked unconcious and brought here, whereever here is.@");
        UI_remove_answer("Intelligence");
    }

    else if (response == "Leave")
    {
        say("@If that is what you desire.@");
        UI_remove_answer("Leave");
        UI_remove_from_party(-162);
    }
    else if (response == "Join")
    {
        say("@As you freed me I shall accompany you.@");
        UI_remove_answer("Join");
        UI_add_to_party(-162);
        
    }


}
UI_remove_npc_face(item);
}


