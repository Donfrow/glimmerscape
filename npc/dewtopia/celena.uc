/*
Celena the Royal Mint worker 
*/


void Celena object#(0x4fb) ()
	{
	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 30)
			{		// Desk work.
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "I've lost one of my forms!");
			else if (n == 2)
				UI_item_say(item, "pass 2 carry the y drop the x...");
			
			return;
			}
		else if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "zzz");
			return;
			}
		else
			{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Such a wonderful day");
			else if (n == 2)
				UI_item_say(item, "Hail Lord Dew!");
			}
		}
	if (event != 1)
		return;
	UI_show_npc_face(item);

if (UI_get_item_flag(item, 28)) 
	{
	say("@Welcome back.@");
	UI_add_answer("Exchange");
	}
else
	{
	say("@Welcome to the Dewtopian Mint@");
	UI_set_item_flag(item, 28, true);
		}
// End MET Flag

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{
	if (response == "Bye")
			{
			say("@Enjoy your day.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Celena.@");
			UI_remove_answer("Name");
			
			}
		else if (response == "Job")
			{
			say("@I do the administrative work for the Royal Mint here in Dewtopia for Lord Dew.@");
			say("@I can also exchange gold nuggets and bars for gold coins.@");
			UI_remove_answer("Job");
			UI_add_answer("Exchange");
			UI_add_answer("Royal Mint");
			UI_add_answer("Dewtopia");
			UI_add_answer("Lord Dew");
			}
		else if (response == "Royal Mint")
			{
			say("@The Royal Mint contains all of the treasures of Dewtopia, from gold coins to gold bars.@");
			say("@It is also guarded by a strong man named Brunt.@");
			UI_remove_answer("Royal Mint");
			UI_add_answer("Brunt");
			}
		else if (response == "Brunt")
			{
			say("@He is a strong and forceful man who guards the mint every hour of every day with aid of some sort of elixer.@");
			UI_remove_answer("Brunt");
			UI_add_answer("Elixir");
			}
		else if (response == "Elixir")
			{
				if (gflags[GAVE_BRUNT_POTION])
				{
				say("@I heard the Bedic adjusted the recipe he used for the exilir. Hopefully this will help Brunt.@");
				say("She leans into you. @To be honest, he was starting to scare me a little.@");
				UI_remove_answer("Elixir");
				}
				else
				{
				say("@I know not what it contains but I do believe he is slowly driving him mad...@");
				say("@Perhaps someone should speak to Bedic about it.@");
				gflags[POTION_QUEST] = true; // setting elixer quest into play
				UI_remove_answer("Elixir");
				}
			}
		else if (response == "Dewtopia")
			{
			say("@Dewtopia is the city in which you stand in right now.@");
			UI_remove_answer("Dewtopia");
			}
		else if (response == "Lord Dew")
			{
			say("@Lord Dew is a kind and generous leader. He lets me work and live in his castle.@");
			say("@Though at night I sometimes hear strange noises coming from his room...@");
			UI_remove_answer("Lord Dew");
			UI_add_answer("Strange Noises");
			}
		else if (response == "Strange Noises")
			{
			say("@They sound like words, yet are not. Things like dewak, caw and chicky.@");
			UI_remove_answer("Strange Noises");
			}

		else if (response == "Exchange")
			
			{
				 if (UI_get_schedule_type(item) == 30) // Desk Work
					{
					    var nugget_rate = 20;
					    var bar_rate = 120;
					exchange_gold(nugget_rate, bar_rate);
					}
				else {
					say("@I am not doing exchanges right now. Please return 6AM and 6PM.@");
					UI_remove_answer("Exchange");
					}
			}

		}
	UI_remove_npc_face(item);
	}

