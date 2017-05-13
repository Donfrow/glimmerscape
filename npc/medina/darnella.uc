/*
Darnella - the sea salvage lady
*/

void Darnella object#(0x5da) ()
{

	
var bark = "Ahoy there";
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
				UI_item_say(item, "The upkeep is enourmous");
			else if (n == 2)
				UI_item_say(item, "Business is slowing");
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
        call Darnella, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

UI_show_npc_face(item);

if(inParty(-474))
{
	say("@What can I do for you?@");

	converse(["Job", "Bye", "Leave"])
	{
		case "Bye" (remove):
		say("@Of course.@");
		break;
		
		case "Job" (remove):
		say("She looks at you with a puzzled look. @You have hired me for salvaging lost ships.@");
		
		case "Leave" (remove):
		say("She nods. @I hope you have found your salvaging to be rewarding.@");
		
		var loc = get_object_position(AVATAR);	
		var scroll = UI_find_nearby(loc, GOOD_SCROLL, 25, MASK_NONE);
		UI_remove_party_items(1, GOOD_SCROLL, 104, ANY);
		UI_remove_item(scroll);
		UI_remove_from_party(-474);
		break;
	}
	
}

else
{
if(UI_get_item_flag(item, MET))
{
	say("@Ahoy again. Always a pleasure to see you.@");
}
else
{
	say("A salty wench looks back at you. @Ahoy there. What can I do for you?@");
	add(["Name"]);
}

add(["Job", "Bye"]);

converse([])
{

	case "Bye" (remove):
	say("She waves you off. @Enjoy all that is out there mate.@");
	break;
	
	case "Name" (remove):
	say("She nods her head at you. @I be known as Darnella.@");
	UI_set_item_flag(item, MET);
	
	case "Job" (remove):
	say("A big grin appears on her face. @I be the owner and propreitor of Darnella's Salvage and Baked Goods.@");
	add(["Salvage", "Baked goods"]);
		
	case "Baked goods" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("Darnella quickly blushes. @Business was pretty slow since LeChuck was ruling the seas so I decided to supplement my income by selling baked goods.@");
		say("@It turns out I was a rather poor baker and all the goods I baked seemed to make people sick. Hopefully with LeChuck dead the salvage business will once again pickup.@");
	}
	else
	{
		say("Darnella quickly blushes. @The salvage business has been pretty slow since LeChuck has been raiding any ships at seas so I decided to supplement by income by selling baked goods.@");
		say("She sighs. @Unfortunately that has not been working out too well. It turns out I am a rather poor baker and all my goods tend to make people sick.@");
		say("@Hopefully LeChuck is soon brought to justice and I can once again focus on the salvage business, but until then I will do what I can.@");
	}
	add(["LeChuck"]);
	
	case "LeChuck" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@LeChuck was a fearsome pirate that nearly brought the Nautical Guild to its knees. Thankfully LeChuck has now been slain so hopefully we can all get back to sailing as usual.@");
	}
	else
	{
		say("@LeChuck is a fearsome pirate that has nearly brought the Nautical Guild to its knees. In face they have already placed a bounty on his head to anyone who can bring the beard from his cold dead body.@");
		add(["Bounty"]);
	}
	
	case "Bounty" (remove):
	say("@There is indeed a bounty on the head of LeChuck. If you are interested in it I suggest you go to the Nautical Guild to look into it.@");

	case "Salvage" (remove):
	say("Her eyes beam. @Helping people salvage ships lost at sea is my game. My ship is configured with a special dive system that lets one walk along the ocean floor.@");
	say("@In fact it is so complex that noone has yet managed to create a replica that comes anywhere close to the functionality I provide to my clients.@");
	say("@And lucky for you, given the recent situation among the seas I am now offering bargain prices for anyone who wishes to go salvaging.@");
	add(["Lost ships", "Dive system", "Complex", "Bargain prices"]);
	
	case "Lost ships" (remove):
	say("@Many ships which sail the seas never make it back to port. They may sink because of rough seas, pirates, or even shotty construction.@");
	say("@Whatever the case is they all end up at the same place: The bottom of the sea.@");
	
	case "Dive system" (remove):
	say("@My unique, patented dive system is built right into my vessel. This allows me to take those willing to pay the price out to sea to search for treasure thought lost to the sea forever.@");
	
	case "Complex" (remove):
	say("@My dive system is quite complex. It is so complex in fact that my competition has been unable to successfully create a replica that comes anywhere close to mine.@");
	say("@It begins by using a series of pumps and tubes in my ship that connect to a specially configured dive suit that the treasure hunter wears to walk along the ocean floor.@");
	say("@Air is constantly pumped down these tubes to the diver to enable breathing as if it was the surface.@");
	say("@When the diver wishes to return to the surface they simply use my specially designed dive beacon to notify me they wish to return to the surface.@");
	say("She laughs. @And if it sounds very complex to you, it is because it is!@");
	add(["Competition"]);
	
	case "Competition" (remove):
	say("@My competition has been trying to steal my dive system technology for years but it is so complex that they have come nowhere close to successfully recreating it.@");
	say("She ponders for a moment. @In fact, given the recent trouble at the seas brought about LeChuck I am not sure any of them are even still in business.@");
	add(["LeChuck"]);
	
	case "Bargain prices" (remove):
	say("@Good news! Due to the recent pirate activity I have lowered my standard dive fee from 5000 gold coints to only 1000 gold coins! That means you can search for treasure for under half my usual price!@");
	say("@But that is not all! For this low price you get not just one dive, but unlimited dives while we are out sailing! Do not be a fool, do not pass up this opportunity!@");
	add(["Hire"]);
	
	case "Hire" (remove):
	if(chargeGold(1000)) // set to lower number for testing
	{
		say("@Excellent! I just need you to sign this waiver of liability in the event of a most unfortunate undersea accident.@");
		say("She pulls out a large scroll.");
		say("@This indicates you understand the risks associated with such activities and that you no way whatsoever hold Darnella's Salvage and Baked Goods liable for injuries sustained during a dive.@");
		say("She points her finger to various areas on the document. @Just sign here, here, here, here, here, and here.@");
		say("As you sign the document she smiles. @Excellent! We are now ready for a most rewarding undersea adventure!@");
		say("@When you are ready let us set sail on my ship. When you wish to dive simple stop sailing, roll up the sails and use the dive machine on my ship.@");
		//say("@Be sure that you are not carrying too many items, especially more than would");
		UI_add_to_party(-474);
		salvage_scroll = UI_add_party_items(1, GOOD_SCROLL, 104, 0);
	}
	else
	{
		say("@You do not have enough gold coins to afford a dive.@");
	}
}
}
}


}