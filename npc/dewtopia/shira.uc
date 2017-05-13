/*
Shira working at the insane asylum
*/

void insanepeople()
{
UI_push_answers();

	UI_add_answer("Yes");
	UI_add_answer("No");	
	converse

	{

if (response == "Yes")
	{
say("@Who would you like to know about?@");
	UI_remove_answer("Yes");
	UI_remove_answer("No");
	UI_add_answer("Picard");
	UI_add_answer("Shatner");
	UI_add_answer("Change subject");
	}

else if (response == "No")
	{
	say("@Very well.@");
	UI_remove_answer("No");
	

		UI_clear_answers();
		UI_pop_answers();
		break;

	}

else if (response == "Picard")
	{
	say("@Poor Picard. He used to be one of the finest officers Dewtopia had. A brilliant tactitian as well as fighter he was.@");
	say("@However, one day he was captured by a band of goblins, and tortured for many moons. He managed to escape, but the torture they inflicted did damage his head.@");
	say("@All day he simply loiters mumbling about there being four lights when in fact there are five, or that the line must be drawn 'here'. I know not where 'here' is.@");
	UI_remove_answer("Picard");
	}
else if (response == "Shatner")
	{
	say("@Shatner, now there is a story and by that I mean, there is no story. He was a mediocre troop who was advanced to the rank of captain too quickly.@");
	say("@On the eve of a battle during his first command, he simply cracked, before the battle I might add. He was brought here and now mutters all day about something on a wing and some fellow named Khan.@");
	UI_remove_answer("Shatner");
	}

else if (response == "Change subject")
	{
	say("@Very well.@");
	UI_remove_answer("No");
	

		UI_clear_answers();
		UI_pop_answers();
		break;
	}



	}
}



void Shira object#(0x407) ()
	{


	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 30)
			{		// Desk work.
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Poor poor souls");
			else if (n == 2)
				UI_item_say(item, "Nay, there are 5 lights");
			
			return;
			}
		else if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
			}
		else
			{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Such a mess");
			else if (n == 2)
				UI_item_say(item, "A lovely day");
			}
		}
	if (event != 1)
		return;
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Do you enjoy taunting the inmates?@");
	}
else
	{

		say("@Welcome to the Dewtopia Insane Asylum.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag






		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@I hope I never see you locked up in here.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@My name is Shira milord.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I administer the Dewtopian Insane Asylum.@");
			UI_remove_answer("Job");
			UI_add_answer("Insane Asylum");
			}
		else if (response == "Insane Asylum")
			{
			say("@The insane asylum is where the unfortunate knights of Dewtopia must go after they no longer become stable.@");
			UI_remove_answer("Insane Asylum");
			UI_add_answer("Knights");
			}
		else if (response == "Knights")
			{
			say("@We currently have two 'guests' which are in for the long haul. Poor fellows went insane after one too many battles with goblins.@");
			
			UI_remove_answer("Knights");
			UI_add_answer("Guests");
			}
		else if (response == "Guests")
			{
			say("@Our current guests are Picard and Shatner. Would you like to know more about them?@");
			insanepeople();
			UI_remove_answer("Guests");
			
			}


		}
	UI_remove_npc_face(item);
	}

