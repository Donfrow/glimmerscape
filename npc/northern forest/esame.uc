/*
Northern Bandit Leader Esame 
*/

void Esame object#(0x54c) ()
	{

var bark = "Hail";
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
				UI_item_say(item, "Fear my dagger");
			else if (n == 2)
				UI_item_say(item, "All fear me");
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
        call Esame, TALK;
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
	say("@You will not escape this time.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Come to give up your coin purse I see.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	
if (gflags[KNIGHT])
	{
	UI_add_answer("Geth is slain");
	}
if (gflags[BANDIT_STRUCTURE1])
	{
	UI_add_answer("I demand your key");
	}


		converse
		{
	if (response == "Bye")
			{
			say("@I shall now rid the world of you.@");
			UI_set_alignment(-331, 2);
			UI_set_alignment(-332, 2);
			UI_set_alignment(-333, 2);
			UI_set_alignment(-334, 2);
			UI_set_alignment(-335, 2);

			UI_set_opponent(-331, PARTY);
			UI_set_opponent(-332, PARTY);
			UI_set_opponent(-333, PARTY);
			UI_set_opponent(-334, PARTY);
			UI_set_opponent(-335, PARTY);

			UI_set_schedule_type(-331, IN_COMBAT);
			UI_set_schedule_type(-332, IN_COMBAT);
			UI_set_schedule_type(-333, IN_COMBAT);
			UI_set_schedule_type(-334, IN_COMBAT);
			UI_set_schedule_type(-335, IN_COMBAT);

			item->set_alignment(HOSTILE);
   			item->set_schedule_type(IN_COMBAT); 
   			item->set_opponent(AVATAR); 

			break;
			}
		else if (response == "Name")
			{
			say("@Ha, how can one not know my name? I am the most feared bandit in this forest. Esame, slayer of all who walk in my path.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@To steal from the rich and give to myself and you seem to be rich enough for me.@");
			UI_remove_answer("Job");
			UI_add_answer("Bandit!");
			}
		else if (response == "Bandit!")
			{
			say("@I venture to say that I am dealing with a simpleton. Aye, I am a bandit.@");
			
			UI_remove_answer("Bandit!");
			}
		else if (response == "Geth is slain")
			{
			say("@I heard word that the leader of the Plains Bandits has been slain. I simply cannot image it was the likes of you that did it.@");
			say("@He always had been the weakest link.@");
			
			UI_remove_answer("Geth is slain");
			UI_add_answer("You will be next");
			}
		else if (response == "You will be next")
			{
			say("@You are not the first person to say that, but it will be the last words from your mouth...@");
			UI_remove_answer("You will be next");
			}
		else if (response == "I demand your key")
			{
			say("@I am intrigued how you learned of the key... I would be concerned that you would tell others this knowledge but you will not survive this encounter.@");
			UI_remove_answer("I demand your key");

			}



		}
	UI_remove_npc_face(item);
	}
}
