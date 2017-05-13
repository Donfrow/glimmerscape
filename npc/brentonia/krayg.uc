/*
Krayg the jeweller in Brentonia
*/

void KraygNecklace()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if (response == "Yes")
        {
            say("@Very well! Here is 1000 gold coins. Thank you for bringing this to me.@");
            UI_remove_party_items(1, 955, ANY, 5);
            UI_add_party_items(1000, SHAPE_GOLD, ANY, ANY);
            karma = karma - 150;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("@A shame indeed. I would love to have it.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}


void KraygSell()
{
    var necklace = UI_count_objects(PARTY, 955, 0, 5); // The necklace you get out of the basement of Solusek Mining Co.
    var jewelry = UI_count_objects(PARTY, 937, ANY, ANY);
    var gems = UI_count_objects(PARTY, 760, ANY, ANY);
    UI_push_answers();
    UI_add_answer("Jewelry");
    UI_add_answer("Gems");
    UI_add_answer("Nothing");
    
    if (necklace > 0)
    {
        UI_add_answer("Diamond necklace");
    }
    
    converse
    {
        if (response == "Jewelry")
        {
			var jewellery_cost = 100;
			SellJewellery_ToVendor(jewellery_cost);
		}
        else if (response == "Gems")
        {
			var gem_cost = 50;
			SellGems_ToVendor(gem_cost);
        }
        else if (response == "Nothing")
        {
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Diamond necklace")
        {
            say("@This is a very fine necklace indeed and I am most interested in buying it. I will give you 1000 gold coins for it. Is this acceptable?@");
            KraygNecklace();
            UI_remove_answer("Diamond necklace");
            
        }
    }
    
}



void Krayg object#(0x444) ()
	{

var bark = "And how are you today?";
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
				UI_item_say(item, "Nice and shiny");
			else if (n == 2)
				UI_item_say(item, "Fine craftsmanship");
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
        call Krayg, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
{
	say("Krayg nods as you approach him. @It is good to see you again.@");
	add(["Buy", "Sell"]);
}
else
{
	say("@Welcome to Brentonia. It is always a pleasure to see a new face.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}
	
converse(["Job", "Bye"])
{
	case "Bye" (remove):
	say("@I hope your journey is safe.@");
	break;
	
	case "Name" (remove):
	say("@I am Kraygleith but you may refer to me as Krayg.@");
	
	case "Job" (remove):
	say("@I am the general goods merchant here in Brentonia but I also delve into the art of jewellery.@");
	add(["General goods", "Brentonia", "Jewellery"]);
	
	case "General goods" (remove):
	say("@Goods such as leather armor and camping supplies, the types of things anyone who chooses to venture out of the city will need to survive.@");
	add(["Survive", "Buy"]);
	
	case "Survive" (remove):
	say("@The elements can be a harsh mistress for those who travel outside the safety of cities. Those caught without basic supplies such as food or bedrolls can find themselves in a deadly predicament.@");
	say("@I highly recommend that if you choose to leave Brentonia you stock up on supplies so you are not caught unprepared.@");
	
	case "Buy" (remove):
	if(UI_get_schedule_type((-68)) == TEND_SHOP)
	{
		var torch_cost = 8;
		var bedroll_cost = 25;
		var bandage_cost = 8;
		var jerky_cost = 2;
		var backpack_cost = 25;
		say("@Of course! What can I interest you in?@");
		BuyGeneralGoods_FromVendor (torch_cost, bedroll_cost, bandage_cost, jerky_cost, backpack_cost);
	}
	else
	{
		say("@I am sorry but I am not currently open for business.@");
	}
	
	case "Brentonia" (remove):
	say("@Brentonia is a kingdom nestled in the north east islands of the Desporian mainland. It is ruled by the noble leader Lord Brent.@");
	add(["Lord Brent"]);
	
	case "Lord Brent" (remove):
	say("@Lord Brent is a fair and rightious leader. He even setup a relief shelter inside the city for those less fortunate to take refuge when the goblins attack the city.@");
	add(["Shelter", "Goblins"]);
	
	case "Shelter" (remove):
	say("@The Brentonian Relief is what the shelter is officially called. It is setup above my shop and is open to all who need a place to stay when needed.@");
	
	case "Goblins" (remove):
	say("@Goblins are a menance but they cannot get into Brentonia as it is well fortified but they do occasionally cause a ruckus outside the walls.@");
	
	case "Jewellery" (remove):
	say("@While I am not currently selling any of my jewellery I am willing to purchase any gems or pieces of jewellery you wish to sell.@");
	add("Sell");
	
	case "Sell" (remove):
	say("@I am certainly interested in increasing my inventory. What would you be interested in selling to me?@");
	KraygSell();
}
	
	UI_remove_npc_face(item);
}

}
