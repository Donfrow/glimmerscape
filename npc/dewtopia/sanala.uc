void Sanala object#(0x524) ()
{

var n = UI_get_random(3);// 1-3.


	if (event == 0)
		{
            if(gflags[CAMILLE_CAUGHT])
            {
                if (UI_get_schedule_type(item) == SLEEP)
                {
                    UI_item_say(item, "Zzzz...");
                    return;
                }

                if (n == 1)
                    UI_item_say(item, "Thank the heavens!");
                else if (n == 2)
                    UI_item_say(item, "It is lovely to see the sky again");
                else if (n == 3)
                    UI_item_say(item, "I love my freedom");

            return;
            }
            else
            {
                if (UI_get_schedule_type(item) == SLEEP)
                {
                    UI_item_say(item, "Zzzz...");
                    return;
                }

                if (n == 1)
                    UI_item_say(item, "Curse that Lord Dew");
                else if (n == 2)
                        UI_item_say(item, "One of these days...");
                else if (n == 3)
                    UI_item_say(item, "I am innocent!");

            }
		}

	UI_show_npc_face(item);

if (event == DOUBLECLICK)
{

var bark_intro = "Hail,";
var bark = "Yes?";

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
        call Sanala, TALK;
    }
    abort;
}

else if (event == TALK)
{

UI_add_answer("Name");
UI_add_answer("Job");
UI_add_answer("Bye");	
		
if (gflags[CAMILLE_CAUGHT]) // Conversation if Camille is in the Sugar Caves
{

    if (UI_get_item_flag(item, MET))
	{
        say("@Welcome back noblest knight!@");
        UI_remove_answer("Name");
	}
    else
	{
        say("@Greetings.@");
        UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	
	converse
	{
        if (response == "Bye")
        {
            say("@Farewell noble knight.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am still Sanala.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@Thanks to you I am once again the royal cook here in Castle Dew. I cannot thank you enough.@");
            UI_remove_answer("Job");
            UI_add_answer("You are welcome");
        }
        else if (response =="You are welcome")
        {
            say("@Never did I expect to be cleared of the charges and set free from teh Sugar Caves. Had you not listened to my tale of woe I am sure I would spend the rest of my life within them.@");
            say("@You will always hold a special spot in my heart.");
            UI_remove_answer("You are welcome");
        }
    }
}
else
{
    if (UI_get_item_flag(item, MET))
    {
        say("@Still gloating over us poor convicts are ye?@");
        UI_remove_answer("Name");
	}
else
	{
        say("@Come to gloat about your liege Lord Dew, scum knight?@");
        UI_set_item_flag(item, MET, true);
	}
	
    // End opening if
    
    converse
    {
        if (response == "Bye")
        {
            say("@Back to toiling I will go...@");
            break;
        }
        else if (response == "Name")
        {
            say("@Look at the prisoner roster scum... surely you will find Sanala on it...@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@You ask me about my job? Ha! Before I was tossed into this infernal place I was the royal cook at Castle Dew.@");
            UI_remove_answer("Job");
            UI_add_answer("Royal cook");
        }
        else if (response == "Royal cook")
        {
            say("@Before that harpy Camille set me up I cooked the finest meals in Dewtopia for Lord Dew, a leader I once revered. Now I spit upon his name!@");
            UI_remove_answer("Royal cook");
            UI_add_answer("Lord Dew");
            UI_add_answer("Camille");
        }
		else if (response == "Lord Dew")
        {
			say("@That scum sucker. He was kind enough to take me in to be his royal cook, but after I was framed he sent me to the Sugar Caves where you find me now.@");
			UI_remove_answer("Lord Dew");
			UI_add_answer("Sugar Caves");
        }
		else if (response == "Sugar Caves")
        {
			say("@You are truely daft. You are in them now. Not only that but these caves are also the source of Dewtopia's wealth, all off the labour of those dubiously convicted under Lord Dew's rule.@");
            UI_remove_answer("Sugar Caves");
        }
        else if (response == "Camille")
        {
            say("@That harpy snuck into the castle one night and placed a mirror of mine under the door to the Royal Mint's working room where that oaft Brunt saw it.@");
            say("@Brunt, being all bronze and no speed only managed to get to the door by the time Camille had already fled.@");
            say("@Naturally, with it being my mirror under the door Brunt immediately claimed he had seen me attempting to stake out the mint@");
			say("@Even going as far to claim that I was a Plains Bandit who had infultrated the castle.@");
			say("@I was then sent here to toil shortly after.@");
			UI_remove_answer("Camille");
			UI_add_answer("How do you know it is Camille");
			gflags[RUMORS] = true;
        }
		else if (response == "How do you know it is Camille")
        {
			say("@Before I was the Royal Cook I was but a farmer outside the walls. Those outside the walls see plenty of Plains Bandits activity.@");
			say("@One day I happened to witness a heist of one of the farmers when I was returning from the well with some water.@");
			say("@After the brutes had torn everything of value from the poor farmer Camille showed her face and shoved a dagger in the poor mans back.@");
			say("@Knowing that she is now the Royal Cook it is not difficult to discern she is doing the actual stakeout for the Plains Bandits.@");
			say("@If I was not stuck in these blasted caves I would find some proof to clear my name but Lord Dew the Fool has prevented that.@");
			UI_remove_answer("How do you know it is Camille");
			gflags[CAMILLE_ACCUSED] = true;

        }
    }
	
}



}
	UI_remove_npc_face(item);
	}

