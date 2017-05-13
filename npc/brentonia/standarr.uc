/*
Standarr the blacksmith
*/

void StandarrSell()
{

UI_push_answers();

converse(["Armor", "Weapons", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Do let me know if you change your mind.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Armor" (remove):
	var scale_tunic = 65;
	var chain_tunic = 80;
	var plate_tunic = 110;
	var chain_legs = 45;
	var plate_legs = 60;
	var chain_gloves = 30;
	var chain_helm = 35;
	var great_helm = 45;
	var crested_helm = 45;
	SellMetalArmor_ToVendor(scale_tunic, chain_tunic, plate_tunic, chain_legs, plate_legs, chain_gloves, chain_helm, great_helm, crested_helm);
	
	case "Weapons" (remove):
	var sword_cost = 50;
	var sod_cost = 45;
	var two_sword_cost = 85;
	var star_cost = 40;
	var halbred_cost = 100;
	var dagger_cost = 10;
	SellWeapons_ToVendor(sword_cost, sod_cost, two_sword_cost, star_cost, halbred_cost, dagger_cost);
	
}

}
void StandarrBuy()
{
    UI_push_answers();
    UI_add_answer("Armor");
    UI_add_answer("Weapons");
    UI_add_answer("Nevermind");
    
    converse
    {
        if (response == "Armor")
        {
			var tunic_cost = 100;
			var legs_cost = 75;
			var helm_cost = 60;
			var gauntlets_cost = 40;
			var boots_cost = 40;
            BuyMetalArmor_FromVendor(tunic_cost, legs_cost, helm_cost, gauntlets_cost, boots_cost);
        }
        else if (response == "Weapons")
        {
			var halbred_cost = 120;
			var two_handed_cost = 75;
			var axe_cost = 75;
			var sword_cost = 60;
			BuyMetalWeapons_FromVendor(halbred_cost, two_handed_cost, axe_cost, sword_cost);
        }
        else if (response == "Nevermind")
        {
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        
    }
}



void Standarr object#(0x44e) ()
	{

var bark = "How can I help you today?";
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
				UI_item_say(item, "It can get mighty hot while smelting");
			else if (n == 2)
				UI_item_say(item, "A cool gust of air is always welcome");
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
        call Standarr, TALK;
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
		say("@It is a pleasure to see your face again.@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");
		UI_add_answer("Sell");

	}
else
	{

		say("@Welcome to Brentonia. It is always nice to see a new face.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Have a safe and pleasant day.@");
            break;
        }
        else if (response == "Name")
        {
            say("@You may refer to me as Standarr.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the Blacksmith here in Brentonia.@");
            UI_remove_answer("Job");
            UI_add_answer("Brentonia");
            UI_add_answer("Blacksmith");
        }
        else if (response == "Brentonia")
        {
            say("@It is the fine city in which you are in right now. It is nestled right the Northern Mountains and is quite fortified against attack.@");
            UI_remove_answer("Brentonia");
			UI_add_answer("Attack");
        }
		else if (response == "Attack")
		{
			say("@The main threat to Brentonia is the goblins. However with our position here in the mountains we should be relatively safe inside the city.@");
			UI_remove_answer("Attack");
			UI_add_answer("Goblins");
		}
		else if (response == "Goblins")
		{
			say("@They are ugly creatures with poor worksmanship. The only weapons of theirs worth smelting are those which they have taken from their victims.@");
			UI_remove_answer("Goblins");
		}
        else if (response == "Blacksmith")
        {
            say("@It is one who makes armor and weapons. I also sell and buy weapons and armor.@");
            UI_remove_answer("Blacksmith");
            UI_add_answer("Buy");
			UI_add_answer("Sell");
        }
        else if (response == "Buy")
        {
            say("@What would you like to purchase?@");
            StandarrBuy();
            UI_remove_answer("Buy");
        }
		else if (response == "Sell")
		{
			say("@What would you like to sell?@");
			StandarrSell();
		}
        

		}
	UI_remove_npc_face(item);
	}
}
