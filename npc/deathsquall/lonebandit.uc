/*
Lone Bandit in the basement at the abandoned mining outpost
*/


void LoneBandit object#(0x40f) ()
	{

var bark = "Eek!";
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
				UI_item_say(item, "I am scared");
			else if (n == 2)
				UI_item_say(item, "Why did I ever join the bandits");
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
        call LoneBandit, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Please, do not let the beasts know I am down here.@");
	}
else
	{

	say("@Eeeek!@");
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
			say("@Mommy...@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I dare not tell you.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("The man stammers. @I... I was a bandit here on Deathscorn island. Please do not hurt me. I am all alone now. Everyone else is dead. Dead!@");
			UI_remove_answer("Job");
			UI_add_answer("Bandit");
			UI_add_answer("DeathScorn Island");
			}
		else if (response == "DeathScorn Island")
			{
			say("@We heard that the Solusek Mining Company had set up an operation on this island. We came in hopes of plundering some valuable loot.@");
			UI_remove_answer("DeathScorn Island");
	
			}

		else if (response == "Bandit")
			{
			say("@We came to the island too late, only to discover that the Solusek Mining Company had abandoned their operation. We set up our headquarters in the old mining outpost you are in now.@");

			say("@It seems I am the last one to have survived..@");
			
			UI_remove_answer("Bandit");
			UI_add_answer("Survived");
			}
		else if (response == "Survived")
			{
			say("@When we learned the company had left, we decided to see if we could salvage anything from the mine itself. We broke down the gate to the north and before we knew it beasts were swarming us.@");
			say("@The beasts butchered us without hesitation and it was then I ran to escape the carnage. There is no honour amoung theives after all.@");
			UI_remove_answer("Survived");
				if (gflags[BANDIT_STRUCTURE1])
					{
					UI_add_answer("What happened to your leader?");
					}
			}

		else if (response == "What happened to your leader?")
			{
			say("@Last I saw of him he was screaming in pain as the beasts dragged him into the cave. I am sure his corpse and possessions are in there somewhere.@");
			UI_remove_answer("What happened to your leader?");
			}


		}
	UI_remove_npc_face(item);
	}
}
