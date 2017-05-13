/*

Markus the prisoner transport from Dewtopia

*/

void Kill_Markus()
{
	UI_push_answers();
	UI_add_answer("I am taking you to Brentonia");
	UI_add_answer("I am not here to bother you");
	converse
	{
		if(response == "I am taking you to Brentonia")
		{
			say("Markus scowls at you ready to attack. @I will not bring my goblin friends into our squabble, but no I will not come with you while I still breathe.@");
			gflags[KILL_MARKUS] = true;
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
		else if (response == "I am not here to bother you")
		{
			say("Markus regards you dubiously. @I hope that you have learned the error of your ways.@");
			UI_clear_answers();
			UI_pop_answers();
			break;		
		}
	}
}

void LeaveNow()
{
	UI_push_answers();
	UI_add_answer("Now!");
	UI_add_answer("Very well");
	converse
	{
		if(response == "Now!")
		{
			say("@Erm, uhh, well ok. Hopefully I can find my way out without being caught or killed. Thank you for freeing me none the less.@");
			UI_remove_from_party(-382);
			UI_modify_schedule(-382, 0, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 1, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 2, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 3, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 4, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 5, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 6, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 7, SLEEP, [0, 0]);
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
		else if (response == "Very well")
		{
			say("@You certainly are not like the other guards.@");
			UI_clear_answers();
			UI_pop_answers();
			break;			
		}
	}
}

void Markus object#(0x57e) () // NPC number 382
	{

var loc = get_object_position(AVATAR);

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{		// Sleeping.
			UI_item_say(item, "Zzzz...");
			
			return;
			}
		var n = UI_get_random(2);// 1-2.
		if (inParty(-382))
		{
        }
        else
        {
		if (n == 1)
			UI_item_say(item, "");
		else if (n == 2)
			UI_item_say(item, "");
		return;
        }
		}

		
UI_show_npc_face(item);
		
if(gflags[GOOD_TRANSPORT_RELEASE])
{
	say("@It is nice to see you have chosen to visit me and the goblins of the mountains.@");
	UI_add_answer("Name");
	UI_add_answer("Job");
	UI_add_answer("Bye");
	converse
	{
		if(response == "Bye")
		{
			say("@Markus waves you off with a friendly smile.@");
			break;
		}
		else if (response == "Name")
		{
			say("The man looks at you puzzled. @I am still Markus.@");
			UI_remove_answer("Name");
		}
		else if (response == "Job")
		{
			say("@Now that I am no longer a prisoner of Dewtopia, and thanks to you, not a prisoner of Brentonia, I am free to live the simple life with the goblins.@");
			UI_remove_answer("Job");
			UI_add_answer("Goblins");
			UI_add_answer("Prisoner");
		}
		else if (response == "Goblins")
		{
			say("@As I have mentioned in the past the goblins of these mountains are not savages like the ones a traveller will encounter in the Northern Forest.@");
			UI_remove_answer("Goblins");
		}
		else if (response == "Prisoner")
		{
			say("A large smile appears on the mans face. @Thanks to you I am free once again. Although I am certain there will be a bounty on my head shortly, I doubt anyone will come looking for me here.@");
			UI_remove_answer("Prisoner");
		}
	
	}
}
else if (gflags[BAD_TRANSPORT_RELEASE])
{
	say("@Why have you come here?@");

	Kill_Markus();
	if(gflags[KILL_MARKUS])
	{
		AttackAvatar();
	}
	else
	{	

	UI_add_answer("Name");
	UI_add_answer("Job");
	UI_add_answer("Bye");
	
		converse
		{

			if(response == "Bye")
			{
				say("@Markus eyes you cautiously as he waves you off.");
				break;
			}
			else if (response == "Name")
			{
				say("He eyes you. @I am still Markus...@");
				UI_remove_answer("Name");
			}
			else if (response == "Job")
			{
				say("@Now that I am no longer a prisoner of Dewtopia, and luckily not a prisononer of Brentonia, I live a simple life with the goblins.@");
				UI_remove_answer("Job");
				UI_add_answer("Goblins");
				UI_add_answer("Prisoner");
			}
			else if (response == "Goblins")
			{
			say("The goblins of these mountains are not savages like the ones a traveller will encounter in the Northern Forest. They may not understand our customs very well, but they are not brutes.@");
			UI_remove_answer("Goblins");
			}
			else if (response == "Prisoner")
			{
			say("Markus eyes you. @Since I escaped from you outside of Brentonia I have been a free, albeit wanted, man. I intend to keep it that way.@");
			UI_remove_answer("Prisoner");
			}
		}
	}
}
else
{
		
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (inParty(-382))
{
UI_add_answer("Leave");
if (UI_get_item_flag(item, MET)) 
	{
	say("@What would you do to me? Should I prepare for a beating?@");
	UI_remove_answer("Name");
	}
else
	{
	say("@I assure you I shall not complain, but please, do not beat me.@");
	UI_set_item_flag(item, MET, true);
	}

converse
{
    if (response == "Job")
    {
        say("@Is my job not to be but your prisoner?@");
        UI_remove_answer("Job");
    }
    else if (response == "Name")
    {
		say("@My name is not even on your transport orders? Methinks the system needs to be reworked.@");
		say("The man pauses. @Forgive my tongue. I have dealt with a lot while down there. I am Markus.@");
		UI_remove_answer("Name");
    }
    else if (response == "Bye")
    {
        say("@Yes, but of course.@");
        break;
    }
    else if (response == "Leave")
    {
		if(loc[1] >= 1586 && loc[1] <= 1872 && loc[2] >= 1699 && loc[2] <= 1950) //|| loc[1] >=1659 && loc[1] <= 1694 && loc[2] >= 970 && loc[2] <= 992) // Still in the city of Dewtopia or the cellar
		{
			say("The man looks perplexed. @While I appreciate the fact that you are willing to let me free, could we at least do it once we have cleared the city?@");
			LeaveNow();
			UI_remove_answer("Leave");
		}
		else
		{
			say("@I appreciate that you are letting me free. I am not quite certain why you are doing such a thing, but know that I am quite appreciative of it.@");
			UI_remove_from_party(-382);
			UI_modify_schedule(-382, 0, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 1, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 2, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 3, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 4, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 5, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 6, SLEEP, [0, 0]);
			UI_modify_schedule(-382, 7, SLEEP, [0, 0]);
        }
        UI_remove_answer("Leave");

    }
} // end bracket for converse
}
else
{

converse
{
// Code to go here depending on how he is no longer in the part
	if(response == "Bye")
	{
		break;
	}
}

}
}
	UI_remove_npc_face(item);
	}
