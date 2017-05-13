/*
Bains in the goblin prisoner
*/

void KeepSilent()
{
    UI_push_answers();
    UI_add_answer("Nay, you must be brought to justice");
    UI_add_answer("For 2000 gold I will forget I ever saw you");
    
    converse
    {
        if (response == "Nay, you must be brought to justice")
        {
            say("@It is a shame you are so steady with your heart. I could have made it worth your while. However, I am not in a position to argue with you so I suppose I must deal with your choice.@");
            gflags[TALKED_TO_BAINS] = true;
            karma = karma + 800;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "For 2000 gold I will forget I ever saw you")
        {
            say("@You drive a hard bargain, but you realize that you are in a position of power. I can respect that. When we escape these caves I shall pay your fee for your silence.@");
            karma = karma - 400;
            gflags[TALKED_TO_BAINS] = true;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Bains object#(0x42f)()
	{

var goblindead = UI_is_dead(-355);
var loc = get_object_position();

var bark = "Yes?";
var bark_intro = "Hail";
	
	if (event == 0)
		{
		if(inParty(-47))
		{
		}
		else
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
				UI_item_say(item, "Please free me");
			else if (n == 2)
				UI_item_say(item, "Do not let the goblins get me");
			}
		}
		}

if (event == DOUBLECLICK)
{
	if(UI_is_dest_reachable(AVATAR, [loc]));
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
			call Bains, TALK;
		}
		// avatar's script here
		abort;
	}
	
	}

else if (event == TALK)
{
	UI_show_npc_face(item);


		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");
		
if(goblindead)
{
UI_add_answer("Join");
}

if (inParty(-47))
{
    UI_remove_answer("Join");
    UI_add_answer("Bye");
    UI_add_answer("Job");
    UI_add_answer("Leave");
    say("@Onward, let us continue the journey!");
    converse
    {
        if (response == "Bye")
        {
            say("@Yes yes, we should continue on the journey.@");
            break;
        }
		else if (response == "Name")
			{
			say("@Bains, at your service.@");
			UI_remove_answer("Name");
			
				if (gflags[READ_JAIL_BREAK_BOOK])
					{
					UI_add_answer("Escape from the Sugar Caves");
					UI_remove_answer("Name");
					}
				else
					{
					UI_remove_answer("Name");
					}
            }
        else if (response == "Job")
        {
            say("@Currently my job is to repay my debt to you for freeing me from the goblins.@");
            UI_remove_answer("Job");
        }
        else if (response == "Leave")
        {
            say("@Fine, be that way! I do not need you! I can get out of here on my own.@");
            UI_remove_answer("Leave");
            UI_remove_from_party(-47);
			gflags[BAINS_IN_PARTY] = false;
			UI_clear_item_flag(AVATAR, BLINKER_DISABLED);
        }
		else if (response == "Escape from the Sugar Caves")
			{
			say("@So my tale is already spreading throughout the lands. Aye, I am the same one who did escape the 'inescapable' Sugar Caves.@");
			if (gflags[TALKED_TO_BAINS])
			{
            }
            else
            {
                say("@In fact, perhaps we could arrange some sort of payment if you were to keep your silence about finding me...@");
                KeepSilent();
            }
			UI_remove_answer("Escape from the Sugar Caves");
            }



    }
}
else
{







if (UI_get_item_flag(item, MET)) 
	{
	say("@Please, save me!");
	}
else
	{
	say("@Help me! Save me from the goblins!");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Do not be slain by goblins!");
			break;
			}
		else if (response == "Name")
			{
			say("@Bains, at your service.@");
			UI_remove_answer("Name");
			
				if (gflags[READ_JAIL_BREAK_BOOK])
					{
					UI_add_answer("Escape from the Sugar Caves");
					UI_remove_answer("Name");
					}
				else
					{
					UI_remove_answer("Name");
					}

			}
		else if (response == "Job")
			{
			say("@At the moment my job is awaiting for the goblins to turn me into something similar or worse than my unfortunate cell mate here.@");
			UI_add_answer("Goblins");
			UI_add_answer("Cell mate");
			UI_remove_answer("Job");
			}
		else if (response == "Escape from the Sugar Caves")
			{
			say("@So my tale is already spreading throughout the lands. Aye, I am the same one who did escape the 'inescapable' Sugar Caves.@");
			if (gflags[TALKED_TO_BAINS])
			{
            }
            else
            {
                say("@In fact, perhaps we could arrange some sort of payment if you were to keep your silence about finding me...@");
                KeepSilent();
            }			
			UI_remove_answer("Escape from the Sugar Caves");
			UI_add_answer("What of Jesse?");

			}
		else if (response == "What of Jesse?")
			{
			say("@We had been resting in a cave for the night when I heard sounds. I went to investigate and while I was gone the goblins did attack and slay him.@");
			say("@It was probably for the best that he did not go through what I have gone through at the hands of the goblins.@");
			UI_remove_answer("What of Jesse?");
			}
		else if (response == "Join")
		{
		  say("@Of course I will join you! You have slain my captors and for that I owe you a debt!");
		  UI_remove_answer("Join");
		  UI_add_to_party(-47);		
		  gflags[BAINS_IN_PARTY] = true;
		  UI_set_item_flag(AVATAR, BLINKER_DISABLED);
        }
        else if (response == "Goblins")
        {
            say("@If you fancy going and slaying the goblins and acquiring the key to this jail cell I would be in your debt.@");
            UI_remove_answer("Goblins");
        }
        else if (response == "Cell mate")
        {
            say("@I do not know much about him, he was taken away right after I was brought here. When he returned he was the hideous creature you see now.@");
            UI_remove_answer("Cell mate");
        }
	}
}	}	
	UI_remove_npc_face(item);
	}
