/*
Lucilla the barkeep in Brentonia
*/


void Lucilla object#(0x446) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender
var schedule = UI_get_schedule_type(item);

var bark = "What can I get for you?";
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
				UI_item_say(item, "Sometimes I wish I stayed in Dewtopia");
			else if (n == 2)
				UI_item_say(item, "Please do not make a mess");
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
        call Lucilla, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@I am glad to see you have returned. What can I help you with?@");
	add(["Buy"]);
}
else
{
	say("@How can I help you today?@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("@If your appetite returns do come back.@");
	break;
		
	case "Name" (remove):
	say("The woman does a small curtsy. @I am Lucilla.@");
	
	case "Job" (remove):
	say("@I am the proprietor of the Dirty Fork here in Brentonia.@");
	add(["Proprietor", "Dirty Fork", "Brentonia", "Buy"]);
	
	case "Proprietor" (remove):
	say("@Some years ago I managed to scrounge together enough gold coins from my share of the family business to found my own business.@");
	add(["Family business", "Found"]);
	
	case "Family business" (remove):
	say("@Pubs and bars are in my blood. Originally my father founded The Savage Plate in Dewtopia. When he died my sister Lucille and I took over the business.@");

	case "Found" (remove):
	say("@While running The Savage Plate in Dewtopia with my sister we were arguing so much on how what our father left us should be run that I was about to quit and leave the mainland.@");
	say("@Luckily I heard news of a vacancy inside of Brentonia so I took my share of the profits from The Savage Plate and rented out the space.@");
	say("@It was tough work, and still is, but at least now I can make the decisions on how to run it on my own. And I do not have to share the profits.@");
	add(["Should be run"]);

	case "Should be run" (remove):
	say("@It is my philosophy that those who come to a pub should not only be treated to a delicious meal but be provided with entertainment as well.@");
	add(["Entertainment"]);
	
	case "Entertainment" (remove):
	say("@While most of my entertainment is for the men I do on occasion bring in entertainment solely for the women, if you understand what I mean.@");
	if(female)
	{
		say("She leans over and whispers into your ear. @I am not certain when I will have male dancers in next, but if you stay in town I will be sure to let you know when I do.@");
	}
	else
	{
		say("Lucilla leans over and whispers into your ear. @I am not certain when I will have male dancers in next, but if you stay in town I am certainly interested in hiring you.@");
	}
	
	case "Dirty Fork" (remove):
	say("@It has a certain ring to it that I quite like. Do not worry though, I keep my utensils quite sanitary.@");
	say("@But please, know your limits. I do not want to have another innocent person perish.@");
	add(["Perish"]);
	
	case "Perish" (remove):
	say("@Recently Ernesta, a fine woman I might add, was in a deep sorrow and took to the bottle.@");
	say("@One night when she left the pub after having too much to drink she did not make it home... she fell and hit her head on the ground, killing her.@");
	say("@Such a sad end to a wonderful woman and capable fighter.@");
	
	case "Brentonia" (remove):
	say("@Brentonia is a lovely place to live and is excellent to run a business in. There is little fear of being seiged and has quite the population.@");
	add(["Siege"]);
	
	case "Siege" (remove):
	say("@Goblins are the main threat but they lack sufficient equipment and coordination to get past the natural mountainous terrain that helps to defend Brentonia.@");
	add(["Goblins"]);
	
	case "Goblins" (remove):
	say("@Hidious creatures, and while I do not live in fear of them I would not want to meet one.@");
	
	case "Buy" (remove):
	if(schedule == WAITER)
	{
		say("@I serve only the finest mutton, beef, fowl and ham. Which would you prefer?@");
		var muttoncost = 10;
		var beefcost = 15;
		var fowlcost = 12;
		var hamcost = 10;
		BuyMeat(muttoncost, beefcost, fowlcost, hamcost);
	}
	else
	{
		say("@I am sorry but I am not currently open for business. Please return later.@");
	}

}

}
}


