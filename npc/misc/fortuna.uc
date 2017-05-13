/*
Fortuna - woman to get loots and skills and points etc from if you are good on karma
*/



void Fortuna object#(0x4c5) ()
	{

var bark = "You...";
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
				UI_item_say(item, "Yes yes");
			else if (n == 2)
				UI_item_say(item, "It is the time");
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
        call Fortuna, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (karma < 5250)
{
	if(gflags[SPOKE_WITH_ARTHIS_1])
	{
		say("@I sense you have come looking for something for your evil ways. Begone before I dispatch of you myself.@");
		converse(["Bye", "Donal's Breastplate of Mourning"])
		{
			case "Bye" (remove):
			say("@Do not return to this area of peace.@");
			break;
			
			case "Donal's Breastplate of Mourning" (remove):
			say("@Your corruption will not feed upon the goodness of the armour. Now begone or your dark heart shall be forcibly removed.@");
			add(["Tell me or die"]);
			UI_remove_answer("Bye");
			
			case "Tell me or die" (remove):
			say("@Your dark heart cannot bring harm to me for I am protected by the light.@");
			say("Suddenly Fortuna shutters. @I sense you possess the artifact of pain and misery brought about by Arthis... begone!@");
			break;
		}
	}
	else
	{
		if(karma > 5000)
		{
			say("@Return to me when you have decided to follow the path of light.@");
		}
		else
		{
			say("@You have chosen a path to follow which I cannot in good concious aid you with. Please be on your way.@");
		}
	}
}
else
{

/*

THIS SECTION CONTAINS A JUMBLE OF CODE THAT WILL SET FLAGS AND SUCH DEPENDING ON WHETHER OR NOT YOUR KARMA IS
AT A CERTAIN LEVEL. IF YOU VISIT THIS NPC WHILE THE KARMA IS LOWER THAN A SELECTED VALUE IT SHOULD STILL HIT
THE PREVIOUS VALUES WHICH YOU MISSED TO TRIGGER THE FLAG SO YOU CAN STILL GET THE BENEFIT

*/

if (karma > 5600)
{
    if (gflags[GOOD1])
    {
    }
    else
    {
        say("@I sense that you have been following the path which aids others. I shall aid you on your quest.@");
        UI_set_npc_prop(AVATAR, EXPERIENCE, 100); // Give 100 EXP for being good
		
		var currentInt = UI_get_npc_prop(AVATAR, INTELLIGENCE);
		if(currentInt == 30)
		{
		}
		else
		{
			UI_set_npc_prop(AVATAR, INTELLIGENCE, 1); // give 1 to int
		}
        gflags[GOOD1] = true;
    }
}
if (karma > 5900)
{
        if(gflags[GOOD2])
        {
        }
        else
        {
            say("@Your heart continues to speak volumes of your character. I shall aid your journey.@");
            UI_set_npc_prop(AVATAR, EXPERIENCE, 200); // Give 200 EXP for being good
			
			var currentTrain = UI_get_npc_prop(AVATAR, TRAINING);
			if(currentTrain == 30)
			{
			}
			else
			{
				UI_set_npc_prop(AVATAR, TRAINING, 1); // give 1 to training
			}
			
			var currentMaxMana = UI_get_npc_prop(AVATAR, MAX_MANA);
			if(currentMaxMana == 30)
			{
			}
			else
			{
				var maxMana = (30-currentMaxMana);
				if (maxMana > 2)
					maxMana = 2;
					
				UI_set_npc_prop(AVATAR, MAX_MANA, maxMana);
			}
            gflags[GOOD2] = true;
        }
}

if (karma > 6300)
{
        if(gflags[GOOD3])
        {
        }
        else
        {
            say("@You have shown much compassion and caring. May your journey be fruitful.@");
 			var currentTrain = UI_get_npc_prop(AVATAR, TRAINING);
			if(currentTrain == 30)
			{
			}
			else
			{
				var maxTrain = (30-currentTrain);
				if (maxTrain > 2)
					maxTrain = 2;
					
				UI_set_npc_prop(AVATAR, TRAINING, maxTrain);
			}
            gflags[GOOD3] = true;
        }
}

if (karma > 6700)
{
        if(gflags[GOOD4])
        {
        }
        else
        {
            say("@You are truely a caring soul. You will not give into your impulses and make rash judgements.@");
			
			
 			var currentTrain = UI_get_npc_prop(AVATAR, TRAINING);
			if(currentTrain == 30)
			{
			}
			else
			{
				var maxTrain = (30-currentTrain);
				if (maxTrain > 2)
					maxTrain = 2;
					
				UI_set_npc_prop(AVATAR, TRAINING, maxTrain);
			}
			
			var currentMaxMana = UI_get_npc_prop(AVATAR, MAX_MANA);
			if(currentMaxMana == 30)
			{
			}
			else
			{
				var maxMana = (30-currentMaxMana);
				if (maxMana > 4)
					maxMana = 4;
					
				UI_set_npc_prop(AVATAR, MAX_MANA, maxMana);
			}
			
            gflags[GOOD4] = true;
        }
}

if (karma > 7100)
{
        if(gflags[GOOD5])
        {
        }
        else
        {
            say("@You have set your sights on the principles of kindness and generosity and are nearly able to comprehend them in their fullest.@");
			
			
			var currentInt = UI_get_npc_prop(AVATAR, INTELLIGENCE);
			if(currentInt == 30)
			{
			}
			else
			{
				var maxInt = (30-currentInt);
				if (maxInt > 2)
					maxInt = 2;
					
				UI_set_npc_prop(AVATAR, INTELLIGENCE, maxInt);
			}

			var currentDex = UI_get_npc_prop(AVATAR, DEXTERITY);
			if(currentDex == 30)
			{
			}
			else
			{
				var maxDex = (30-currentDex);
				if (maxDex > 2)
					maxDex = 2;
					
				UI_set_npc_prop(AVATAR, DEXTERITY, maxDex);
			}
			
            gflags[GOOD5] = true;
        }
}

if (karma > 7500)
{
        if(gflags[GOOD6])
        {
        }
        else
        {
            say("@You have reached enlightenment of your chosen path. View yourself in the mirror to see if you are truely one to take this path.@");
			var currentInt = UI_get_npc_prop(AVATAR, INTELLIGENCE);
			if(currentInt == 30)
			{
			}
			else
			{
				var maxInt = (30-currentInt);
				if (maxInt > 2)
					maxInt = 2;
				
				UI_set_npc_prop(AVATAR, INTELLIGENCE, maxInt);
			}

			var currentDex = UI_get_npc_prop(AVATAR, DEXTERITY);
			if(currentDex == 30)
			{
			}
			else
			{
				var maxDex = (30-currentDex);
				if (maxDex > 2)
					maxDex = 2;
					
				UI_set_npc_prop(AVATAR, DEXTERITY, maxDex);
			}
            gflags[GOOD6] = true;
            gflags[KARMA_TEST_GOOD] = true;
        }
}

/*

END OF MASSIVE JUMBLE OF KARMA CHECKING CODE

*/

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");

if (UI_get_item_flag(item, MET)) 
	{
		say("@Continue to follow your path..@");
		UI_remove_answer("Name");
	}
else
	{

	say("@I sense that are following the one true path.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{

	if (response == "Bye")
			{
			say("@Do not lose sight of what you want.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@My fine adventurer, I am known as Fortuna.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I possess many jobs... but the job that you need of me is to guide and aid you in your quest for light.@");
			UI_remove_answer("Job");
			UI_add_answer("Guide");
			}
			else if (response == "Guide")
			{
                say("@There are several of us who see the eventual path you must end up on but how you arrive at that path is up to you. I shall aid you if you continue to follow the path you are on now.@");
                UI_remove_answer("Guide");
                UI_add_answer("Path");
            }
            else if (response == "Path")
            {
                say("@None shall dare speak of the final path, but we shall freely speak of the many paths you may take.@");
                UI_remove_answer("Path");
                UI_add_answer("Paths I may take");
            }
            else if (response == "Paths I may take")
            {
                say("@You have already chosen the path which I shall aid you with. Continue to give into the goodness of your heart.@");
                UI_remove_answer("Paths I may take");
            }
            else if (response == "Light")
            {
                say("@You do not need to give into the darkness of greed and lust. Kindness is a path you can follow, aiding those in need. Never forget that true goodness comes from within.@");
                UI_remove_answer("Light");
            }
        }
		}
	UI_remove_npc_face(item);
	}
}
