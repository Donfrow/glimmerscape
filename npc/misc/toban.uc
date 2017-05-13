/*
Toban the Glutton NPC # 31
*/

void FreezeToban object#()()
{
    UI_set_item_flag(-31, 16);
}
void UnFreezeToban object#()()
{
    UI_clear_item_flag(-31, 16);
}

void Change_Sirenum_Shape object#()()
{
    UI_set_item_shape(-138, 652); // Woman shape
}

void Sirenum_Free_Convo object#()()
{
    UI_show_npc_face(632, 1);
    
    // CHANGE SIRENUM'S SCHEDULE
    
    UI_modify_schedule((-138), 0, SLEEP, [2914, 0407]); // sleep on Melose's house
    UI_modify_schedule((-138), 2, EAT, [2931, 0410]); // Eat at Melose's table
    UI_modify_schedule((-138), 3, LOITER, [2936, 0406]); // Set her to loiter in Melose's house
    UI_modify_schedule((-138), 7, EAT, [2914, 0407]); // Set her to eat at the table
    gflags[GET_MELOSE_REWARD] = true;
    say("Sirenum is the happiest you have ever seen her. @Thank you! I am now free from Toban and I can finally live my life as I please. It is also nice to be able to wear clothes again!@");
	(-138)->clear_item_flag(DONT_MOVE);
}

void Sirenum_Free()
{


    script -138
    {
        say("I am free!");
        wait 3;
        actor frame KNEEL;
        wait 2;
        actor frame STAND;
        wait 2;
        actor frame USE;
        wait 2;
        call Change_Sirenum_Shape;
        actor frame STAND;
        wait 1;
        call Sirenum_Free_Convo;
    }
}

void Path_Sirenum object#()()
{
    var loc = UI_get_object_position(AVATAR);
	(-138)->set_item_flag(DONT_MOVE);
    UI_si_path_run_usecode(-138, loc, SCRIPTED, -138, Sirenum_Free, true); // Sirenum NPC Number
}

void Toban_Collapse()
{
    script -31
    {
        say("Ohhhh");
        actor frame KNEEL;
        wait 1;
        actor frame LIE;
        call Path_Sirenum;
        wait 45;
        call UnFreezeToban;
    }
}

void Toban_Wine_Convo_2 object#()()
{
    UI_show_npc_face(631, 0);
    gflags[SIRENUM_FREE] = true;
    say("You can tell that Toban is about to collapse. @Sirenum is no longer bound to me. Now for my...@");
    Toban_Collapse();
}

void Toban_Release()
{
    script -31
    {
        call Spell_Cast;
        actor frame CAST_1;
        wait 3;
        actor frame CAST_2;
        wait 3;
        actor frame STAND;
        wait 3;
        call Toban_Wine_Convo_2;
    }
}

void Toban_Wine_Convo_1 object#()()
{
    UI_show_npc_face(631, 0);
    
    say("Toban stammers towards you. @Ohh my head. What type of wine did you bring me? it is much stronger than what I normally imbibe.@");
    UI_add_answer("Release Sirenum");
    UI_add_answer("Bye");
    converse
    {
        if (response == "Bye")
        {
            say("Toban looks confused. @You have... poor taste in wine.@");
            break;
        }
        else if (response == "Release Sirenum")
        {
            say("Toban looks around the room. @Sirenum is bound to me, she cannot be released by anyone but myself.@");
            UI_remove_answer("Release Sirenum");
            UI_add_answer("Release her");
            UI_add_answer("How is she bound?");
        }
        else if (response == "Release her")
        {
            say("It looks as if Toban is ready to fall over. @Why am I releasing her again?");
            UI_remove_answer("Release her");
            UI_add_answer("For your reward");
        }
        else if (response == "For your reward")
        {
            say("A large belch escapes from Toban's mouth and a nauseating aroma fills the air. @Right my reward. I almost forgot about that. I shall release her now.@");
            Toban_Release();
            break;
        }
        else if (response == "How is she bound?")
        {
            say("Toban nearly falls down. @Her gypsy father stole from many people without getting caught. He was not so lucky with me.@");
            say("He pauses. @He used some sort of magic to bind her to me so that I would not turn his entire family into the guards to be executed.@");
            say("A belch escapes. @What were we talking about again?@");
            UI_remove_answer("How is she bound?");
        }




	   
    }
}

void Toban_Wine_2()
{
    script -31
    {
        call FreezeToban;
        actor frame USE;
        say "Ohhhh";
        wait 2;
        actor frame KNEEL;
        wait 2;
        actor frame LIE;
        wait 5;
        actor frame KNEEL;
        wait 2;
        actor frame STAND;
        wait 5;
        call Toban_Wine_Convo_1;
        call UnFreezeToban;
        
    }

}


void Toban_Wine_1()
{
    UI_push_answers();
    UI_add_answer("Tis a wonderful vintage");
    UI_add_answer("You are correct, tis terrible");
    converse
    {
        if(response == "Tis a wonderful vintage")
        {
            say("@I doubt that but I shall be the judge of that.@");
            gflags[TOBAN_DRANK_WINE] = true;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "You are correct, tis terrible");
        {
            say("@If that is the case why would you think I would enjoy it?@");
            gflags[TOBAN_FAIL_1] = true;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}



void Toban object#(0x41f) ()
	{

var tainted_wine = UI_count_objects(PARTY, ROOFIE, ANY, ANY);  // to free Sirenum
 
var bark = "Do not cause trouble";
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
				UI_item_say(item, "Marvelous, simply marvelous!");
			else if (n == 2)
				UI_item_say(item, "Lovely");
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
        call Toban, TALK;
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

if (tainted_wine > 0)
{
    UI_add_answer("Can I interest you in some wine?");
}


if (gflags[SIRENUM_FREE]) // You have freed Sirenum
{

    if (UI_get_item_flag(item, MET))
	{
		say("@I seem to recall you from somewhere.@");
		UI_remove_answer("Name");

	}
else
	{

		say("@Welcome to my island paradise!@");
		UI_add_answer("Island");
		UI_set_item_flag(item, MET, true);
	}
	
	converse
	{
        if (response == "Bye")
        {
            say("@Be on your way.@");
            break;
        }
        else if (response == "Job")
        {
            say("@My job is to enjoy life and everything it hath to offer, be it fine wine or an even finer woman. All that one can desire is on my island. Though I am not quite certain what happened to my fine woman.@");
            UI_remove_answer("Job");
            UI_add_answer("Island");
            UI_add_answer("Wine");
            UI_add_answer("Woman");
        }
        else if (response == "Island")
        {
            say("@My fine house sits upon a small piece of land in the seas south of DeathSquall Island. It is quite the little paradise.@");
            UI_remove_answer("Island");
            UI_add_answer("Paradise");
        }
        else if (response == "Paradise")
        {
            if(gflags[LECHUCK_DEAD])
            {
                say("@If this were not my own paradise I would do what it would take to make it my own. Luckily with the death of LeChuck I no longer need to fear pirates taking more than they deserve to leave me alone. All of my wine is now only mine to enjoy.@");
            }
            else
            {
                say("@If this were not my own paradise I would do what it would take to make it my own. Unfortunately for myself the pirates lead by LeChuck constantly demand I give them some of my fine wine to leave me be.@");
            }
            UI_remove_answer("Paradise");
            UI_add_answer("Pirates");
            UI_add_answer("Wine");
        }
        else if (response == "Pirates")
        {
            if(gflags[LECHUCK_DEAD])
            {
                say("@The blasted bandits of the sea would stop by my little paradise and demand I provide them with wine. Luckily, if they were to have slain my they would no longer have gotten wine so they let me live. Thankfully with LeChuck dead all my wine is now mine to enjoy.@");
            }
            else
            {
                say("@Blasted bandits of the sea. They stop by on occasion and demand my wonderful wine. Luckily for me if they were to slay me they would no longer have access to my wine after they squandered what they would have pillaged. As such they let me live.@");
            }
            UI_remove_answer("Pirates");
        }
        else if (response == "Wine")
        {
            say("@It is simply the finest wine one will ever come across. It is from the lost city of Exeter and with the poor towns destruction no more will ever grace the lands.@");
            say("The man pauses. @For some reason I have a vague recollection that I recently tried some wine from you. I do not know why.@");
            UI_remove_answer("Wine");
        }
        else if (response == "Woman")
        {
            say("@I had a beautiful woman by the name of Sirenum bound to me, but for reasons I cannot recall I set her free. At least I no longer have to feed the wench.@");
            UI_remove_answer("Woman");
        }
    } // end converse bracket
	
} // End bracket for if gflag toban_drank_wine

else
{

if (UI_get_item_flag(item, MET)) 
	{
		say("@You cannot resist my island of paradise can you?@");
		UI_remove_answer("Name");

	}
else
	{

		say("@Welcome to my island paradise!@");
		UI_add_answer("Island");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{
        if (response == "Bye")
        {
            say("@Yes, yes, continue on your little journey.@");
            break;
        }
        else if (response == "Name")
        {
            say("Of course you should know my name, for it is my island which you have set foot on. Toban at your service.");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@My job is to enjoy life and everything it hath to offer, be it wine or a fine woman. All that one can desire is on my island.@");
            UI_remove_answer("Job");
            UI_add_answer("Island");
            UI_add_answer("Wine");
            UI_add_answer("Woman");
        }
        else if (response == "Island")
        {
            say("@My fine house sits upon a small piece of land in the seas south of DeathSquall Island. Tis quite the little paradise.@");
            UI_remove_answer("Island");
            UI_add_answer("Paradise");
        }
        else if (response == "Paradise")
        {
            if(gflags[LECHUCK_DEAD])
            {
                say("@If this were not my own paradise I would do what it would take to make it my own. Luckily with the death of LeChuck I no longer need to fear pirates taking more than they deserve to leave me alone. All of my wine is now only mine to enjoy.@");
            }
            else
            {
                say("@If this were not my own paradise I would do what it would take to make it my own. Unfortunately for myself the pirates lead by LeChuck constantly demand I give them some of my fine wine to leave me be.@");
            }
            UI_remove_answer("Paradise");
            UI_add_answer("Pirates");
            UI_add_answer("Wine");
        }
        else if (response == "Pirates")
        {
            if(gflags[LECHUCK_DEAD])
            {
                say("@The blasted bandits of the sea would stop by my little paradise and demand I provide them with wine. Luckily, if they were to have slain my they would no longer have gotten wine so they let me live. Thankfully with LeChuck dead all my wine is now mine to enjoy.@");
            }
            else
            {
                say("@Blasted bandits of the sea. They stop by on occasion and demand my wonderful wine. Luckily for me if they were to slay me they would no longer have access to my wine after they squandered what they would have pillaged. As such they let me live.@");
            }
            UI_remove_answer("Pirates");
        }
        else if (response == "Wine")
        {
            say("@It is simply the finest wine one will ever come across. It is from the lost city of Exeter and with the poor towns destruction no more will ever grace the lands.@");
			say("@The only wine that comes even close is made by a man called Zulith out in Cotton Cove. Compared to the fine wine of Exeter it is like drinking from a swamp.@");
			say("@Still, every other wine is like drinking raw sewage, so I suppose it still stands above the rest.@");
            UI_remove_answer("Wine");
            UI_add_answer("Exeter wine");
        }
        else if (response == "Exeter wine")
        {
			say("@It truely is wonderful, above all the other garbage that all of you filthy urchins drink. Luckily many folks lack a refined taste that the few bottles I come across are easy to obtain.@");
            say("@When one has such a lovely lady able to please any man one will trade anything to have an hour with her. As much as I would prefer her to please myself only, I simply adore the wine!@");
            UI_remove_answer("How did you get it?");
        }
        else if (response == "Woman")
        {
            say("@Sirenum is such a wonderful woman able to please the desires of any man, or woman for that matter.@");
            UI_remove_answer("Woman");
            UI_add_answer("Sirenum");
        }
        else if (response == "Sirenum")
        {
            say("@She belongs to me and even the greatest riches in the world would not make me give her up. She is quite the woman and provides me with far too much pleasure.@");
            say("@And if you have the idea of slaying me and taking her for yourself you should know that she is bound to my soul through magic. The only way to release her is if I choose to do so of my own free will.@");
            UI_remove_answer("Sirenum");
        }
        
        else if (response == "Can I interest you in some wine?")
        {
            say("@I am a connoisseur of fine wines. I doubt any wine which you can offer me will be even close to passing my standards.@");
            Toban_Wine_1();
            if(gflags[TOBAN_FAIL_1])
            {
                gflags[TOBAN_FAIL_1] = false;
            }
            else if (gflags[TOBAN_DRANK_WINE])
            {
                UI_remove_party_items(1, ROOFIE, ANY, ANY);
                Toban_Wine_2();
                break;
            }
            UI_remove_answer("Can I interest you in some wine?");
        }
        
  }   // End bracket for else statement
		}
	UI_remove_npc_face(item);
	}
}
