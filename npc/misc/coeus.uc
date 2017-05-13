/*
Coeus the cyclops on dragon isle
*/

void WhichOrb()
{
UI_push_answers();

UI_add_answer("I do not know");
UI_add_answer("Random guess");

if(gflags[TALK_TO_COEUS])
	{
	UI_add_answer("Orb of Persuasion");
	}

	converse
	{
		
		if (response == "I do not know")
			{
			say("@At least you are honest in that regard. I suggest you seek out Arges to find the answer. If you are truely a friend of Polyphemus he can tell you where to find him.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
			}
		else if (response == "Random guess")
			{
			say("@Your guess is incorrect. I suggest you seek out Arges to find the answer. If you are truely a friend of Polyphemus he can tell you where to find him.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
			}
		else if (response == "Orb of Persuasion")
			{
			say("@You would be correct. I now know that you are truely a friend of my people.@");
			gflags[ENABLE_FULL_COEUS_TALK] = true;
			UI_clear_answers();
			UI_pop_answers();
			break;
			}

	}


}


void Coeus object#(0x45a) ()
	{

var bark = "I mean you no harm";
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
				UI_item_say(item, "I mourn for my people");
			else if (n == 2)
				UI_item_say(item, "Our race is dying");
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
        call Coeus, TALK;
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
		say("@I greet you once more.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@I am peaceful, do not attack.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag







		converse
		{

	if (response == "Bye")
			{
			say("@I wish you luck on your journey.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Coeus.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am one of the keepers of the orbs.@");
			UI_remove_answer("Job");
			UI_add_answer("Orbs");
			}
		else if (response == "Orbs")
			{
			if (gflags[ENABLE_FULL_COEUS_TALK])
				{
				say("@As you are a friend of my people I will answer questions regarding the Orb of Persuasion.@");
				UI_remove_answer("Orbs");
				UI_add_answer("Where is the orb?");
				}
			else
				{
				say("@I will not speak of such matters unless you are a friend of my people.@");
				UI_remove_answer("Orbs");
					if (gflags[TALK_TO_CYCLOPS2])
						{
						UI_add_answer("I am a friend of Polyphemus");
						}
				}
			}
		else if (response == "I am a friend of Polyphemus")
			{
			say("@I am glad to hear this, but I am not yet convinced. If you are truely a friend of my people you will know which orb I am set to protect.@");
			UI_remove_answer("I am a friend of Polyphemus");
			WhichOrb();

				if (gflags[ENABLE_FULL_COEUS_TALK])
					{
					say("@As you are a friend of my people I will answer questions regarding the Orb of Persuasion.@");
					UI_add_answer("Where is the orb?");
					}
			}
		else if (response == "Where is the orb?")
			{
			say("@It is with the greatest of displeasure that I let you know that I no longer possess the orb.@");
			gflags[DRAGON_HAS_ORB] = true;
			UI_remove_answer("Where is the orb?");
			UI_add_answer("What happened?");
			}
		else if (response == "What happened?")
			{
			say("@Long ago when I first settled on this island a marauding band of pirates stumbled acorss me one night as I slept.@");
			say("@With surprise on their side I would be slain had it not been for the dragon Severilous showing up. He slew the pirates and saved my life.@");
			say("@A cyclops is honour bound to reward a rescuer and the only object of value which I possessed was the Orb of Persuasion, so I had no choice but to relinquish it.@");
			UI_remove_answer("What happened?");
			UI_add_answer("Severlious");
			}
		else if (response == "Severlious")
			{
			say("@He lives within the mountain here on the isle. I have been pleading with him for years to return the orb but he will not do so unless he gets something in return.@");
			say("@Unfortunately I do not have anything of value to exchange for it.@");
			say("@If you can retrieve it from him it would be yours to keep as I have failed in my mission. It is better it go to a friend of the cyclops race than a cyclops who fails in his duty.@");
			say("@I trust that a man who is a friend to the cyclops would not abuse the orbs power but if you do recover it do not fall victim to its allure.@");
			UI_remove_answer("Severlious");
			UI_add_answer("Allure");
			UI_add_answer("I will nearly slay him then you can save him");
			}

		else if (response == "Allure")
			{
			say("@I was given the task of protecting the orb due to my sense of duty. I could be trusted not to succumb to the allure and use the orb to achieve my own ends.@");
			say("@If you come into possession, do not fall victim to it. Its power is mesmerizing and even the most skilled of men have difficulty controlling its power.@");
			UI_remove_answer("Allure");
			}

		else if (response == "I will nearly slay him then you can save him")
			{
			say("@Alas, dragons do not follow the same code of honour as the cyclops race and would be under no obligation to relinquish the orb. As well, that would go against the cyclops code of honour.@");
			say("@But I thank you for the thought.@");
			UI_remove_answer("I will nearly slay him then you can save him");
			}

		}
	UI_remove_npc_face(item);
	}
}
