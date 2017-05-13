/* 
Brana - Lord Dew's Slut
*/
			
void Brana object#(0x4fc) ()
	{
	
var bark_intro = "Hail";
var bark = "What do you want?";
	
	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{		// Sleeping.
			UI_item_say(item, "..zz..power..zz..@");
			return;
			}
		var n = UI_get_random(2);// 1-2.
		if (n == 1)
			UI_item_say(item, "I'm so pretty");
		else if (n == 2)
			UI_item_say(item, "Bow before me");
		return;
		}
	UI_show_npc_face(item);

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
        call Brana, TALK;
    }
    // avatar's script here
    abort;
}

else if (event == TALK)
{

UI_add_answer("Name");
UI_add_answer("Job");
UI_add_answer("Bye");

if (UI_get_item_flag(item, 28)) 
	{
	if (UI_is_dead(GRUP) == true)
		{
		say("@Welcome back noble warrior.@");
		UI_add_answer("Noble warrior");
		}
	else
		{
		say("@Again you pester me.@");
		}
	UI_remove_answer("Name");
	}
else
	{
	say("@What do you want commoner?@");
	UI_set_item_flag(item, 28, true);
	}
	// End of opening IF

	
		converse
		{
	if (response == "Bye")
			{
		if (UI_is_dead(GRUP) == true)
			{
			say("@Fairwell noble warrior.@");
			break;
			}
		else
			{
			say("@Pfft.@");
			
			break;
			}
			}
		else if (response == "Name")
			{
				if (UI_is_dead(282) == true)
					{
					say("@I am Lady Brana.@");
					UI_remove_answer("Name");
					UI_add_answer("Lady");
					}
				else
				{
				say("@A lowly commoner dare ask my name?@");
				say("@Why, you should know... I am Lady Brana, lover of Lord Dew.@");
				UI_remove_answer("Name");
				UI_add_answer("Lover");
				UI_add_answer("Commoner");
				}
			}
		else if (response == "Job")
			{
			say("@My job is to rule over the likes of you sweety pie.@");
			UI_remove_answer("Job");
			}
		else if (response == "Lover")
			{
			say("@Noone can resist my feminine wiles, man or woman.@");
			UI_remove_answer("Lover");
			UI_add_answer("I bet I can");
			}
		else if (response == "I bet I can")
			{
			say("@How dare you insult me!");
			say("@Guards! Guards!");
			break;
			UI_attack_avatar();
			}
		else if (response == "Commoner")
			{
			say("@Surely you know your place in the world?");
			say("@And I will add, that it is certainly not talking to the likes of me.@");
			break;
			}
		else if (response == "Lady")
			{
			say("@I am in courtship with your fair ruler Lord Dew.@");
			UI_remove_answer("Lady");
			}
		else if (response == "Noble warrior")
			{
			if (gflags[KNIGHT])
			{
				say("@Word has spread how such a strong adventurer has slain both the goblin Gruplinort and slain the leadership of the plains bandits. Truely such a strong individual would be woryour of my affection.@");
				UI_remove_answer("Noble warrior");
				UI_add_answer("Affection");
			}
			else
			{
                say("@Word of your slaying on the mighty goblin Gruplinort has spread. You are almost brave enough to be worthy of my affection.@");
            }
			UI_remove_answer("Noble warrior");
			}
		else if (response == "Affection")
			{
			say("@I know you desire my body... every mortal does. You are lucky as there are few I offer it to.@");
			say("@I shall arrange a time when you are able to take me in any way you desire.@");
			say("@But we must not let Lord Dew know.@");
			UI_remove_answer("Affection");
			
			gflags[CHEATING_SLUT] = true;
			}

		}
}		
	UI_remove_npc_face(item);
	}
