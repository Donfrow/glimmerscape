/*
Akakothen
*/

void Akakothen object#(0x408) ()
	{

var party = UI_get_party_list();
var cnt = UI_get_array_size(party);
var rand;
	
	
var bark = "Who dares speak to me?";
var bark_intro = "Hail shade";
var has_soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);

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
				UI_item_say(item, "Uggh");
			else if (n == 2)
				UI_item_say(item, "Oumm");
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
        call Akakothen, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);




if (gflags[BASEMENT_OF_CASTLE])
{
    UI_add_answer("Orb of Infinity");
}


if (gflags[TALKED_TO_AKAKOTHEN1])
    {
        say("@You will not get the secrets of the Orb from me!@");
    }
else
{
        say("@Who dares disturb the MageLord Akakothen?@");
}

if (gflags[ORB_ON_AK])
{
    UI_add_answer("Three artifacts");
}
if(gflags[LEARN_OF_WORDS])
{
	UI_add_answer("Incantation");
}

if (has_soul_orb > 0)
    {
        UI_play_music(64);


		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

		         	converse
	           	{
		
    			



	if (response == "Bye")
			{
			say("@Your insolence shall not be forgotten.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am MageLord Akakothen my naive subject.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the MageLord of the Ophidian Empire.@");
			UI_remove_answer("Job");
			UI_add_answer("Ophidians");

			}
		else if (response == "Ophidians")
			{
            say("@My empire is vast and great. My greatness spans the lands.@");
			UI_remove_answer("Ophidians");
			}
		else if (response == "Orb of Infinity")
		{
            say("@My Orb...@");
            UI_remove_answer("Orb of Infinity");
            UI_add_answer("Construct the Orb");
	    }
	    else if (response == "Construct the Orb")
	    {
	       say("@I constructed the orb by combining the five minor orbs with the three artifacts...@");
	       UI_remove_answer("Construct the Orb");
	       UI_add_answer("Three artifacts");
	    }
	    else if (response == "Three artifacts")
	    {
	       if (gflags[ORB_ON_AK])
            {
                say("@My artifacts are lost. Pillaged, ransacked, taken from my side.@");
                UI_remove_answer("Three artifacts");
                UI_add_answer("What are they?");
                UI_add_answer("Where are they?");
            }
	       else
	       {
	       say("@My artifacts! What has become of them? What have you done with them! Why are you enquiring about the Orb?! You want to construct the orb and take its power from me!@");
		   say("@You will not steal my Orb!@");

			if (cnt == 1) // Only Avatar in the Party
			{
				AVATAR.say("@He seems to know something but will not speak it. I should report this back to Zorphos.@");
			}
			else
			{
				RandomPartySay("@He seems to know something but will not speak it. We should report this back to Zorphos.@");
			}
			gflags[TALKED_TO_AKAKOTHEN1] = true;
			break;
					}
        }
        else if (response == "What are they?")
        {
            say("@My artifacts are mighty sources of power, forged by those long before me. The mighty hammer, flux capacitor and ring.@");
            gflags[ORB_ON_AK] = false;
            UI_remove_answer("What are they?");
        }
        else if (response == "Where are they?")
        {
            say("@Pillaged and ransacked, taken from their rightful place in my lab... but the whispers in the planes have seen them! They are not destroyed, merely taken from their rightful owner!@");
            say("@The whispers see them, on display for mere mundanes to gawk at... collections of the rich but unskilled... odd creature with wings and glitter... or have they left such states?@");
			say("@The whispers do not say...@");
            say("@But why do I tell this to you? I sense... I sense that you are using my own creation on me! Begone! I would destroy you here and now if not for the cursed temporal state which I am trapped!@");
            gflags[ORB_ON_AK] = false;
            gflags[ARTIFACT_LOCS] = true; // Lets you speak to Zorphos about this
            break;
        }
        else if (response == "Incantation")
        {
			say("");
        }

 
                   }

		}
		
else
{
    say("@I... cannot speak...@");
}		
		
	UI_remove_npc_face(item);
	}
    }
