/*
Lewis in Brentonia
*/

void Lewis_Find_Papers()
{
UI_push_answers();

converse(["Yes", "No"])
{

	case "Yes" (remove):
	say("@I cannot thank you enough. I would do this myself but if anyone saw me leave the city no doubt it would be assumed I have pocketed the coin and am now fleeing the city.@");
	gflags[FIND_BRENTONIAN_COURIER] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("@Of course, you, like everyone else in this town, have no reason to help me out of this situation.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

}

}

void Lewis_Shelter_Coin()
{
UI_push_answers();

converse(["Yes", "No"])
{

	case "Yes" (remove):
	if(chargeGold(10))
	{
		say("You search your bags and hand over 10 gold coins. @Thank you very much. The shelter thanks you.@");
	}
	else
	{
		say("As you search your pockets you come up empty. @I am sorry, I should not ask those in need to contribute to such things.@");
	}
	karma = karma+50;
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "No" (remove):
	say("The man sulks as you shake your head no. @Very well. I understand. We cannot all care about those in need.@");
	karma = karma - 50;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Lewis object#(0x5ab) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Hail to you";
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
				UI_item_say(item, "Spare some coin?");
			else if (n == 2)
				UI_item_say(item, "Help the shelter!");
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
        call Lewis, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@A pleasure, as always.@");
}
else
{
	say("@Might you spare 10 gold coins for the shelter?@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
	Lewis_Shelter_Coin();
}

if(gflags[PAID_LEWIS_DEBT] && !gflags[PAID_LEWIS_DEBT_CONVOKILLER])
{
	add(["Debt is paid"]);
	
}
	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("The man waves. @I hope the world continues to treat you well.@");
	break;
		
	case "Name" (remove):
	say("@I am Lewis of Brentonia, at your service.@");
	
	case "Job" (remove):
	say("@I am, nay, I should say was, the planner behind the Brentonian homeless shelter. Sadly, now I spend my days trying to repay the debt it took to build.@");
	add(["Brentonia", "Planner", "Homeless shelter", "Debt"]);
	
	case "Brentonia" (remove):
	say("@It is a very fair city, if you are one who can afford the cost to rent within it. But I suppose such costs come to keep such a fortified city running.@");
	add(["Fortified"]);
	
	case "Fortified" (remove):
	say("@Indeed, the city is quite fortified. It is completely surrounded by mountains in all areas but one. That area acts as the entrance and is extensively protected.@");
	say("@It is perhaps the best fortified city in all of Desporia.@");
	
	case "Planner" (remove):
	say("@I design buildings and hire the labourers to complete the work. My latest creation was the homeless shelter built in Brentonia.@");
	say("@It was a well designed building but I neglected to take into account the damage the residents would end up doing to it.@");
	add(["Damage"]);
	
	case "Damage" (remove):
	say("@The residents of the homeless shelter are those who are homeless, lazy, or simply leaches on society. Sadly, this tends to leave them constantly moving from city to city.@");
	say("@As such most of them have no regard for the places they stay and tend to leave scraps of food and other garbage laying about. You would think such people would be thankful to have such a place and try to keep it clean.@");
	say("He shrugs his shoulders. @But it seems there is no honour, no civility, amoung the lot of them, so it has quickly started to fall apart due to their lack of care.@");
	
	case "Homeless shelter" (remove):
	say("@The homeless shelter was a plan that was put together by Tonidra before her passing. She felt that those less fortunate deserved a place to stay and rest, free of cost.@");
	say("@Initially it was well received by the citizens of Brentonia but since Tonidra's passing they have either forgotten about it or stopped caring. Hence the state it is in today.@");
	add(["Tonidra"]);
	
	case "Tonidra" (remove):
	say("@Tonidra was a kind woman with good standing in the eyes of the citizens as she was a member of the inner circle of Brentonia. I suspect this is the only reason the shelter ever mustered enough support for its construction.@");
	say("@Sadly Tonidra was murdered by one of the very people she tried to help, at the shelter no less. I suppose it is a good thing, in a twisted way, as this has prevented her from seeing what her dream has become.@");
	add(["Inner Circle", "Murdered"]);
	
	case "Inner Circle" (remove):
	say("@I do not know much about the Inner Circle but what I do know is that it is a number of advisors to Lord Brent. You should ask around if you wish to know more information about it.@");
	
	case "Murdered" (remove):
	say("Lewis shakes his head. @A simple tale, yet sad. She had went to visit the shelter to check on those who were staying there. Sadly, she had an altercation with one of them.@");
	say("@This altercation cumulated to a physical altercation in which she and one of the homeless fell to their deaths.@");
	say("@I suppose that goes to show you what an ungrateful lot they are.@");
	
	case "Debt" (remove):
	if(gflags[FIND_BRENTONIAN_COURIER])
	{
		if(gflags[PAID_LEWIS_DEBT])
		{
			say("@I cannot thank you enough for recovering the official payment papers! I am now able to pay off the debt I incurred to the suppliers and labourers.@");
			say("@Thank you again!@");
		}
		else
		{
			say("Lewis shakes his head. @Tonidra hired me to plan and construct her vision of a homeless shelter for Brentonia. I was to be paid from the coffers of Brentonia for the labour after its construction.@");
			say("@However, it would seem that the royal courier, Ronak, who was to bring the official papers to Telur so that I could receive the coin was expelled from the city for an unrelated issue.@");
			say("@It also seems that he took these papers with him when he left the city.@");
			say("@Normally this would not be an issue as the original papers would be cancelled and new papers drawn up, however with the death of Tonidra there is no longer any voice inside the Inner Circle to get this done.@");
			say("@Now I have no choice but to beg those in the city to donate to help pay off the fees which I incurred to construct the shelter... and that could take some time.@");
			say("@But you know all of this already and I am thankful you will help me track down the courier. I am sorry to prattle on about it.@");
			add(["Papers", "Courier", "Telur", "No voice"]);
		}
	}
	else
	{
		say("Lewis shakes his head. @Tonidra hired me to plan and construct her vision of a homeless shelter for Brentonia. I was to be paid from the coffers of Brentonia for the labour after its construction.@");
		say("@However, it would seem that the royal courier, Ronak, who was to bring the official papers to Telur so that I could receive the coin was expelled from the city for an unrelated issue.@");
		say("@It also seems that he took these papers with him when he left the city.@");
		say("@Normally this would not be an issue as the original papers would be cancelled and new papers drawn up, however with the death of Tonidra there is no longer any voice inside the Inner Circle to get this done.@");
		say("@Now I have no choice but to beg those in the city to donate to help pay off the fees which I incurred to construct the shelter... and that could take some time.@");
		say("Lewis thinks for a moment. @Perhaps you could find the courier and retrieve the papers from him so that I can receive the coin to pay off the workers I hired?@");
		Lewis_Find_Papers();
		add(["Papers", "Courier", "Telur", "No voice"]);
	}
	
	case "Papers" (remove):
	say("@The papers which were to be delivered contain all the information, approvals, and seals so that Telur knows it is a real document and not a forgery.@");
	
	case "Courier" (remove):
	say("@I have no idea why Ronak took the papers with him when he was removed from the city. No doubt he is enjoying his new life without a care for the situation he has left me in.@");
	add(["Where is he?"]);
	
	case "Where is he?" (remove):
	say("@He is most likely living in an inn somewhere as when he was removed from Brentonia he was left homeless. I doubt he has gone very far though as oddly enough, for a courier he really not enjoy moving around much.@");
	say("@I think he simply enjoyed the prestige that came with his position more than anything.@");
	say("@To be quite honest it would not surprise me if that man was staying in the Northern Forest trying to live up how important he is.@");
	
	case "Telur" (remove):
	say("@Telur is the caretaker of the royal mint in Brentonia. It is he who doles out the gold when he has the proper papers stating to do so.@");
	
	case "No voice" (remove):
	say("@Tonidra was the main voice behind the consturction of the shelter. With her no longer supporting it seems like the Inner Circle has choosen to ignore it, not actually caring that there is still unfinished business with it.@");
	say("@It is because of this apathy that I am in the situation I am now in.@");

	case "Debt is paid" (remove):
	say("As you relate the tale of the courier Lewis beams a smile at you. @Thank you for much! I cannot believe this is now finally going to be dealt with. I could not have done it without you. It was only a matter of time until those who were owed money came for my head.@");

	UI_set_npc_prop(AVATAR, TRAINING, 2);
	UI_set_npc_prop(AVATAR, STRENGTH, 2);
	
	gflags[PAID_LEWIS_DEBT_CONVOKILLER] = true;
}

}
}

