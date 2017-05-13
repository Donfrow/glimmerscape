void Mining_Supplies()
{
UI_push_answers();
converse(["Go on", "I am not interested"])
{
	case "I am not interested" (remove):
	if(gflags[PICK_DELIVERY_IN_PROGRESS])
	{
		say("@It pains me to hear that you have changed your mind in regards to the delivery. Do speak to me again if you change your mind again.@");
		gflags[PICK_DELIVERY] = false;
	}
	else
	{
		say("@That is a crying shame if I do say so.@");
	}
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Go on" (remove):
	say("@Normally we receive our mining supplies with consistency from a blacksmith who works for the Solusek Mining Company.@");
	say("@With the shipping lanes disrupted the mining supplies we receive are few and far between.@");
	say("@Before the disruption we had a rather large shipment that was to be delivered. Unfortunately we have not received that for the aformentioned reasons.@");
	say("@It is my hope that you will use whatever means of transportation you have been using to pickup these supplies from our suppliers shop.@");
	say("@In fact, if you were to do so I would pay you the generous sum of 1000 gold coins.@");
	say("@I do not normally ask of this of visitors but we are in desperate times and as such desperate measures are called for.@");
	gflags[PICK_DELIVERY_IN_PROGRESS] = true;
	gflags[PICK_DELIVERY] = true;
	remove(["I am not interested"]);
	add(["Blacksmith", "Transportation", "Supplies", "Solusek Mining Company", "Shop", "Nevermind"]);
	
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Blacksmith" (remove):
	say("@The blacksmith we order our supplies from is named Bredin. In fact he is the same blacksmith that forges the mining equipment for the Solusek Mining Company.@");
	say("Harris nudges you. @If the Solusek Mining Company chooses to use the equipment which he forges you know it must be good!@");
	
	
	case "Transportation" (remove):
	say("@I do not know what type of transporation you used to get here and that is none of my concern.@");
	say("@The important thing is you have some sort of transporation which is more than most of us can say.@");
	
	case "Supplies" (remove):
	say("@The supplies range from picks, chisels and hammers to explosives. We use a wide variety of them. Just let Bredin know that I sent you for them.@");
	
	case "Solusek Mining Company" (remove):
	say("@The Solusek Mining Company puts our little operation to shame. They have such a monopoly on mining that it is nearly impossible to be a miner without working for them.@");
	say("Harris laughs. @In fact the only reason we run our own mining operation here is that they are not interested in what we are mining.@");
	
	case "Shop" (remove):
	say("@Our suppliers shop is located on Solusek Island in the south west waters. It is quite close to the Solusek Mining Companys headquarters.@");
}
}


void Sell_Picks()
{
UI_push_answers();

say("@I will give you 100 gold coins per pick. Do you wish to sell me some picks?@");

converse(["Yes", "No"])
{

	case "Yes" (remove):
	var pick_count = UI_count_objects(PARTY, 624, ANY, ANY);
	if(pick_count == 0)
	{
		say("@You have no picks to sell! Please do not waste my time.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
	}
	else
	{
		say("@Excellent! How many picks are you willing to part with?@");
		var pick_sell_count = UI_input_numeric_value(0, pick_count, 1, 0);

		if(pick_sell_count == 0)
		{
			say("@I do hope you reconsider.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
		else
		{
			say("@Wonderful! For your ", pick_sell_count, " picks here is ", pick_sell_count*100, " gold coins. It has been a pleasure.@");
			UI_remove_party_items(624, pick_sell_count, ANY, ANY);
			UI_add_party_items(100*pick_sell_count, SHAPE_GOLD, ANY, ANY);
		}
	}

		case "No" (remove):
		say("@A shame.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
}

}

void Harris object#(0x5ef) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender
var mining_supplies = UI_count_objects(PARTY, MINING_SUPPLIES, ANY, ANY);

var bark = "Good day to you";
var bark_intro = "Hail";

	if (event == 0)
	{
		if (UI_get_schedule_type(item) == SLEEP)
		{
			UI_item_say(item, "Zzzz");
			return;
		}
		else if (UI_get_schedule_type(item) == IN_COMBAT)
		{
		}
		else
		{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "I do hope tourism picks up");
			else if (n == 2)
				UI_item_say(item, "There is much paperwork to be done");
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
        call Harris, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("Harris glances up from what he was doing. @Ah, it is you again.@");
add(["Job", "Bye"]);
if(mining_supplies>=3)
{
	add(["Mining supplies"]);
}
}
else
{
say("The man does a quick glance at you. @I do not believe we have met before.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

if(gflags[HEARD_OF_THUGS])
{
	add(["Thugs"]);
}

if(gflags[SELL_PICKS])
{
	add(["Sell picks"]);
}

converse([])
{
	case "Bye" (remove):
	say("@I should return to my work.@");
	break;
	
	case "Name" (remove):
	say("The man looks up from his work and extends his hand to you. @I apologize for my rudeness. I am Harris.@");
	
	case "Job" (remove):
	say("@My job, my wonderfully busy job. There is always so much to do in my job that I rarely even get a day off to myself.@");
	say("He shakes his head. @My apologies, I tend to ramble when my train of thought is interrupted. I am the mayor of Rosendale.@");
	add(["Mayor", "Rosendale"]);
	
	case "Mayor" (remove):
	say("@I am the one in charge of all the managerial duties here in Rosendale. This ranges from keeping the city clean to appointing guards.@");
	say("He sighs. @It used to be so much simpler when the tourists were visiting on a regular basis.@");
	add(["Tourist", "Managerial duties", "Guards"]);
	
	case "Tourist" (remove):
	say("@Rosendale is quite an attractive destination to visit because of the Galleria. Many travel great distances to see the works that our resident artisan makes.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@Unfortunately the recent pirate threat had greatly reduced the number of people visiting the town. Thankfully with that now out of the way the tourists can once again start visiting the Galleria.@");
		say("@Hopefully it does not take too long for that to start happening.@");
	}
	else
	{
		say("@The Nautical Guild has placed a ban on all non-essential sailing in order to combat a growing pirate threat. This has greatly placed a damper on the tourism in this fair city@");
		say("@While I am sure we are not the only place affected by such a ban it does end up having on my job as mayor. I do hope it is resolved soon.@");
	}
	add(["Pirates", "Nautical Guild"]);
	
	case "Pirates" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@A bunch of mangy sea dogs if you ask me. I have heard rumour that they have been dealt a fatal blow. If so, I shall shed no tears for the likes of them.@");

	}
	else
	{
		say("@Pirates are nothing more than mangy dogs at sea. The whole lot of them needs to be put down.@");
	}
	
	case "Nautical Guild" (remove):
	say("@The Nautical Guild runs all the legitimate ships that sail the seas. Their services are a great help to our tourism industry, that is when they do not have a ban on sailing.@");

	case "Managerial duties" (remove):
	say("@As mayor I perform many different yet all equally important functions here in Rosendale. This ranges from keeping the city streets clean to ensuring that there is law and order.@");
	say("He shakes his head. @As of late my main concern is to try to keep the city running with minimal cost. Until tourism picks back up it will be hard times here in Rosendale.@");
	add(["Law and order", "Minimal cost"]);
	
	case "Law and order" (remove):
	say("He shrugs. @While I am technically the final arbiter in all things law and order for all intense and purpose I have left those duties on the shoulders of the local sheriff Dryn.@");
	add(["Dryn"]);
	
	case "Dryn" (remove):
	say("@Dryn is the sheriff here in Rosendale. I appointed him to the position when I became overwhelmed with my other duties.@");	
	
	case "Minimal cost" (remove):
	say("He laughs. @If one has never had the duty of keeping a town or city in good running order it is impossible to fully understand the drastic costs associated with it.@");
	say("@That being said, Rosendale is far costlier to run than your average city as it must remain in good working order in order to attract tourists.@");
	say("@On top of that most of the costs involved in running the city are mainly financed through the gold that the tourists bring in. I am sure you can therefore see the situation I am in.@");
	add(["Good working order", "Situation"]);
	
	case "Good working order" (remove):
	say("@The city must be kept clean and crime free in order to attract tourists to the Galleria. Who would want to visit and spend gold in a decrepit and dilapidated city?@");
	
	case "Situation" (remove):
	say("@I would think it is plainly obvious. How can I keep the city in good running order to attract tourists without the tourists bringing in gold?@");
	say("@At least there is the quarry to help the finances.@");
	add(["Quarry"]);
	
	case "Quarry" (remove):
	say("@The quarry is in the mountains to the west. It contains some of the hardest rock one will ever find. It is so hard in fact that the mining supplies are eaten up rather quickly.@");
	say("@Most of the rock is used to create the statues in the Galleria as it is too expensive to ship out but occassionally some orders for small creates of it will be made.");
	if(gflags[LECHUCK_DEAD])
	{
	}
	else
	{
		say("He sighs. @But I suppose the Nautical Guild needs to be sailing for that.@");
	}
	add(["Supplies"]);
	
	case "Supplies" (remove):
	say("@Due to the hardness of the rock we wear down the mining equipment fairly quickly. This equipment requires replacement more often than other locations so we constantly have a need to ship more equipment and supplies in.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@Unfortunately during the duration of the pirate threat our resupply was cut off. While the Nautical Guild is sailing again I suspect it will take some time to fill the backfill and we are running dangerously low on picks at the moment.@");
	}
	else
	{
		say("@Unfortunately due to the pirate threat and the Nautical Guilds ban on sailing it is rather hard to get new supplies. In fact the mine is running dangerously low on picks at the moment.@");
	}
	if(gflags[PICK_DELIVERY])
	{
		if(gflags[PICK_DELIVERY_COMPLETED])
		{
	
		}
		else
		{
			say("@I do hope that you are still interested in deliverying shipment of supplies. We are getting quite desperate.");
			Mining_Supplies();
		}
	}
	else
	{
		say("Harris looks you up and down. @Say, you made it to Rosendale which means you have a means of transport. Would you be interested in picking up some supplies for me?@");
		Mining_Supplies();
	}
	
	add(["Picks"]);
	
	case "Picks" (remove):
	say("@If you have any picks you are willing to part with I would be more than happy to pay you 100 gold pieces per pick.@");
	gflags[SELL_PICKS] = true;
	add(["Sell picks"]);
	
	case "Sell picks" (remove):
	var pick_count = UI_count_objects(PARTY, 624, ANY, ANY);
	if(pick_count < 1)
	{
		say("@You have no picks to sell!@");
	}
	else
	{
		Sell_Picks();
	}
	
	case "Guards" (remove):
	say("@In my capacity as mayor it is my duty to ensure the safety of those who live and visit Rosendale. Frankly, I do not have the time to deal with such things at this time which is why I have delegated nearly all the power to the town sheriff.@");
	add(["Town sheriff"]);
	
	case "Town sheriff" (remove):
	say("@I have appointed a man named Dryn as the sheriff.@");
	add(["Dryn"]);
	
	case "Rosendale" (remove):
	say("@Rosendale is a fine city located on an island north east of Brentonia. It is best known as the home of the Great Galleria of Rosendale.@");
	say("He shakes his head slightly. @But surely you know this. How else would you have gotten here?@");
	
	case "Thugs" (remove):
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
		say("@I am glad to hear that the thug issue has been dealt with. I knew I made a good move in appointing Dryn as sheriff.@");
	}
	else
	{
		say("@Several people have mentioned rumours of thugs to me. My best advice is to speak to Dryn about such matters.@");
	}
	
	say("@I do not know anything about the beatings personally but I heard that Dryn is looking into it and taking the stories very seriously.@");
	add(["Dryn"]);
	
	case "Mining supplies" (remove):
	say("@It is most wonderful that you have been able to pick up these supplies for us. Hopefully now we can continue operations until the shipping lanes are back to normal.@");
	say("He looks at you for a moment. @Oh yes. I suppose you would like your payment. Here is 1000 gold coins as promised. Thank you once again.@");
	UI_add_party_items(1000, 644, ANY, ANY); // 1000 gold coins
	UI_remove_party_items(3, MINING_SUPPLIES, ANY, ANY);
	

	

}
}
else if (event == DEATH)
{
	

}


}