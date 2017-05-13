/*
Alberto the 2nd in command of bandits
*/


void Alberto object#(0x4a4) ()
	{

var bark = "Who are you?";
var bark_intro = "Halt bandit";
	
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
				UI_item_say(item, "All is well");
			else if (n == 2)
				UI_item_say(item, "The gold supply grows each day");
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
        call Alberto, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@How are you still alive?");
	}
else
	{

	say("@I do not recognize you...@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag






		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Enjoy what is left of your life.@");
            AttackAvatar();	
			UI_set_schedule_type(-166, IN_COMBAT);
			UI_set_opponent(-166, PARTY);
			UI_set_alignment(-166, HOSTILE);			
			break;
			}
		else if (response == "Name")
			{
			say("@Alberto, slayer of intruders...@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the second in command of the Desporia bandits. I also slay intruders such as you...@");
			UI_remove_answer("Job");
			UI_add_answer("Desporia bandits");
			}
		else if (response == "Desporia bandits")
		{
            say("@The Northern Bandits, the Plains Bandits, and the Eastern Bandits. Halinish has put together the organization and now we are feared throughout the land!@");
            UI_remove_answer("Desporia bandits");
            UI_add_answer("Halinish");
        }
        else if (response == "Halinish")
        {
            say("@Such a syndicate could not last without the disciplined control which she provides.@");
            UI_remove_answer("Halinish");
            UI_add_answer("I will slay both of you!");
        }
        else if (response =="I will slay both of you!")
        {
            say("@I very much doubt that, but we shall see!@");
            AttackAvatar();
			UI_set_schedule_type(-166, IN_COMBAT);
			UI_set_opponent(-166, PARTY);
			UI_set_alignment(-166, HOSTILE);
            break;
        }
		}
}

		
	UI_remove_npc_face(item);
	}

