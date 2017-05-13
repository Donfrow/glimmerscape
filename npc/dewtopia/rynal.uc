/*
Rynal the blacksmith outside Dewtopia
*/

void RynalBuy()
{

UI_push_answers();
say("@Would you like to sell armor or weapons?@");

converse(["Armor", "Weapons", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@If you change your mind I will be here.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Armor" (remove):
	var scale_tunic = 60;
	var chain_tunic = 75;
	var plate_tunic = 100;
	var chain_legs = 40;
	var plate_legs = 50;
	var chain_gloves = 25;
	var chain_helm = 30;
	var great_helm = 40;
	var crested_helm = 40;
	SellMetalArmor_ToVendor(scale_tunic, chain_tunic, plate_tunic, chain_legs, plate_legs, chain_gloves, chain_helm, great_helm, crested_helm);
	
	case "Weapons" (remove):
	var sword_cost = 50;
	var sod_cost = 40;
	var two_sword_cost = 80;
	var star_cost = 35;
	var halbred_cost = 100;
	var dagger_cost = 20;
	SellWeapons_ToVendor(sword_cost, sod_cost, two_sword_cost, star_cost, halbred_cost, dagger_cost);
}

}

void Rynal object#(0x59c) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender
var schedule = UI_get_schedule_type(411);

var bark = "Good day to you";
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
				UI_item_say(item, "It is tough work");
			else if (n == 2)
				UI_item_say(item, "Excellent product");
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
        call Rynal, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The shopkeeper waves at you. @I hope all is going well with you.@");
	add(["Buy"]);
}
else
{
	say("A blacksmith looks up at you. @It is nice to see a new face.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("@I look forwarding to seeing you again.@");
	break;
		
	case "Name" (remove):
	say("@I am Rynal, pleasure to meet you.@");
	
	case "Job" (remove):
	say("@I am the blacksmith for Dewtopia, as well as knight and citizen.@");
	add(["Blacksmith", "Knight", "Dewtopia"]);

	case "Blacksmith" (remove):
	say("@I forge all the armor and weapons the Dewtopian army needs here in my shop. However, due to the current circumstances I am cannot sell you anything.@");
	say("@However I am willing to buy any metal armor, weapons and shields you are willing sell.@");
	add(["Circumstances", "Shop", "Sell"]);
	
	case "Circumstances" (remove):
	say("@As of late the goblins have increased their raids against Dewtopia and surrounding areas and as a result the Dewtopian army is increasing their recruits.@");
	say("@Normally this would not be an issue as the city would order armor and weapons from other cities to keep up with extra demand but the ban on sailing by the Nautical Guild has prevented this.@");
	add(["Goblins", "Recruits", "Nautical Guild", "Sailing ban"]);
	
	case "Goblins" (remove):
	say("@Goblins are terrible creatures without a lack of sympathy for those they attack and take prisoner. If you ever find yourself their prisoner I suggest you take your own life.@");
	
	case "Recruits" (remove):
	say("@Most are inexperienced with goblins but some do have experience with the Plains Bandits.@");
	add(["Plains Bandits"]);
	
	case "Plains Bandits" (remove):
	say("@They are a cunning bunch who rob and slay those they can. While they are cruel and violent they are nowhere near as savage as the goblins.@");
	
	case "Nautical Guild" (remove):
	say("@The Nautical Guild is an organization based out of Medina that runs the shipping lands.@");
	
	case "Sailing ban" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@I have heard word that the Nautical Guild has removed the ban on sailing. Some brave adventurer must have slain LeChuck.@");
		add(["I slew LeChuck"]);
	}
	else
	{
		say("@An increase in pirate activity has caused the Nautical Guild to stop sailing in hopes of reducing the supply of ships the pirates can plunder. Only necessary shipments now sail.@");
	}
	
	case "I slew LeChuck" (remove):
	say("The mans eyes widen. @You are truely a fierce warrior.@");
	
	case "Shop" (remove):
	say("@Originally my shop was located in Dewtopia but many of its residents complained of the noise so my shop was moved just outside the walls.@");
	say("@Of course this was all before the goblin threat increased. Now that I am outside the walls a full time guard is needed to ensure the shop stays safe.@");
	add(["Stay safe"]);
	
	case "Stay safe" (remove):
	say("@Normally those outside the wall are not well guarded but due to Dewtopia's need for my armor and weapons it is too much of a risk to have my business lost, hence the full time guard.@");
	
	case "Knight" (remove):
	say("@All the Dewtopian guards and a few others are knights of Dewtopia. It is a difficult title to achieve but you know that your fellow knights are capable fighters.@");
	
	case "Dewtopia" (remove):
	say("@Dewtopia is just east of my shop. Rest assured you will be safe while you are in the city.@");
	
	case "Sell" (remove):
	RynalBuy();
}

}
}


