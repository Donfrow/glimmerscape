/*
Simon, the guarder(of sorts) of the bandit treasure
*/

void SimonKey()
{
    UI_push_answers();
    UI_add_answer("Give me the key");
    UI_add_answer("I will slay you and take it");
    
    converse
    {
        if(response == "Give me the key")
        {
            say("@Thank you, thank you. Here is the key. Please, leave me be.@");
            UI_add_party_items(1, KEY, 13, 6);
            gflags[SIMON_GAVE_KEY] = true;
            karma = karma + 500;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "I will slay you and take it")
        {
            say("@I am weak, you will surely win. No, please!");
            gflags[ATTACK_SIMON] = true;
            karma = karma - 500;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}


void Simon object#(0x4a5) ()
	{

var bark = "Do not hurt me!";
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
				UI_item_say(item, "Please do not beat me");
			else if (n == 2)
				UI_item_say(item, "Please, do not hurt me");
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
        call Simon, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Please, do not hurt me.@");
	}
else
	{

	say("@I beg of you, do not hurt me!");
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
			say("@I will tell noone you were here.@");		
			break;
			}
		else if (response == "Name")
			{
			say("@I am Simon. Please, do not hurt me.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am to hold the key to Halinish's treasure room, and report on anyone who seeks entrance. ");
			UI_remove_answer("Job");
			UI_add_answer("Halinish");
			UI_add_answer("Report");
			}
		else if (response == "Report")
		{
            say("@Halinish wants to know if anyone picks the lock to here and tries to get into the treasure room for thievery. I am to tell her, but I will not tell on you if you leave me be! Please, leave me be!");
            if (gflags[SIMON_GAVE_KEY])
            {
            }
            else if (gflags[ATTACK_SIMON])
            {
                say("@No, please, do not hurt me.@");
            }
            else
            {
            say("@In fact, if you leave me be I shall give you the key. Yes, I will give you the key if you will leave me be.@");
            SimonKey();
            }
            UI_remove_answer("Report");
        }
        else if (response == "Halinish")
        {
            say("@She keeps me here against my will, but she expects loyalty. I will not speak if you leave me be.@");
            UI_remove_answer("Halinish");
        }


		}
	UI_remove_npc_face(item);
	}
}
