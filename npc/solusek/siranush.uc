/*
Siranush the desk clerk at Solusek Mining Company
*/


void Siranush object#(0x4da) ()
	{

var flanwald_head = UI_count_objects(PARTY, BODY_PARTS, 1, 5);


var bark = "How can I be of service to you?";
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
				UI_item_say(item, "So much paperwork");
			else if (n == 2)
				UI_item_say(item, "Lots of work to be done");
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
        call Siranush, TALK;
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
		say("@What can I do for you?");
		UI_remove_answer("Name");
	}
else
	{

	say("@May I help you?@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag


// Check if you have flanwald's head in your party

if (flanwald_head > 0)
	{
	UI_add_answer("Collect on Bounty");

	if (gflags[FLANWALD_BOUNTY]) // If you already have been given admittance
		{
		UI_remove_answer("Collect on Bounty");
		}

	}

LookForArtemis(); // Allows the user to find out about artemis batbane for the orb of persuasion sub-quest


		converse
		{

	if (response == "Bye")
			{
			say("@Do return sometime.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@You may call me Siranush.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the clerk here at the Solusek Mining Company. It is my duty to allow entrance only to those who have business here.@");
			UI_remove_answer("Job");
			UI_add_answer("Solusek Mining Company");
			UI_add_answer("Business");
			}
		else if (response == "Solusek Mining Company")
			{
			say("@You have not heard of the Solusek Mining Company? It is the biggest mining company in all of Desporia with over five massive mining operations throughout the land!@");
			say("@I am surprised you have not heard the slander about its founding. It is quite the chitchat.@");
			UI_remove_answer("Solusek Mining Company");
			UI_add_answer("Founding");
	
			}

		else if (response == "Founding")
			{
			say("@Those who would like to see the company fail have started vicious rumours of it being founded by gnomes. At least these tall tales have not damaged the company.@");
			UI_remove_answer("Founding");
			UI_add_answer("Gnomes");

			}
		else if (response == "Gnomes")
			{
			say("@Nasty little creatures. They live deep within mountains and that is why the tale says the company is so good at finding extensive mineral deposits.@");
			say("@The idea of gnomes playing a part in such a reputable business is a bunch of hogwosh if you ask me.@");
			UI_remove_answer("Gnomes");
			
			}

		else if (response == "Business")
			{
			say("@Generally employees are allowed within the main complex if they are of sufficient rank.@");
			say("@However, others on company business are also allowed access. An example would be if one arrives to collect on a bounty.@");
			UI_remove_answer("Business");
			UI_add_answer("Rank");
			UI_add_answer("Bounty");
			}
		else if (response == "Rank")
			{
			say("@The lowest rank that is allowed a key for access is that of a foreman.@");
			UI_remove_answer("Rank");
			}
		else if (response == "Bounty")
			{
			say("@The company is very unforgiving to those who get in the way of its profits. Those that do usually have a bounty placed on their head.@");
			say("@I find it rather unpleasent when one comes to collect on a bounty as they have to bring the head.@");

			// THIS WILL BE FOR A GFLAG TO LET YOU KNOW THERE IS A BOUNTY ON FLANWALD - IF HE IS ALREADY KILLED THE TEXT WILL BE REMOVED
			if (gflags[FLANWALD_BOUNTY])
				{
				}
			else
				{
				say("@There is currently one bounty available. You can view the poster in this room for more information if you desire.@");
				}
		


			UI_remove_answer("Bounty");
			}
		else if (response == "Collect on Bounty")
			{
			say("@Eck. I see you have managed to track down and bring in Flanwald's head. A shame, I always found him to be a rather pleasent fellow.@");
			say("@But I am rambling, please proceed in. You will want to see Gabbie Mardoddle.@");
			gflags[FLANWALD_BOUNTY] = true;
			karma = karma - 250;
			UI_remove_answer("Collect on Bounty");
			}
		else if (response == "Artemis Batbane")
			{
			say("@Artemis has not come to the headquarters in some time. I believe he was going on some sort of mission to the Northern Forest.@");
			UI_remove_answer("Artemis Batbane");
			}



		}
	UI_remove_npc_face(item);
	}
}
