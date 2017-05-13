/*
Bethany the seemstress
*/


void Bethany object#(0x5e7) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Well met";
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
				UI_item_say(item, "I love my son");
			else if (n == 2)
				UI_item_say(item, "Must keep at it");
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
        call Bethany, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("@It is a pleasure to see you again.@");
add(["Job", "Bye"]);
}
else
{
say("A pleasent looking woman greets you. @A pleasure to make your acquaintance.@");
add(["Name", "Job", "Bye", "Buy"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("A friendly wave sees you off.");
	break;
	
	case "Name" (remove):
	say("@I am Bethany.@");
	
	case "Job" (remove):
	say("@I am but a simple seamstress here in Rosendale. It is not much but at least it brings food to the table for my son Stark.@");
	add(["Seamstress", "Rosendale", "Stark"]);
	
	case "Seamstress" (remove):
	say("@I started sewing when I was a young girl to help clothe the homeless. Eventually I decided to start a business and here I am today.@");
	say("@If you would like, I can sell you some bandages if you require them.@");
	add(["Buy"]);
	
	case "Buy" (remove):
	var bandagecost = 5;
	BuyBandages(bandagecost);
	
	case "Rosendale" (remove):
	say("@Rosendale is a rather nice place to live. There are plenty of visitors and not much crime. It can be quite relaxing.@");
	say("@That is until recently. The pirate menance has put quite a damper on the tourism to the town.@");
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
	}
	else
	{
		say("@And on top of that, we now have a group of thugs ambusing people at night! Maybe the town is going to the dogs...@");
		gflags[HEARD_OF_THUGS] = true;
		add(["Thugs"]);
	}
	add(["Pirates"]);
	
	case "Thugs" (remove):
	say("@Late at night a group of thugs have been ambushing those leaving the pub. I do not know how they have managed to evade capture for so long but I have no doubt Dryn is on the case.@");
	add(["Dryn"]);
	
	case "Dryn" (remove):
	say("She blushes. @My apologies. Dryn is the sheriff of Rosendale.@");
	
	case "Pirates" (remove):
	say("@Recently an increase in pirate activity had been such a concern for the Nautical Guild that they felt it prudent to place a ban on sailing on all their members.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@Thankfully the bounty they placed on LeChuck's head was answered and he is now a shadow in history and the members can once again sail.@");
		say("@I do hope the tourism to the Galleria will increase again.@");
	}
	else
	{
		say("@In the case of Rosendale, which depends quite heavily on tourism to the Galleria, this ban has quit the city quite hard. I only hope the priates are dealt with soon.@");
	}
	add(["Nautical Guild", "Tourism", "Galleria"]);
	
	case "Nautical Guild" (remove):
	say("@The Nautical Guild is what all legitimate sailors join in order to sail the seas. You had best speak with Dockmaster Yarra about that.@");
	
	case "Tourism" (remove):
	say("@Rosendale depends heavily on tourism. It is one of the main sources of income for the town.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("She looks you up and down. @I suppose you are one of the first tourists to come to the island since the Nautical Guild started to sail again.@");
	}
	else
	{
		say("She looks you up and down. @In fact, you are one of the first tourists I have seen since the Nautical Guild placed its ban on sailing.@");
	}
	
	case "Galleria" (remove):
	say("@The Great Galleria of Rosendale is the main attraction in the town. This place has some of the finest statues one can find in all the lands.@");
	say("She laughs. @But Tully could tell you more about that as she knows everything there is to know about that place.@");
	add(["Tully"]);
	
	case "Tully" (remove):
	say("@Tully is the tour guide for the Galleria. She is always happy to speak to people about it.@");
	
	case "Stark" (remove):
	say("@Stark is my son. His father was a tourist who visited the town 10 years ago and left before I even knew I was pregnant. I have not seen him since.@");
	say("She smiles. @But I am quite happy to have my son. He can be quite the handful but he is worth every second of it.@");
	add(["Handful"]);
	
	case "Handful" (remove):
	say("@Stark has been known to get into some trouble now and again but overall he is a goodboy. In fact, Lynel, the owner of the pub, hates Stark and I have never been able to figure out why.@");
	add(["Lynel"]);
	
	case "Lynel" (remove):
	say("@Lynel is an older man who runs the Galleria Gumption, the local pub. I do not think many people care much for him but he makes rather delicious food.@");
	if(gflags[RETRIEVED_STARKS_TOY])
	{
		say("She rolls her eyes. @I always thought him to be a rather unpleasent man but to take a childs toy out of spite is quite disgusting. I am glad you were able to help my son.@");
	}
	else
	{
		say("@Stark has actually been pestering me about Lynel for quite some time now. He keeps telling me that Lynel has stolen his toy or some such.@");
		add(["Stolen"]);
	}
	add(["Stolen"]);
	
	case "Stolen" (remove):
	if(gflags[LEARNED_OF_STARKS_TOY])
	{
		say("@As I mentioned before Stark has been saying that Lynel took one of his toys he left out and refuses to give it back and I simply do not have the time at the moment to deal with this.@");
	}
	else
	{
		say("@Stark has been complaining that Lynel has taken a toy of his and refuses to give it back. I simply do not have the time to deal with this at the moment however.@");
	}
}
}
else if (event == DEATH)
{
	

}


}

