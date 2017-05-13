/*

Old Man Patterson

*/

void Patterson object#(0x53b) ()
	{

var bark = "What in the blazes do you want?";
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
				UI_item_say(item, "Damn children");
			else if (n == 2)
				UI_item_say(item, "I hate my life");
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
        call Patterson, TALK;
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
	say("@What do you want?@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Have you come to take one of the children?@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Humph.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Patterson.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("I@ run the orphanage and take care of all the brats.@");
			UI_remove_answer("Job");
			UI_add_answer("Brats");
			}
		else if (response == "Brats")
			{
			say("@The brats have lost their parents due to goblins, bandits, and other such things, and then they are given to me to take care of until I can get rid of them.@");
			
			UI_remove_answer("Brats");
			UI_add_answer("Goblins");
			UI_add_answer("Bandits");
			}
		else if (response == "Goblins")
			{
			say("@They attack Dewtopia and kill its citizens, if a child manages to escape one of their slaughters they are given to me to take care of.@");
			UI_remove_answer("Goblins");
			}
		else if (response == "Bandits")
			{
			say("@The Plains Bandits are another cause of orphaned children. They rob and slay the parents leaving me to deal with their bratty offspring.@");
			UI_remove_answer("Bandits");
			}

		}
	UI_remove_npc_face(item);
	}
}
