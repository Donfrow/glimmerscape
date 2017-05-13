/*
Walter, Rosendale healer
*/


void Walter_Buy()
{
UI_push_answers();

say("@Are you interested in potions or bandages?@");

converse(["Potions", "Bandages", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Potions" (remove):
	var healcost = 7;
	var poisoncost = 4;
	var sleepcost = 9;
	var manacost = 30;
	BuyPotions(healcost, poisoncost, sleepcost, manacost);
	
	case "Bandages" (remove):
	var bandagecost = 5;
	BuyBandages(bandagecost);

}

}

void Walter object#(0x5eb) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "I hope you are well";
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
				UI_item_say(item, "But of course");
			else if (n == 2)
				UI_item_say(item, "A wonderful idea");
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
        call Walter, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("Walter waves at you. @It is good to see you are still well.@");
add(["Job", "Bye"]);
}
else
{
say("A rather quaint looking man greets you. @Well good to day you. I hope all is well.@");
add(["Name", "Job", "Bye", "Buy"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@It has simply been a pleasure.@");
	break;
	
	case "Name" (remove):
	say("He chuckles to himself. @You have no idea how many times I get asked that question by people who I have already introduced myself to. The amount of head injuries I treat is astounding.@");
	say("@But I digress. I am Walter.@");
	
	case "Job" (remove):
	say("@I am a healer, and as such I treat the wounded, the ill, all those who need to be taken care of. It is a very hectic life but it is a very rewarding one.@");
	say("@I also sell bandages and potions to those who require them.@");
	add(["Healer", "Wounded", "Hectic", "Buy"]);
	
	case "Healer" (remove):
	say("@I am the healer here in Rosendale. It is not what I had thought my life would be when I was a small lad but I must say I am quite pleased with my profession.@");
	say("@It is quite an experience knowing that you have managed to bring someone back from the brink of death. The life of a healer is certainly the life for me.@");
	add(["Rosendale"]);
	
	case "Rosendale" (remove):
	say("@Rosendale is a rather pleasent place to live. It has its shares of ups and downs but overall I could not think of a better place to live.@");
	
	case "Wounded" (remove):
	say("@You would be quite surprised at the amount of wounded whom enter my doorway for how big Rosendale is. The mine in the mountains to the west can cause quite a few injuries.@");
	say("@Frankly, with how hard the rock is and the difficulty involved in excavating it I am surprised I do not end up treating more people than I do.@");
	add(["Mine", "Rock"]);
	
	case "Mine" (remove):
	say("@The mine is on the western most half of the island and can be quite dangerous. I expect to treat at least one injury a week from those who work in the mine.@");
	say("@In fact, my current guest works in the mine but surprisingly enough his injuries are not a result of his work.@");
	add(["Guest"]);
	
	case "Guest" (remove):
	say("@My current guest is Marsh. He works in the mine and I have treated him several times already for injuries he endured during the course of his work.@");
	say("He leers at you. @This time however his injuries were not sustained during his normal work day. He was actually accosted but a group of thugs and nearly beaten to death.@");
	add(["Thugs"]);
	
	case "Thugs" (remove):
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
		say("@A group of thugs had been robbing citizens for some time now. I have treated quite a few scrapes and bruises from their victims.@");
		say("@Marsh, by far, has suffered the most serious injuries of any of those they have mugged.@");
		say("@Thankfully they have been brought to justice. A town should not have to live in fear of troublemakers.@");
	}
	else
	{
		say("@A group of thugs have been robbing citizens for some time now. I have treated quite a few scrapes and bruises from their victims.@");
		say("@Marsh, by far, has suffered the most serious injuries of any of those they have mugged.@");
		say("@Sadly they have yet to be brought to justice. A town should not have to live in fear of troublemakers.@");
	}
	
	case "Rock" (remove):
	say("@The rock found in the mountains is one of the strongest rock you can find anywhere and is quite difficult to mine. I have no doubt this contributes to the number of injuries the miners sustain.@");
	
	case "Hectic" (remove):
	say("@It is not always hectic but the moment a gravely wounded person is brought through the door I have no choice but to keep a close eye on them all day and night.@");
	say("@Sometimes I work for days on end without a wink of sleep to keep the injured alive. It can be quite difficult but in the end I know it is all worth it.@");
	say("@Thankfully my lovely wife understands my committment and does not condemn me for it.@");
	add(["Wife"]);
	
	case "Wife" (remove):
	say("His eyes light up. @Joy is my lovely wife and the love of my life. She lives with me and helps me tend to the wounded when I need her help.@");
	say("@She also sells reagents for those who require them for a fair price.@");
	
	case "Buy" (remove):
	if(UI_get_schedule_type(-491 == TEND_SHOP))
	{
		Walter_Buy();
	}
	else
	{
		say("@I am currently not open for business. Please return during the day.@");
	}
	
}
}
else if (event == DEATH)
{
}

}

