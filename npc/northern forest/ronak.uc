/*
Ronak the old royal courier from Brentonia
*/

void RonakPapers2ndPayment()
{
UI_push_answers();

converse(["Final payment", "I will return with the money", "Enough of this, time to die!"])
{

	case "Final payment" (remove):
	if(chargeGold(500))
	{
		say("As you fumble through your belongings you come across the appropriate amount of coins and give them to Ronak as he grins.");
		say("@Very well, I suppose now I can part with the papers. I do not think you could afford much more and even dogs such as yourself need to be able to purchase moldy bread to eat.@");
		gflags[RONAK_FULLY_PAID] = true;
		// Add the papers
		UI_add_party_items(1, 797, 109, 3);
	}
	else
	{
		say("Ronak grumbles at you as you search your pockets for the coin. @It seems you are a bit short changed. Come back to me when you have the gold coins.@");
	}
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Enough of this, time to die!" (remove):
	say("I should have known a dog such as yourself would resort to violence. Prepare to meet your end!@");
	gflags[KILL_RONAK] = true;
	if(gflags[PAID_RONAK_GOLD])
	{
	}
	else
	{
		karma = karma - 650;
	}
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "I will return with the money" (remove):
	say("Ronak beams you a large, toothy grin. @Yes, you do that.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

}
}

void Ronak_Papers()
{
UI_push_answers();

converse(["Deal", "How about I simply kill you and take them?", "I will return with the money"])
{

	case "Deal" (remove):
	if(chargeGold(500))
	{
		say("As you fumble through your belongings you come across the appropriate amount of coins and give them to Ronak as he grins.");
		say("@It would seem that my price has just risen. I will now need another 500 gold coins to part with the papers. Do speak to me again sometime when you have the additional coins.@");
		gflags[PAID_RONAK_GOLD] = true;
		karma = karma + 650;
	}
	else
	{
		say("Ronak grumbles at you as you search your pockets for the coin. @It seems you are a bit short changed. Come back to me when you have the gold coins.@");
	}
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "How about I simply kill you and take them?" (remove):
	say("Ronak's eyes widen as you threaten him. @How dare you insult me by saying such a thing! Prepare to meet your end!@");
	gflags[KILL_RONAK] = true;
	if(gflags[PAID_RONAK_GOLD])
	{
	}
	else
	{
		karma = karma - 500;
	}
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "I will return with the money" (remove):
	say("Ronak beams you a large, toothy grin. @Yes, you do that.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

}

}

void Ronak object#(0x5ac) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Yes?";
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
				UI_item_say(item, "Charmed, I am sure");
			else if (n == 2)
				UI_item_say(item, "This is so blazee");
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
        call Ronak, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@Why do you continue to pester me?@");
}
else
{
	say("The man turns and looks at you. @Yes? Is there something you want?@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

if(gflags[PAID_RONAK_GOLD] && !gflags[RONAK_FULLY_PAID])
{
	add(["I want the papers"]);
}

converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("The man turns his back to you without a word.");
	break;
		
	case "Name" (remove):
	say("The man snorts. @If you must know I am Ronak.@");
	UI_set_item_flag(MET);
	
	case "Job" (remove):
	say("The man laughs at you. @Of course someone as simple as you would not know what someone like me does. I am a royal courier for Brentonia.@");
	add(["Brentonia", "Courier"]);
	
	case "Brentonia" (remove):
	say("It almost appears as if Ronak snarls as you mention Brentonia. @A city in the northern mountain range. Now please, leave me be.@");
	break;
	
	case "Courier" (remove):
	if(gflags[RONAK_FULLY_PAID])
	{
		say("@You should be well aware by now what I do. After parting with so much money I would have expected you to remember this.@");
	}
		else
		{
		say("@I am a royal courier, who takes important documents to important people. It is a great privlige which you could never hope to achieve.@");
		say("@Now please leave me be for I am a very important and busy person.@");
		if(gflags[FIND_BRENTONIAN_COURIER])
		{
			add(["Expelled from Brentonia"]);
		}
		else
		{
			break;
		}
	}
	
	case "Expelled from Brentonia" (remove):
	say("Ronak snarls at you as you question Ronak about being expelled from Brentonia. @So you have heard that I am no longer an actual royal courier.@");
	say("@You had best keep it to yourself as I have an image to maintain. Until word further spreads I can still receive free gifts and goods on behalf of Brentonia.@");
	add(["Shelter papers", "Why expelled?"]);
	
	case "Shelter papers" (remove):
	say("You question Ronak about the papers that Lewis needs in order to receive payment for the Brentonian homeless shelter. @I am sure I still have those somewhere.@");
	add(["I want the papers"]);
	
	case "I want the papers" (remove):
	if(gflags[PAID_RONAK_GOLD])
	{
		say("Ronak smiles with a large grin. @I see you have returned. I am sorry to say my financial situation needs some improvement and I will need a final payment of 500 gold coins to part ways with the royal papers.@");
		RonakPapers2ndPayment();
	}
	else
	{
		say("Ronak laughs. @I was going to simply toss them out but now that you are here asking about them I am sure something could be arranged for me to pass them to you.@");
		say("@And as you are the one in need of them it seems I am in the position of power. How about 500 gold coins for me to part ways with them?@");
		Ronak_Papers();
	}
	if(gflags[KILL_RONAK])
	{
		UI_set_alignment(-428, HOSTILE);
		UI_set_schedule_type(-428, IN_COMBAT);
		UI_set_opponent(-428, PARTY);
		break;
	}
	
	case "Why expelled?" (remove):
	say("@That is not for you to concern yourself with!@");

}

}
}

