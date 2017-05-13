/*
Belandric generic item merchant in Dewtopia
*/

void Belandric_Sell_Categories()
{
UI_push_answers();

converse(["Magic items", "Arrows", "Leather armor", "General goods", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Feel free to change your mind anytime.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Arrows" (remove):
	
	// SET ARROW PRICES
	var arrow_cost = 2;
	var burst_cost = 3;
	var lucky_cost = 3;
	var magic_cost = 4;
	var serpent_cost = 5;
	var sleep_cost = 2;
	BuyArrows_FromVendor(arrow_cost, burst_cost, lucky_cost, magic_cost, serpent_cost, sleep_cost);
	
	case "Leather armor" (remove):
	
	//SET LEATHER ARMOR PRICES
	var leather_helm_cost = 15;
	var leather_gloves_cost = 15;
	var leather_legs_cost = 25;
	var leather_tunic_cost = 40;
	var leather_boots_cost =15;
	BuyLeatherGoods_FromVendor(leather_helm_cost, leather_gloves_cost, leather_legs_cost, leather_tunic_cost, leather_boots_cost);
	
	case "General goods" (remove):
	var torch_cost = 10;
	var bedroll_cost =30;
	var bandage_cost =32;
	var jerky_cost = 2;
	var backpack_cost = 20;
	BuyGeneralGoods_FromVendor (torch_cost, bedroll_cost, bandage_cost, jerky_cost, backpack_cost);
	
	case "Magic items" (remove):
	say("@I only have disenchanting stones for sale at the moment. I can sell you a stone for 5 gold coins.@");
	say("@How many disenchanting stones would you like?@");
	var amount = UI_input_numeric_value(0, 10, 1, 0);
	if(amount == 0)
	{
		say("@Very well.@");
	}
	else
	{
		if(chargeGold(amount*10))
		{
			say("@Here are your ", amount, " enchanting stones at a cost of ", amount*5, " gold coins.@");
            UI_add_party_items(amount, 1434, ANY, ANY);
		}
		else
		{
			say("@You do not have enough gold coins for this purchase.@");
		}
	}
	
}



}

void Belandric object#(0x59b) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender
var schedule = UI_get_schedule_type(-411);

var bark = "What can I help you with?";
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
				UI_item_say(item, "Best wares in town");
			else if (n == 2)
				UI_item_say(item, "Do not be unprepared");
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
        call Belandric, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The shopkeeper clearly grins. @What can I interest you in today?@");
	add(["Buy"]);
}
else
{
	say("A shopkeeper eyes you up. @It looks like you could use some supplies.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("@Do come again sometime.@");
	break;
		
	case "Name" (remove):
	say("@Belandric, and ready to sell you what you need.@");
	
	case "Job" (remove):
	say("The man lets lose a big smile. @I sell the finest wares in Dewtopia.@");
	add(["Buy", "Wares", "Dewtopia"]);

	case "Buy" (remove):
		if(schedule == TEND_SHOP)
		{
			say("@And what can I interest you in today?@");
			Belandric_Sell_Categories();
		}
		else
		{
			say("@I am sorry but I am not currently open for business.@");
		}

	case "Wares" (remove):
	say("The man nudges your shoulder. @I will sell only the finest goods to my customers. After all, if my customers cannot survive a goblin or bandit attack I have lost a customer.@");
	add(["Goblins", "Bandits", "Lose a customer"]);
	
	case "Goblins" (remove):
	say("The man cringes. @Terrible and stupid beasts who would never know a good deal even if they were beat over the head with it.@");
	
	case "Bandits" (remove):
	say("@The Plains Bandits are terrible people. They rob all they can from you and if you are lucky they will leave you for dead.@");
	say("@And they do not even buy anything with the money they steal!@");
	
	case "Lose a customer" (remove):
	say("The man tugs at his collar. @What I meant is it is terrible when someone is slain outside the walls due to poor quality goods.@");
	say("He pauses. @But you do not need to worry about that! You will get only the finest goods from me!@");
	
	case "Dewtopia" (remove):
	say("@A fine city, is it not? Fair ruler, low taxes, a real great place to set up shop.@");
}

}
}


