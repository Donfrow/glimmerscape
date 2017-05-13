/*
Elren the boat guy on Kintore island
*/

void BuyShip()
{

var schedule = UI_get_schedule_type(-172);

var ship_deed = UI_count_objects(PARTY, GOOD_SCROLL, 67, ANY);
var amount = 1200;

UI_push_answers();

if(schedule == DESK_WORK)
{
	converse(["Yes", "No"])
	{
		case "Yes" (remove):
		if(gflags[BOUGHT_ELRON_BOAT])
		{
			say("He looks around for a moment. @Oh, my mistake. It seems I have already sold the only vessel I have ready.@");
		}
		else
		{
			if(chargeGold(amount))
			{
				say("@Here is the deed to the ship. I hope your sea voyages are both safe and rewarding.@");
				UI_add_party_items(1, GOOD_SCROLL, 67, 3); // Add the deed to the boat scroll quality 67
				UI_clear_answers();
				UI_pop_answers();
				break;
			}
			else
			{
				say("@You do not have enough gold to purchase a ship!@");
			}
		}
		
		UI_clear_answers();
		UI_pop_answers();
		break;
		
		case "No" (remove):
		say("@Very well, it is your choice.@");
		UI_clear_answers();
		UI_pop_answers();
		break;		
	}
}
else
{
	say("@Please return when I am open for business.@");
	UI_clear_answers();
	UI_pop_answers();
}

}



void Elren object#(0x4ac) ()
	{

var bark = "Ahoy";
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
				UI_item_say(item, "The sea air is fresh");
			else if (n == 2)
				UI_item_say(item, "It is a fine spruce");
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
        call Elren, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@You just cannot stay away, can you?@");
		UI_remove_answer("Name");
	}
else
	{

	say("@Welcome to Kintore.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag




		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		LookForDarkMonk();
		converse
		{

	if (response == "Bye")
			{
			say("@Enjoy the sea air.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Elren at your service.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the dockmaster and shipwright here at Kintore.@");
			UI_remove_answer("Job");
			UI_add_answer("Dockmaster");
			UI_add_answer("Shipwright");
			}
		else if (response == "Dockmaster")
			{
			say("@I keep logs of all the ships and vessels that sale in and out of Kintore. I am also the Nautical Guilds contact here.@");
			UI_remove_answer("Dockmaster");
			UI_add_answer("Nautical Guild");
			}

		else if (response == "Nautical Guild")
		{
			if(gflags[LECHUCK_DEAD])
			{
				say("@The Nautical Guild deals with much of the shipping throughout the lands. Until recently there had been a ban on sailing due to pirates but that threat has since been eliminated.@");
			}
			else
			{
				say("@The Nautical Guild deals with much of the shipping throughout the lands. However they have not been sailing as much lately due to pirates.@");
				UI_remove_answer("Nautical Guild");
			}
			UI_add_answer("Pirates");
		}
		else if (response == "Pirates")
		{
			if(gflags[LECHUCK_DEAD])
			{
				say("@Pirates are normally a minor annoyance to sailors. However, when LeChuck brought them together they became quite the force to be reckoned with.@");
				say("@Thankfully, he is now slain and the pirates are once again in disarray.@");
			}
			else
			{
				say("@Pirates are normally a minor annoyance to sailors, however a fearsome pirate by the name of LeChuck has banded them together, making them a force to be reckoned with.@");
				say("@Until he is slain, I fear the sea is no longer a safe place to be.@");
				UI_add_answer("Slay");
			}
			UI_remove_answer("Pirates");
		}
		else if (response == "Slay")
		{
			say("@The Nautical Guild has a bounty out on his head. If you can safely make it to Medina where the guild headquarters is located you can find out more information.@");
			UI_remove_answer("Slay");
		}
		else if (response == "Shipwright")
			{
			say("@I create ships which one can sail the seas with. With storms, pirates and other nasty business on the seas it is far better to be sailing in a fine sturdy vessel than a small skimmer.@");
			say("@If you were to encounter such an event in a skimmer you would not last whereas one of my ships could take each at the same time and still sail strong.@");
			UI_remove_answer("Shipwright");
			UI_add_answer("Buy");
			}
		else if (response == "Buy")
		{
			if(gflags[LECHUCK_DEAD])
			{
				say("@With LeChuck slain I am once again free to sell my ships with a clear conscience. I charge 1200 gold pieces for one of my vessels. Are you interested in purchasing one?@");
			}
			else
			{
				say("@I really should not be selling a vessel when there is a ban on sailing but who knows when the ban will be lifted, and I must make my coin somehow!@");
				say("@In that vein... I charge 1200 gold pieces for a vessel. Are you interested in purchasing one?@");
			}
			BuyShip();
			UI_remove_answer("Buy");
		}
		else if (response == "Seen any ex-dark monks lately?")
			{
			say("@I do not pay attention to those sorts of people.@");
			UI_remove_answer("Seen any ex-dark monks lately?");
			}
		
		}
	UI_remove_npc_face(item);
	}
}
