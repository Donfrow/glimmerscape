//Foucault the scholar in Cambray

void Help_Foucault()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if(response == "Yes")
        {
            gflags[ENTRY_TO_ZARKANE_HOUSE] = true;
            say("A big smile appears. @Most excellent! The tower is inaccessable at this time but I suspect if you were to search Zarkane's home you could find a way to gain entry.@");
            say("@You can find his abandoned home on the far west shore of this island. It was magically locked long ago but I shall give you a scroll that can remove the enchantment. Do be careful how you use it as I can only give you one.@");
            UI_add_party_items(1, 715, 31, 5); // magic scroll "unlock magic"
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("The man looks disapointed. @Do realize you are depriving the world of knowledge?@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Zarkane_Experiments()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if(response == "Yes")
        {
            if(gflags[ZARKANE_EXPERIMENT_INFO])
            {
                say("You relate what you have learned of the hydra to Foucault as he nods. @No wonder the townspeople are so reluctant to speak of Zarkane. Such a beast would be a powerful weapon.@");
                say("The man pauses. @I would imagine a person able to control such a beast would become extremely powerful. Perhaps the beast can be tricked into doing someones bidding...@");
                UI_remove_answer("Yes");
                UI_remove_answer("No");
                UI_add_answer("Bidding");
            }
            else
            {
                say("Foucault looks at you oddly. @It appears that you have learned nothing yet. Please, seek out the answers in the fortress.@");
                UI_clear_answers();
                UI_pop_answers();
                break;
            }

        }
        else if (response == "No")
        {
            say("The man looks disapointed. @A shame, hopefully in time you will learn what experiments were actually performed.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Bidding")
        {
            say("@While I am a peaceful man at heart I am not so foolish to think the world is full of peace and love. Perhaps if we could find someway to convince the beast that to obey us would fulfill its purpose.@");
            say("Foucault furrows his brow. @I do not know how this can be done but I am certain there must be a way.@");
            gflags[CONVINCE_HYDRA] = true;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Foucault object#(0x574) ()
	{
	
var bark = "Yes?";
var bark_intro = "Hail";
	
	if (event == 0)
		{
		if(gflags[HYDRA_HYSTERIA])
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
				UI_item_say(item, "Interesting");
			else if (n == 2)
				UI_item_say(item, "Fascinating");
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
        call Foucault, TALK;
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
		say("Foucault nods to you. @I see you continue to seek knowledge.@");
		UI_remove_answer("Name");
	}
else
	{
	say("A pugly man smiles at you. @I see by the look in your eyes that you seek knowledge.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("The man nods. @Keep seeking knowledge.@");			
			break;
			}
		else if (response == "Name")
			{
			say("The man smiles. @It is good you seek knowledge. I shall help you begin your journey by letting you know that I am Foucault.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@I seek answers to the many questions life provides.@");
            UI_remove_answer("Job");
            UI_add_answer("Answers");
            UI_add_answer("Questions");
            UI_add_answer("What are you doing now?");
        }
        else if (response == "Answers")
        {
            say("@The answers to many of the questions one encounters tend to be right in the open and easy to find, if you open your eyes enough to be able to see their subtle hints.@");
            UI_remove_answer("Answers");
        }

        else if (response == "Questions")
        {
            say("A big grin appears. @The world is full of questions. Even what you ask of me right now is question, albeit a small one.@");
            say("@However, you must be prepared to be unable to find answers to all of your questions however, as some are simply without answer.@");
            UI_remove_answer("Questions");
        }
        else if (response == "What are you doing now?")
        {
            say("@As of the last several years I have been attempting to answer the questions of what happened in the past in this area.@");
            UI_remove_answer("What are you doing now?");
            UI_add_answer("This area");
        }
        else if (response == "This area")
        {
            say("@It is no secret that this area is where Arthis the Death Knight did fall in battle, but little know of the experiments of one of the islands inhabitants took on some time later. I am attempting to shed light on this part of this areas history.@");
            say("Foucault pauses. @Of course, it does not help that the city seems to have destroyed much of the records of this time and refuse to speak of it.@");
            UI_remove_answer("This area");
            UI_add_answer("Experiments");
        }
        else if (response == "Experiments")
        {
            say("@Time and closed lips have kept much of the information about this secret. What I have discovered so far is that a mage named Zarkane is said to have conducted them in a mountain tower to the north west of the island known as Spectral Tower.@");
            say("Foucault shakes his head. @There are so many unanswered questions.@");
            UI_remove_answer("Experiments");
            UI_add_answer("Unanswered questions");
        }
        else if (response == "Unanswered questions")
        {
            if(gflags[ENTRY_TO_ZARKANE_HOUSE])
            {
                say("@Have you learned anything about Zarkane's experiments yet?@");
                Zarkane_Experiments();
            }
            else
            {
                say("@I believe much of my questions can be answered if I were to explore the tower but I must admit I am not sure I could handle whatever there is to find in there.@");
                say("@Perhaps you could help me with this?@");
                Help_Foucault();
            }
            UI_remove_answer("Unanswered questions");
        }

        } // end converse bracket

}		
	UI_remove_npc_face(item);	
	}

