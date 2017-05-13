/*
Rannick at entrance to goblin caves
*/


void Rannick object#(0x406) ()
	{
var bark = "How can I help you?";
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
			 if (inParty(-6))
			 {
             }
             else
             {
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Not a goblin in sight");
			else if (n == 2)
				UI_item_say(item, "My blade is covered with goblin blood");
            }
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
        call Rannick, TALK;
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
		say("@What can I do for you?");
		UI_remove_answer("Name");

	}
else
	{

		say("@You should be wary while in this forest.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if (inParty(-6))
{
    UI_remove_answer("Join");
    UI_add_answer("Leave");
    converse
    {
        if (response == "Bye")
        {
            say("@Yes, we should continue on our exploits.@");
            break;
        }
        else if (response == "Job")
        {
            say("@Currently I am tasked to follow you on your many exploits.@");
            UI_remove_answer("Job");
        }
        else if (response == "Leave")
        {
            say("@Very well. I will do as you command.@");
            UI_remove_answer("Leave");
            UI_remove_from_party(-6);
        }
    }
}
else
{
    if (gflags[RANNICK_JOIN])
    {
        UI_add_answer("Join");
    }

		converse
		{
        if (response == "Bye")
        {
            say("@Watch your surroundings as you travel the Northern Forest.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Knight Rannick of Dewtopia.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            if (gflags[GOBLINS_DEFEATED])
            {
                say("@With the goblins dealt a critical blow my current job is to do what Dewtopia requires of me.@");
            }
            else
            {
            say("@I am currently tasked with guarding the caved in entrance to the goblin caves. It is our hope that this will lower their constant attacks.@");

            }
            UI_remove_answer("Job");
        }
        else if (response == "Join")
        {
            say("@With great pleasure! It was getting rather dull around here.@");
            UI_add_to_party(-6);
            UI_remove_answer("Join");
        }

        }
}
	UI_remove_npc_face(item);
	}
}
