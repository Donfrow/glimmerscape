/*
Zabriana the cook in Solusek Mining Co.
*/

void quicktalk()
{




UI_push_answers();

UI_add_answer("I are stupid");
UI_add_answer("Uhh");
UI_add_answer("Bake me a cake!");
	
	converse
	{
	if (response == "I are stupid")
		{
		say("Of that I can tell.");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}
	else if (response == "Uhh")
		{
		say("Thou seem to be short on brain cells. Just how did thee get in here anyway?");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}
	else if (response == "Bake me a cake!")
		{
		say("I do not work for thee!");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}
	}

}

void bribetalk()
{

var bribe_money = UI_count_objects(AVATAR, SHAPE_GOLD, 50, ANY);
var bribe_key = UI_count_objects(AVATAR, SHAPE_GOLD, 250, ANY);

UI_push_answers();

UI_add_answer("Uhh");
UI_add_answer("Aye");
UI_add_answer("Bake me a cake!");
	
	converse
	{
	if (response == "Uhh")
		{
		say("Thou stammer. Even if I could be bought I would not want a stammering idiot to have sensitive information. I would lose my job!");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}
	else if (response == "Aye")
		{
		say("Thou would be correct... for the right price.");
		UI_remove_answer("Aye");
		UI_remove_answer("Uhh");
		UI_remove_answer("Bake me a cake!");
		UI_add_answer("Price");
		}
	else if (response == "Bake me a cake!")
		{
		say("What is thy fascination with cakes?");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}
	else if (response == "Price")
		{
		say("For some information I would require fifty gold pieces. Take it or leave it.");
		UI_remove_answer("Price");
		UI_add_answer("Take it");
		UI_add_answer("Leave it");
		}
	else if (response == "Leave it")
		{
		say("Very well... tis your choice.");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}
	else if (response == "Take it")
		{

		if (gflags[PAID_ZAB])
			{
			say("As thou hath already paid me for knowledge, I will go over the artifact again.");
			say("It seems this item allows the company to transform the environment and turn even useless rock into precious metals.");
			UI_add_answer("Where is this artifact?");
			}
			
		else if (hasGold(50))

			{
			say("Thank thee for the gold! Now, apparantly there is some sort of magical artifact that the company uses to increase their profits.");
			say("From what I gather this artifact is able to transform the environment in which it is placed! This allows them to create precious metals out of even the most useless rocks over time!");
			gflags[PAID_ZAB] = true;
			UI_remove_party_items(PARTY, SHAPE_GOLD, 50, ANY); // Takes the 50 gold away
			UI_remove_answer("Take it");
			UI_add_answer("Where is this artifact?");
			
			}

		else
			{
			say("Thou do not have enough coin! Come back when thou can afford it.");
			UI_clear_answers();
			UI_pop_answers();
			break;
			}

		}
	else if (response == "Where is this artifact?")
		{
			
		say("It is around in the building... but thou need a key to access it.");
		UI_remove_answer("Where is this artifact?");
		UI_add_answer("Key");

		}

	else if (response == "Key")
		{
		say("One would need a key which is kept in Gabbie's room... now, she doth keep the door to her room locked but being as I clean her room I have a key.");
		say("I could @lose@ my key to though for say, 250 gold coins.");
		UI_remove_answer("Key");
		UI_add_answer("Pay");
		UI_add_answer("I will not pay!");
		}
	else if (response == "Pay")
		{
		
			if (bribe_key > 249)
				{
				say("Oops, it seems thou hath found a key. Guess I will have to get a new one...");
				say("And if thee lose that one and want another, thee will have to pay again.");
				say("But now we speak no more of this.");
				UI_remove_party_items(PARTY, SHAPE_GOLD, 250, ANY); // Takes the 250 gold away
				UI_add_party_items(PARTY, KEY, 22, 2);
				UI_clear_answers();
				UI_pop_answers();
				break;
				}
			else
				{
				say("Thou do not have enough!");
				UI_clear_answers();
				UI_pop_answers();
				break;
				}

		}

	else if (response == "I will not pay!")
		{
		say("Tis your choice.");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}




	}

}


void Zabriana 0x4c4 ()
	{


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
				UI_item_say(item, "It's a piece of cake to bake a pretty cake");
			else if (n == 2)
				UI_item_say(item, "The food is good");
			}
		}
	if (event != 1)
		return;
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("Please, be brief I hath much work to do.");
	}
else
	{

	say("Did thou know it's a piece of cake to bake a pretty cake?");
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
			say("Farewell");
			
			break;
			}
		else if (response == "Name")
			{
			say("I am Zabriana.");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("I am the cook here in the Solusek Mining Company headquarters.");
			UI_remove_answer("Job");
			UI_add_answer("Solusek Mining Company");
			UI_add_answer("Cook");
			}
		else if (response == "Solusek Mining Company")
			{
			say("Tis the company that runs the building thou art in. How could thou now know?");
			quicktalk();
			UI_remove_answer("Solusek Mining Company");
			}

		else if (response == "Cook")
			{
			say("Yes, I cook. Along with this I clean the rooms of the company heads. Tis not the most glamourous, but one does overhear lots of sensitive information.");
			UI_remove_answer("Cook");
			UI_add_answer("Information");
			}
		else if (response == "Information")
			{
			say("And why would I share information with thee?");
			UI_remove_answer("Information");
			UI_add_answer("How much?");
			}
		else if (response == "How much?")
			{
			say("Thee think that thee can buy my loyalty away from the company with the mere offer of gold?");
			bribetalk();
			UI_remove_answer("How much?");
			}
		
		}
	UI_remove_npc_face(item);
	}

