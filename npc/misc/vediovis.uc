/*
Vediovis - guy to get loots and skills and poCombats etc from if you are bad on karma
*/



void Vediovis object#(0x409) ()
	{

	
var bark = "Another who seeks the path";
var bark_Combatro = "Hail";

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
    say bark_Combatro;
    wait 10;
}
    script item
    {
        wait 5;
        say bark;
        wait 8;
        call Vediovis, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (karma > 4750)
{
	if(karma > 6000)
	{
    var facing = SOUTH;
    say("@I care not for the path you follow. I cast you out!@");
	UI_play_sound_effect(81);
    UI_move_object(PARTY, [1286, 1593, 0]);
    GenericPaletteFade(facing);

    UI_sprite_effect(7, 1286, 1593, 0, 0, 0, -1);
	}
	else
	{
	    say("@Return when you have decided to follow my path.@");
	}
}
else
{

/*

THIS SECTION CONTAINS A JUMBLE OF CODE THAT WILL SET FLAGS AND SUCH DEPENDING ON WHETHER OR NOT YOUR KARMA IS
AT A CERTAIN LEVEL. IF YOU VISIT THIS NPC WHILE THE KARMA IS LOWER THAN A SELECTED VALUE IT SHOULD STILL HIT
THE PREVIOUS VALUES WHICH YOU MISSED TO TRIGGER THE FLAG SO YOU CAN STILL GET THE BENEFIT

*/

if (karma < 4400)
{
    if (gflags[BAD1])
    {
    }
    else
    {
        say("@I sense that you have been following the path of your desires. I shall grant you aid in travelling this path.@");
        UI_set_npc_prop(AVATAR, EXPERIENCE, 100); // Give 100 EXP for being evil
		var currentCombat = UI_get_npc_prop(AVATAR, COMBAT);
		if(currentCombat == 30)
		{
		}
		else
		{
			UI_set_npc_prop(AVATAR, COMBAT, 1); // give 1 to combat
		}
        gflags[BAD1] = true;
    }
}
if (karma < 4100)
{
        if(gflags[BAD2])
        {
        }
        else
        {
            say("@You are progressing nicely. You are truely on a path of greatness.@");
            UI_set_npc_prop(AVATAR, EXPERIENCE, 200); // Give 200 EXP for being evil
			var currentTrain = UI_get_npc_prop(AVATAR, TRAINING);
			if(currentTrain == 30)
			{
			}
			else
			{
				UI_set_npc_prop(AVATAR, TRAINING, 1); // give 1 to training
			}
			
			var currentStr = UI_get_npc_prop(AVATAR, STRENGTH);
			if(currentStr == 30)
			{
			}
			else
			{
				var maxStr = (30-currentStr);
				if (maxStr > 2)
					maxStr = 2;
				
				UI_set_npc_prop(AVATAR, STRENGTH, maxStr);
			}
            gflags[BAD2] = true;
        }
}

if (karma < 3700)
{
        if(gflags[BAD3])
        {
        }
        else
        {
            say("@Yes, yes I can sense how you love to show others that you are the strongest, the smartest, and the meanest.@");
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
            gflags[BAD3] = true;
        }
}

if (karma < 3300)
{
        if(gflags[BAD4])
        {
        }
        else
        {
            say("@You take what you want, when you desire it. You crave to not only be master of yourself but others as well.@");
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
			
			var currentCombat = UI_get_npc_prop(AVATAR, COMBAT);
			if(currentCombat == 30)
			{
			}
			else
			{
				var maxCombat = (30-currentCombat);
				if (maxCombat > 4)
					maxCombat = 4;
					
				UI_set_npc_prop(AVATAR, COMBAT, maxCombat);
			}
            gflags[BAD4] = true;
        }
}

if (karma < 2900)
{
        if(gflags[BAD5])
        {
        }
        else
        {
            say("@I can see it within yourself. The burning to be more than a humble subject. You wish to be the ruler.@");
			var currentCombat = UI_get_npc_prop(AVATAR, COMBAT);
			if(currentCombat == 30)
			{
			}
			else
			{
				var maxCombat = (30-currentCombat);
				if (maxCombat > 2)
					maxCombat = 2;
					
				UI_set_npc_prop(AVATAR, COMBAT, maxCombat);
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
            gflags[BAD5] = true;
        }
}

if (karma < 2500)
{
        if(gflags[BAD6])
        {
        }
        else
        {
            say("@You have reached epiphany of your chosen path. View yourself in the mirror to see if you are truely worthy of this path.@");
			var currentStr = UI_get_npc_prop(AVATAR, STRENGTH);
			if(currentStr == 30)
			{
			}
			else
			{
				var maxStr = (30-currentStr);
				if (maxStr > 2)
					maxStr = 2;
					
				UI_set_npc_prop(AVATAR, STRENGTH, maxStr);
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
            gflags[BAD6] = true;
            gflags[KARMA_TEST_EVIL] = true;
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
			say("@My my, aren't you the impertinent one. My how I do enjoy it. I am Vediovis.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I possess many jobs... but the job that you need of me is to guide and aid you in your quest for what you desire.@");
			UI_remove_answer("Job");
			UI_add_answer("Guide");
			UI_add_answer("Desire");
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
                say("@You have already chosen the path which I shall help guide you through. Continue to give Combato your primordial urges and do what you truely desire.@");
                UI_remove_answer("Paths I may take");
            }
            else if (response == "Desire")
            {
                say("@You do not need to give Combato what others expect of you. Take what you want, give what you do not want, or keep it because you do not wish to part with it.@");
				say("@It is all up to you, not what others desire.@");
                UI_remove_answer("Desire");
            }
        }
		}
	UI_remove_npc_face(item);
	}
}
