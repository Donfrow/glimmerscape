/*
Gala, Kintore Mayor
*/

void Gala_TakeGold()
{
UI_push_answers();

converse(["Take gold", "Refuse gold"])
{
	case "Take gold" (remove):
	say("You eagerly accept the reward for slaying the Dark Monks. @Thank you again for dealing with such a menance.@");
	karma = karma-200;
	KarmaBadSprites();
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Refuse gold" (remove):
	say("You refuse the gold, explaining that such a deed needed to be done for the greater good. @You are a truely noble individual but I cannot let you leave empty handed.@");
	say("Gala passes a pouch to you, refusing to let you say no. @You have earned this. Enjoy it.@");
	karma = karma+300;
	KarmaGoodSprites();
	UI_clear_answers();
	UI_pop_answers();
	break;
}

}


void Gala object#(0x42e) ()
	{
		
var bark = "Yes?";
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
				UI_item_say(item, "Watch your back");
			else if (n == 2)
				UI_item_say(item, "Stay out of trouble");
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
        call Gala, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@I trust you are staying out of trouble.@");
		UI_remove_answer("Name");
	}
else
	{

	say("@Beware of Dark Monks while here in Kintore.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag




UI_add_answer("Name");
UI_add_answer("Job");
UI_add_answer("Bye");
LookForDarkMonk();

if(UI_is_dead(207)) // Karnax is dead
{
	UI_add_answer("Karnax is slain");
	
	if(gflags[PAID_FOR_KARNAX])
	{
		UI_remove_answer("Karnax is slain");
	}
}
	
		converse
		{

	if (response == "Bye")
			{
			say("@Stay out of trouble.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("The woman answers with a curt and stern tone. @Gala.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the mayor and law enforcement here in Kintore.@");
			UI_remove_answer("Job");
			UI_add_answer("Mayor");
			UI_add_answer("Law enforcement");
			UI_add_answer("Kintore");
			}
		else if (response == "Mayor")
		{
			say("@I work with the fine people of this town to make things run smoothly and efficiently. So far I have not failed, unlike the previous mayor.@");
			UI_remove_answer("Mayor");
			UI_add_answer("Previous Mayor");
		}
		else if (response == "Previous Mayor")
		{
			say("@An old blithering fool that man was. He tried to appease the Dark Monks and did not put forth any effort to get them off the island.@");
			say("@Now they reign free in their sanctuary and take our citizens in the night!@");
			UI_remove_answer("Previous Mayor");
			UI_add_answer("Sanctuary");
			UI_add_answer("Take citizens");
		}
		else if (response == "Sanctuary")
		{
			say("@The sanctuary, or as they call it, The Dark Sanctuary, is on the eastern portion of the island set in the mountains.");
			if(gflags[PAID_FOR_KARNAX])
			{
				say("@Hopefully now with the Dark Monks destroyed it will succumb to the elements and eventually collapse, removing all memory of that awful place.@");
			}
			else
			{
				say("@It is difficult to imagine being able to unseat them with such a stronghold now. But that is not to say I will not try.@");
				UI_add_answer("Unseat");
			}
			UI_remove_answer("Sanctuary");

		}
		else if (response == "Unseat")
		{
			say("@I will never officially hire mercenaries to do the job, but that is not to say I will not reward them if they do so.@");
			UI_remove_answer("Unseat");
		}
			
		else if (response == "Take citizens")
		{
			say("@Poor Ashele was taken by the Dark Monks one night. I do not even want to think what she endured at their hands.@");
			UI_remove_answer("Take citizens");
		}
		else if (response == "Law enforcement")
		{
			say("@The town does not have the funds to hire full time guards so such duties are upon myself and volunteers. We constantly keep on eye on the activities taking place to ensure safety.@");
			say("@So far we have been relatively successfully in keeping the town safe from threats such as the Dark Monks.@");
			UI_remove_answer("Law enforcement");
			UI_add_answer("Dark Monks");
		}
		else if (response == "Kintore")
			{
			say("@It is the town you are in. It is the town I run and enforce laws in. Do not cause any trouble.@");
			UI_remove_answer("Kintore");
			}
		else if (response == "Dark Monks")
			{
			say("@The Dark Monks are a cult of some sort on the eastern side of the island who would like to sacrifice the living for their twisted rituals.@");
			say("@If any of them even approach the city again and thinks about harming its citizens they will turn out to be the sacrifice hanging from our gallows.@");
			UI_remove_answer("Dark Monks");
			}
		else if (response == "Seen any ex-dark monks lately?")
		{
			say("@I keep an eye out for any potential trouble makers, and I did see one. I believe he stayed in the shelter for several nights. I suggest you speak with Gloria.@");
			UI_remove_answer("Seen any ex-dark monks lately?");
		}
		else if (response == "Karnax is slain")
		{
			if(gflags[PAID_FOR_KARNAX])
			{
				say("Gala smiles and nods at you. @I cannot thank you enough for the service you have done our fair town.@");
			}
			else
			{
				say("@Although you were never officially hired by the town of Kintore to put an end to the Dark Monk threat you have none the less done a great service to us.@");
				say("@It is my honour to give you a reward of 500 gold coins for your deed.@");
				Gala_TakeGold();
				UI_add_party_items(500, SHAPE_GOLD, ANY, ANY);
				gflags[PAID_FOR_KARNAX] = true;
			}
			
		}

		
		
		}
	UI_remove_npc_face(item);
	}
}
