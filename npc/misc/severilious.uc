/*
Severilious with the orb of persuasion on dragon isle
*/


void Severilious object#(0x454) ()
	{

if (UI_is_dead(-304))
	{
	UI_set_schedule_type(-84, 11); // if Artemis is dead set him to loiter again
	}
var bark = "Why do you pester me human?";
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
				UI_item_say(item, "My treasure is great");
			else if (n == 2)
				UI_item_say(item, "Hiss");
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
        call Severilious, TALK;
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
		say("@Again we meet, human.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Why such a lovely morsal of food has wandered into my home.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if (gflags[DRAGON_HAS_ORB]) // If you talked to cyclops to learn dragon has the orb
	{

	if (gflags[KILL_SEV_ORB_TALK]) // removes the orb option if you have already gotten the orb
		{
		}
	else
		{
	UI_add_answer("Orb of Persuasion");
		}
	}

if (UI_is_dead(304))
	{
	UI_set_schedule_type(84, 11); // if Artemis is dead set him to loiter again
	}



		converse
		{

	if (response == "Bye")
			{
			say("@Pray that I do not hunger next time we meet.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@A man asking the name of a dragon? That is quite strange... I am Severilious.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am a dragon. I do not have a job.@");
			UI_remove_answer("Job");
			UI_add_answer("Dragon");
			}
		else if (response == "Dragon")
			{
			say("@That is correct. Such a simple creature men are. You are lucky I am not hungry or you would not have lasted long enough to ask such stupid questions.@");
			UI_remove_answer("Dragon");
			}
		else if (response == "Orb of Persuasion")
			{

			if (gflags[SEV_KILLED_ART])
					{
					say("@As you have brought me Artemis I shall give you the orb. Here it is.@");
					UI_add_party_items(1, ORB_OF_PERSUASION, ANY, ANY);
					UI_remove_answer("Orb of Persuasion");
					gflags[KILL_SEV_ORB_TALK] = true;
					}
				else
				{
					say("@That daft cyclops has sent a man in to try to reclaim the orb from me? I warn you now, I have the orb hidden and if you attack me it shall not be I who is slain.@");
					UI_remove_answer("Orb of Persuasion");
					UI_add_answer("I want the orb");
				}
			}
		else if (response == "I want the orb")
			{
			say("@You don't always get what you want.@");
			UI_remove_answer("I want the orb");
			UI_add_answer("What can I do to get the orb?");
			}
		else if (response == "What can I do to get the orb?")
			{
			say("@Now you are speaking the same tongue as me...@");
			say("@There is a man, Artemis Batbane, who is often employed by the Solusek Mining Company to slay my dragon brethern who live in the caves in which they mine.@");
			say("@I would track him down myself but he is always on the move and your species if more apt to attack me on sight than work with me...@");
			say("@If you were to return to me with him I would grant you possession the orb. I care not how you get him here as long as he is alive.@");
			say("@You can do nothing else in exchange for the orb so do not bother trying to barter with me.@");
			gflags[SEARCH_FOR_ARTEMIS] = true;
			UI_remove_answer("What can I do to get the orb?");
			}
		}
	UI_remove_npc_face(item);
	}
}
