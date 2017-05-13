/*

Minerva in the Northern forest

*/


void Minerva object#(0x55b) ()
	{

var bark = "Why, it is a commoner";
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
				UI_item_say(item, "Chop chop chop");
			else if (n == 2)
				UI_item_say(item, "It is a hot day");
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
        call Minerva, TALK;
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
	say("@Well met.@");
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
			say("@Safe travels.@");
			break;
			}

		else if (response == "Name")
			{
			say("@Minvera, and may I say it is a pleasure to meet you.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I help my husband with the logging.@");
			UI_add_answer("Husband");
			UI_add_answer("Logging");
			UI_remove_answer("Job");
			}
		else if (response == "Logging")
			{
			say("@We cut the trees along with the other lumberjacks here in the Northern Forest for their fine wood.@");
			UI_remove_answer("Logging");
			}
		else if (response == "Husband")
			{
			say("@Dennen is his name. He is the love of my life. I am thankful the bandits leave us be as I do not know what I would do if he fell victim to them.@");
			UI_remove_answer("Husband");
			UI_add_answer("Bandits");
			}

		else if (response == "Bandits")
			{
			if (gflags[NORTHERN_BANDITS_DEAD])
				{
				say("@Word travels quickly about your defeat of the bandit outpost. You have put my mind at ease and for that I thank you.@");
				UI_remove_answer("Bandits");
				}
			else
				{
				say("@Much like the rest of the lands bandits plague the Northern Forest as well.@");
				say("@They leave us be and I do not question their motives for this as it is fine with me.@");
				UI_remove_answer("Bandits");
				}
			}

		}
	UI_remove_npc_face(item);
	}
}
