/*
Cellia in Brentonia
*/

void BuySpellsCelia()
{
}




void BuyCelia()
{

UI_push_answers();
say("@What would you like to purchase?@");
converse(["Reagents", "Potions", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Do return if you change your mind.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Reagents" (remove):
    say("@What reagent would you like to purchase?@");
    var pearlcost = 3;
    var bloodmosscost = 3;
    var nightcost = 3;
    var mandrakecost = 5;
    var garliccost = 1;
    var ginsengcost = 3;
    var silkcost = 2;
    var ashcost = 3;
    var bloodspawncost = 15;
    var scalescost = 7;
    BuyReagents(pearlcost, bloodmosscost, nightcost, mandrakecost, garliccost, ginsengcost, silkcost, ashcost, bloodspawncost, scalescost);

	case "Potions" (remove):
    say("@What type of potion would you like?@");
    var healcost = 5;
    var poisoncost = 3;
    var sleepcost = 5;
    var manacost = 15;
    BuyPotions(healcost, poisoncost, sleepcost, manacost);

}

}


void Celia object#(0x441) ()
	{

var bark = "And to you";
var bark_intro = "Greetings";
	
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
				UI_item_say(item, "Mop mop mop, all day long");
			else if (n == 2)
				UI_item_say(item, "So dusty");
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
        call Celia, TALK;
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
		say("@What can I do for you?@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");

	}
else
	{

		say("@Welcome to my shop.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@I do hope you decide to return again.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am Celia.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I sell various magical goods which one needs in todays hectic world.@");
            UI_remove_answer("Job");
            UI_add_answer("Goods");
            UI_add_answer("Buy");
        }
        else if (response == "Goods")
        {
			say("@The goods which I carry are mainly potions and reagents for spells. I do special orders as well for other magical goods.@");
            UI_remove_answer("Goods");
			UI_add_answer("Special orders");
        }
		else if (response == "Special orders")
		{
			if(gflags[LECHUCK_DEAD])
			{
				say("@For some time I have been unable to take any special orders due to the ban on sailing by the Nautical Guild. However now that the ban is lifted I can do so once again.@");
				say("@Though I suppose the shipping lanes will be bogged down for sometime from all the backlog so I better not take any orders.@");
			}
			else
			{
				say("@Normally I take special orders for items that citizens and travellers need that they cannot acquire in town. However with the ban on sailing I am unable to currently do so.@");
				UI_add_answer("Ban on sailing");
			}
			UI_remove_answer("Special orders");
			UI_add_answer("Nautical Guild");
		}
		else if (response == "Ban on sailing")
		{
			say("@Due to increased pirate activity the Nautical Guild has chosen to only allow crucial shipments to go through the sea lanes.@");
			UI_remove_answer("Ban on sailing");
		}
		else if (response == "Nautical Guild")
		{
			say("@The Nautical Guild is based out of Medina and controls all commercial trading vessels in Desporia.@");
			UI_remove_answer("Nautical Guild");
		}
        else if (response == "Buy")
        {
		
            say("@What would you like to purchase?@");
            BuyCelia();
            UI_remove_answer("Buy");
        }

		}
	UI_remove_npc_face(item);
	}
}
