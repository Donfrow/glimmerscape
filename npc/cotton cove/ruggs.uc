/*
Ruggs outside Cotton Cove
*/

void Ruggs object#(0x43b) ()
	{

var bark = "Well met.";
var bark_intro = "Hail,";

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
				UI_item_say(item, "The crop is coming nicely.@");
			else if (n == 2)
				UI_item_say(item, "Nice day");
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
        call Ruggs, TALK;
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
		say("@Nice to see you again.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Welcome, stranger.@");
		UI_set_item_flag(item, MET, true);
	}
	
if(gflags[KILL_PLAINSRIDER_HECTAR] || gflags[KILL_PLAINSRIDER])
{
	if(UI_is_dead(-500))
	{
	}
	else
	{
		add(["The Plains Rider"]);
	}
}
	
// End MET Flag


		converse
		{
        if (response == "Bye")
        {
            say("@Do be careful of goblins and bandits.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I be known as Ruggs.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am but a simple farmer here outside of Cotton Cove. I am also the husband of Larianna and father of Bugsy.@");
            UI_remove_answer("Job");
            UI_add_answer("Cotton Cove");
            UI_add_answer("Larianna");
            UI_add_answer("Bugsy");
        }
        else if (response == "Cotton Cove")
        {
            say("@Cotton Cove is the town across the bridge by our small village. The bridge allows them to be protected from goblins and bandits in the event of an attack.@");
            UI_remove_answer("Cotton Cove");
            UI_add_answer("Goblins");
            UI_add_answer("Bandits");
        }
        else if (response == "Goblins")
        {
            if (gflags[GOBLINS_DEFEATED])
            {
                say("@I have heard word from Dewtopia that the goblins have been defeated! While their kind may still exist, they are no longer the threat they once were.@");
            }
            else
            {
                say("@Goblins are nasty creatures from a mountain range near the Northern Forest. They have been expanding their territory lately and seem to be in constant conflict with Dewtopia.@");
            }
            UI_add_answer("Dewtopia");
            UI_remove_answer("Goblins");
        }
        else if (response == "Dewtopia")
        {
            say("@Dewtopia is a thriving city to the east of here. You can find it if you follow the paths and signs.@");
            UI_remove_answer("Dewtopia");
        }
        else if (response == "Bandits")
        {
            if(gflags[BANDITS_DEFEATED])
            {
            }
            else
            {
                say("@The Plains Bandits are men and women of cunning wit and fast daggers. I hope you do not run into them for they will slay you for a single gold coin.@");
            }
            UI_remove_answer("Bandits");
        }
        else if (response == "Larianna")
        {
            say("@Larianna is the love of my life. I would die for her.@");
            UI_remove_answer("Larianna");
        }
        else if (response == "Bugsy")
        {
            say("@He is my son. I hope that I can give him a better childhood than I had.@");
            UI_remove_answer("Bugsy");
        }
		else if (response == "The Plains Rider")
		{
			say("@That is a name I have not heard that mentioned in some time. In fact, I have not heard that name since we ran that fellow out of town.@");
			UI_remove_answer("The Plains Rider");
			UI_add_answer("Ran out of town");
		}
		else if (response == "Ran out of town")
		{
			say("@That fellow tried to rob us blind. When he threatened us we banded together and ran him off. Last I saw he was fleeing south as fast as he could go.@");
			say("@No different than a common bandit if you ask me.@");
			UI_remove_answer("Ran out of town");
		}


		}
	UI_remove_npc_face(item);
	}
	   }

