/*

Thern in the Northern forest

*/


void Thern object#(0x55a) ()
	{

var bark = "How are you today?";
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
				UI_item_say(item, "It is difficult work");
			else if (n == 2)
				UI_item_say(item, "A fine spruce");
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
        call Thern, TALK;
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
	say("@It is a fine day is it not?@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Greetings stranger.@");
	UI_set_item_flag(item, MET, true);
	}



		converse
		{
	if (response == "Bye")
			{
			say("@Back to cutting I go.@");
			break;
			}
		else if (response == "Job")
			{
			say("@I am a lumberjack here in the northern forest.@");
			UI_add_answer("Lumberjack");
			UI_add_answer("Northern Forest");
			UI_remove_answer("Job");
			}
		else if (response == "Name")
			{
			say("@Thern, at your service.@");
			UI_remove_answer("Name");
			}
		else if (response == "Lumberjack")
			{
			say("@I am one of the sources of lumber used throughout the lands.@");
			UI_remove_answer("Lumberjack");
			}
		else if (response == "Northern Forest")
			{
			say("@This forest has some of the finesst wood in all the lands. Unfortunately there has been less demand for wood at the moment due to the Nautical Guilds refusal to sail.@");
			say("@But at least the bandits allow us to go about our work.@");
			UI_remove_answer("Northern Forest");
			UI_add_answer("Nautical Guild");
			UI_add_answer("Bandits");
			}
		else if (response == "Nautical Guild")
			{
				say("@Nearly all of the commercial vessels in the lands are a part of the Nautical Guild.@");
				say("@If they ever choose not to sail then most of the trade in the land stops as water is by far the most efficient means to move goods.@");
				say("@So any lack of sea trade puts quite a damper on the wood trade.@");
				UI_remove_answer("Nautical Guild");
			}
		else if (response == "Bandits")
			{
			if (gflags[NORTHERN_BANDITS_DEAD])
				{
				say("@Such a shame the bandits have been defeated. They were good customers and I need all the customers for my logs as possible.@");
				say("@Still, it does put my mind at easy knowing that they cannot tire of us one day and steal whatever we own.@");
				UI_remove_answer("Bandits");
				}
			else
				{
				say("@This forest has a bandit hideout located within it somewhere. They rob weary travellers of possessions and occasionally their life.@");
				say("@I believe the reason they do not trouble us lumberjacks is the require the timber which we provide. It may sound like a terrible thing to say, but we need business to survive.@");
				UI_remove_answer("Bandits");
				}

			}

		}
	UI_remove_npc_face(item);
	}
}
