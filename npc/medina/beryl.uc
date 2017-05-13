/*
Beryl at the nautical guild
*/


void Beryl object#(0x49b) ()
	{
var bark = "Halt";
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
				UI_item_say(item, "It is troubled times");
			else if (n == 2)
				UI_item_say(item, "A storm is brewing");
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
        call Beryl, TALK;
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
		say("@Hope the seas has been treating you well.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@What brings a new face to the Nautical Guild?");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@I hope to see you again.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am Beryl.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I do the main office work here in the Nautical Guild.@");
            UI_remove_answer("Job");
            UI_add_answer("Office work");
            UI_add_answer("Nautical Guild");
        }
        else if (response == "Nautical Guild")
        {
            say("@You art in the headquarters of the Nautical Guild. It is here where the decisions are made regarding sea trade.@");
            UI_remove_answer("Nautical Guild");
        }
        else if (response == "Office work")
        {
            say("@Things such as drafting up work orders, comparing vessels trading times and routes, and delegating work to the different Nautical Guild contacts throughout the land. Though I must say it has been rather dull with the lack of sailing recently.@");
            UI_remove_answer("Office work");
            UI_add_answer("Lack of sailing");
        }
        else if (response == "Lack of sailing")
        {
            say("@The pirate LeChuck has managed to create a band of pirates that pillage a large number of ships. Pirates were a nuisance before him but now they are a threat.@");
			say("@We, I mean the Nautical Guild, have now put a bounty on on him.@");
            UI_remove_answer("Lack of sailing");
            UI_add_answer("LeChuck");
            UI_add_answer("Bounty");
        }
        else if (response == "LeChuck")
        {
            say("@Not much is known about him other than he rarely leaves his fortress north of DeathSquall mountain. What is known is that he is ruthless and cunning and a fierce opponent to our guild.@");
            UI_remove_answer("LeChuck");
        }
        else if (response == "Bounty")
        {
            say("@You should take a look at the poster we have posted here in the office. It will offer the details and rewards for the slaying of LeChuck.@");
            UI_remove_answer("Bounty");
        }

		}
	UI_remove_npc_face(item);
	}
	}

