/*
Joy, wife and reagent merchant
*/



void Joy object#(0x5ec) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var name = UI_get_npc_name(AVATAR);

var bark = "Hello there";
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
				UI_item_say(item, "Of course");
			else if (n == 2)
				UI_item_say(item, "Indeed");
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
        call Joy, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("@It is a pleasure to see you again ", name, ".@");
add(["Job", "Bye", "Buy"]);
}
else
{
say("@Hello there stranger. It is see a new face that is not injured in one way or another.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@I hope you the best in your travels.@");
	break;
	
	case "Name" (remove):
	say("@Well if you are not just the cutest thing ever asking that question. I am Joy my dear.@");
	
	case "Job" (remove):
	say("@I do quite a few things actually. Mainly I sell reagents and help tend to those who are wounded.@");
	say("She thinks for a moment. @More than anything I am a loving wife to my husband Walter.@");
	add(["Reagents", "Wounded", "Walter"]);
	
	case "Reagents" (remove):
	say("@Those pesky little items that mages need in order to successfully cast spells can be purchased from me at a fair price so if you need any simply ask and I will see what I can do for you.@");
	add(["Buy"]);
	
	case "Wounded" (remove):
	say("@My home is also where all the wounded go as my husband Walter is the town healer. When he is overwhelmed or simply needs a hand I am always willing to lend a hand.@");
	say("She sighs. @As long as that mine is in town I suspect Walter will always be needing an extra hand.@");
	add(["Mine"]);
	
	case "Mine" (remove):
	say("@The mountains on this island hold some of the strongest stone or something like that. It is mined quite heavily and from what I see is a rather dangerous place to work.@");
	say("@You would not believe the number of injuries that those who mine it end up sufferring. If it were not for Walter's skilled hand I have no doubt it would be quite a deadly place to work.@");
	say("@Oddly enough, the only one who Walter is tending to at the moment is indeed a miner but he was not injured at work. He was actually beaten by a gang of thugs.@");
	
	case "Thugs" (remove):
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
		say("@The town had been in the grip of fear from a group of thugs who were attacking people at night.@");
		say("@Thankfully they have been dealt with, rather harshly if I do say so myself. It is a good thing too as a group of thugs was the last thing this town needed right now.@");
	}
	else
	{
		say("@The town has been in the grip of fear over a band of thugs who come out of the shadows and attack people in the night. People are starting to get scared to travel out at night for fear of encountering them.@");
		say("@I do hope they are captured soon. This is the last thing Rosendale needs right now.@");
	}
	add(["Last thing"]);
	
	case "Last thing" (remove):
	say("@The town has been hit quite heavily since the Nautical Guild stopped sailing as it depends on tourism to the Galleria to bring in much needed income.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@Although the ban on sailing has been lifted I fear it will be some time until tourism returns to its previous levels.@");
	}
	else
	{
		say("@Until the ban on sailing is lifted the town will continue to suffer from the lack of tourists. I do hope the ban will be lifted soon.@");
	}
	add(["Galleria"]);
	
	case "Galleria" (remove):
	say("@The Galleria is a great gallery with many fine statues carved by a local artisan named Igon. If you have time I strongly suggest you visit it so that you can see the beauty for yourself.@");
	
	case "Walter" (remove):
	say("@Walter is the town healer and also my husband. I help him with his duties whenever he needs it, which can be quite often with how dangerous the mine can be.@");
	say("@It actually makes me feel quite good to be able to help him so much. It truely helps to solidify our loving bond.@");
	
	case "Buy" (remove):
	say("@What can I interest you in?@");
	if(UI_get_schedule_type((-492)) == TEND_SHOP)
	{
		var pearlcost = 5;
		var bloodmosscost = 6;
		var nightcost = 6;
		var mandrakecost = 11;
		var garliccost = 2;
		var ginsengcost = 3;
		var silkcost = 3;
		var ashcost = 5;
		var bloodspawncost = 20;
		var scalescost = 8;
		BuyReagents(pearlcost, bloodmosscost, nightcost, mandrakecost, garliccost, ginsengcost, silkcost, ashcost, bloodspawncost, scalescost);
	}
	else
	{
		say("@I am currently not open for business. Please return during the day and we can work something out then.@");
	}
	
}
}
else if (event == DEATH)
{
}

}