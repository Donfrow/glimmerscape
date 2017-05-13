/*
Galen the healer outside of Dewtopia
*/



void RezUs()
{

var rezcost = UI_count_objects(PARTY, SHAPE_GOLD, QUALITY_ANY, FRAME_ANY);
var amount = 500;
var body_near = UI_get_dead_party(AVATAR);
UI_push_answers();
UI_add_answer("Yes");
UI_add_answer("No");
	converse
	{
	if (response == "Yes")
		{
			if(chargeGold(amount))
			{
				if (body_near)
				{
					say("@Your companion lives again.@");
					rezParty();
					UI_clear_answers();
					UI_pop_answers();
					break;
				}
				else
				{
					say("@I need a body to resurrect...@");
					UI_clear_answers();
					UI_pop_answers();
					break;
				}
			}
			else 
			{
				say("@You do not have enough coin!@");
				UI_clear_answers();
				UI_pop_answers();
				break;
			}

		}
	else if (response == "No")
	{
		say("Very well.");
		UI_clear_answers();
		UI_pop_answers();
		break;
	}
}
}

void WantToBuy()
{
var amount = 20;
UI_push_answers();
UI_add_answer("Yes");
UI_add_answer("No");
UI_add_answer("Nevermind");
	converse
		{
		if (response == "Yes")
			{
			say("@What would you like?@");
			UI_remove_answer("Yes");
			UI_remove_answer("No");
			UI_add_answer("Bandages");
			UI_add_answer("Potions");
			}
		else if (response == "No")
			{
			say("@Very well then.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
			}
		else if (response == "Bandages")
			{
			if(chargeGold(amount))
				{
				say("@Here are your bandages. Would you like to make another purchase?@");
				UI_remove_answer("Bandages");
				UI_remove_answer("Potions");
				UI_add_answer("Yes");
				UI_add_answer("No");
				UI_add_party_items(5, 857, 0, 0); // Add 5 bandages to inventory
				}
			else
				{
				say("@You do not have enough coin!@");
				UI_clear_answers();
				UI_pop_answers();
				break;
				}
			}
		else if (response == "Potions")
			{
			if(chargeGold(amount))
				{
				say("@Here are your potions. Would you like to make another purchase?@");
				UI_remove_answer("Bandages");
				UI_remove_answer("Potions");
				UI_add_answer("Yes");
				UI_add_answer("No");
				UI_add_party_items(4, 340, 0, 1); // Add 4 healing potions to inventory
				}
			else
				{
				say("@You do not have enough coin!@");
				UI_clear_answers();
				UI_pop_answers();
				break;
				}
			}
		else if (response == "Nevermind")
			{
			say("@Very well... enjoy your smallpox...@");
			UI_clear_answers();
			UI_pop_answers();
			break;
			}
		}
	




}


void Galen object#(0x45f) ()
	{

var bark = "Are you hurt?";
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
				UI_item_say(item, "I have seen many injuries");
			else if (n == 2)
				UI_item_say(item, "Very grave wounds");
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
        call Galen, TALK;
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
		say("@I do hope you are in modest health.@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");
		UI_add_answer("Resurrection");
	}
else
	{

		say("@How may I help you today?@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag




		converse
		{

		if (response == "Bye")
			{
			say("@Have a moderately safe journey.@");
			break;
			}
		else if (response == "Name")
			{
			say("I am Galen the healer");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the healer and provider of healing potions for the people of Dewtopia and any others who venture here.@");
			say("@I also provide resurrections, but they are extremely difficult to perform due to the nature of death.@");
			say("@May I add that business has not been better since the goblins? Though, not so much so with the bandits.@");
			UI_remove_answer("Job");
			UI_add_answer("Goblins");
			UI_add_answer("Bandits");
			UI_add_answer("Buy");
			UI_add_answer("Resurrection");
			}
		else if (response == "Goblins")
			{
			say("@Brutish beasts if I may say. Those who they attack are sometimes able to escape alive, but injured. It is good in a purely economic point of view.@");
			UI_remove_answer("Goblins");
			}
		else if (response == "Bandits")
			{
			say("@They are nothing but a boon to the city, the plains and my practice. They would kill their victims and resurrections are not something many can afford.@");
			UI_remove_answer("Bandits");
			}
		else if (response == "Resurrection")
			{
			say("@Few people throughout the lands are still able to provide resurrections. I charge 500 gold per resurrection. Do you agree?@");
			RezUs();
			UI_remove_answer("Resurrection");
			}
		else if (response == "Buy")
			{
			say("@I charge 20 gold per two healing potions, and 20 gold per five bandages. Do you agree to this?@");
			WantToBuy();
			UI_remove_answer("Buy");
			}
	
		}
	UI_remove_npc_face(item);
	}
	}
