/*
Alagnar in Brentonia
*/

void Alagnar_Train()
{
UI_push_answers();

converse(["Yes", "No"])
{
	case "Yes" (remove):
	if(UI_get_npc_prop(AVATAR, TRAINING) >= 1)
	{
		var currentMaxMana = UI_get_npc_prop(AVATAR, MAX_MANA);
		var currentInt = UI_get_npc_prop(AVATAR, INTELLIGENCE);
		
		if(currentInt == 30 && currentMaxMana == 30)
		{
			say("@There is nothing you can learn from me. You are already as wise to the ways of the world as I am.@");
			UI_clear_answers();
			UI_pop_answers();
			break;	
		}
		else
		{
			if(chargeGold(75))
			{
				say("Alagnar produces a scroll and places it before you. @Attempt to read this scroll. Try to make out what it says.@");
				say("As you begin to read the scroll Alagnar shakes his head. @No, you must look at the full context of the word to understand its meaning. This is how you gain knowledge.@");
				say("Alagnar draws a line under several words. @Do you see how completely seperate ideas flow to form one full idea, granting you a greater picture of the situation?@");
				say("As you continue to read Alagnar draws more lines. @You must look how these thoughts then form to reveal an even greater picture of the world at large.@");
				say("When you finish reading the scroll Alagnar nods. @You have not fully understood the scroll but I can tell that you have a basic understanding of the overall premise.@");
				say("@If you look at all areas of the world like this you will see how it flows together, how everything has a connection, an overall idea. Keep this in mind and the world shall become clearer.@");
				
				//AVATAR.say("Current mana is ", currentMana, " and current int is ",currentInt);
				
				var maxMana = (30-currentMaxMana);
				if (maxMana > 4)
					maxMana = 4;
					
				var maxInt = (30-currentInt);
				if (maxInt > 2)
					maxInt = 2;
					
				//AVATAR.say("Increasing mana by ", maxMana, " and increasing int by ", maxInt);
				
				UI_set_npc_prop(AVATAR, MAX_MANA, maxMana);
				UI_set_npc_prop(AVATAR, INTELLIGENCE, maxInt);
				UI_set_npc_prop(AVATAR, TRAINING, -1);			
				UI_clear_answers();
				UI_pop_answers();
				break;					
			}
			else
			{
				say("@You do not have enough coin to afford the training.@");
				UI_clear_answers();
				UI_pop_answers();
				break;	
			}
		}
	}

	case "No" (remove):
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;	
	
}
}

void PartWithShield2000Gold()
{

	converse(["Now you are talking, of course!", "Negative"])
	{
		case "Now you are talking, of course!" (remove):
		{
			say("@You drive a hard bargain. I am glad we have been able to come to an agreement. It has been a pleasure doing business with you.@");
			UI_remove_party_items(1, 490, ANY, ANY);
			UI_add_party_items(2000, SHAPE_GOLD, ANY, ANY);
			gflags[SOLD_SHIELD] = true;
			karma = karma - 1000;
			UI_clear_answers();
			UI_pop_answers();
			break;	
		}
		case "Negative" (remove):
		{
			say("@It would seem that you do not wish to part with your shield. I can respect that.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
	}

}

void PartWithShield()
{
    UI_push_answers();
    UI_add_answer("Of course, me loves the shineys");
    UI_add_answer("You insult me with such a petty offer!");
	UI_add_answer("Nevermind");
    converse
    {
        if (response == "Of course, me loves the shineys")
        {
            say("@Lovely! Here is your coin. The museum thanks you.@");
            UI_remove_party_items(1, 490, ANY, ANY);
            UI_add_party_items(1500, SHAPE_GOLD, ANY, ANY);
            gflags[SOLD_SHIELD] = true;
            karma = karma - 500;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "You insult me with such a petty offer!");
        {
            say("@Well, it was worth asking... perhaps 2000 gold coins?@");
			UI_remove_answer("Of course, me loves the shineys");
			UI_remove_answer("You insult me with such a petty offer!");
			UI_remove_answer("Nevermind");
			PartWithShield2000Gold();
			UI_pop_answers();
			break;

        }
		else if (response == "Nevermind")
		{
			say("@As you wish.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
    }
}

void Alagnar object#(0x4ec) ()
	{

var molten_cloak = UI_count_objects(PARTY, MOLTEN_CLOAK, ANY, ANY);
var shield_of_valor = UI_count_objects(PARTY, 490, ANY, ANY);

var bark = "I see your mind seeks knowledge";
var bark_intro = "Hail sage";
	
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
				UI_item_say(item, "Very interesting");
			else if (n == 2)
				UI_item_say(item, "A good idea");
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
        call Alagnar, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (UI_get_item_flag(item, MET)) 
	{
		say("@Always a pleasure to see you.@");
		UI_remove_answer("Name");

	}
else
	{

		say("@Ah, another mind which seeks knowledge.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if (molten_cloak > 0 && gflags[QUEST_FOR_MOLTEN_CLOAK])
{
    UI_add_answer("I have the cloak");
}


		converse
		{
        if (response == "Bye")
        {
            say("@Do not give up on your quest to seek knowledge.@");
            break;
        }
        else if (response == "Name")
        {
            say("@You may call me Alagnar.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am a scholar and a sage here in Brentonia, as well as a member of the Inner Circle. I also take time out of my day to train those who seek knowledge.@");
            UI_remove_answer("Job");
            UI_add_answer("Brentonia");
            UI_add_answer("Scholar");
			UI_add_answer("Inner Circle");
			UI_add_answer("Train");
        }
        else if (response == "Brentonia")
        {
            say("@It is a fine city run by Lord Brent. Tis also a very good place to see ancient artifacts and other relics.@");
            UI_remove_answer("Brentonia");
            UI_add_answer("Artifacts");
        }
        else if (response == "Artifacts")
        {
            say("@When an artifact is brought before Lord Brent it is sent to me for appraisal and purchase, if I feel it is worthwhile. These artifacts are then put on display in the museum.@");
            say("@So if you come across any artifacts that you wish to part with do not hesitate to bring them to me.@");
            UI_remove_answer("Artifacts");
            if (shield_of_valor > 0)
            {
                UI_add_answer("Shield of Valor");
            }
        }
        else if (response == "Scholar")
        {
            say("@It is one who is learned. I am very knowledgeable on such things as ancient artifacts and relics. One of the many objects I examined is an ancient scroll from the Ophidian empire.@");
            UI_remove_answer("Scholar");
            UI_add_answer("Scroll");
        }
        else if (response == "Scroll")
        {
            if (gflags[QUEST_FOR_MOLTEN_CLOAK])
            {
                say("@I do not know what more you want with me. I have already given you the scroll.@");
            }
            else
            {
            say("@It is most intriguing. It deals with the legend of the Orb of Infinity and how to construct the fabled device.@");
            UI_add_answer("Orb of Infinity");
            if (gflags[AQUIRE_ALAGNAR_SCROLL])
            {
                UI_add_answer("I want that scroll");
            }
            }
            UI_remove_answer("Scroll");
        }
        else if (response == "Orb of Infinity")
        {
            say("@It is of my learned opinion that the Orb of Infinity never existed and is merely a tale meant to show the terrible fate that bestows those who seek ultimate power.@");
            UI_remove_answer("Orb of Infinity");
        }
        else if (response == "I want that scroll")
        {
            say("@Well, I have learned all of which I can from it at this point, but it is still an ancient artifact that is to go in the museum. However, I do believe we can work something out.@");
            UI_remove_answer("I want that scroll");
            UI_add_answer("Work something out");
        }
        else if (response == "Work something out")
        {
            say("@Sadly an actual object tends to be more interesting to the public than an old piece of parchement, despite what the parchment may contain.@");
            say("@It is for this reason I am willing to work out a trade with you. There is an artifact known as the Molten Cloak which history and lore, both of which are fascinating.@");
			say("@If you would bring this to me I would exchange it to you for the scroll.@");
            UI_remove_answer("Work something out");
            UI_add_answer("Molten Cloak");
            gflags[QUEST_FOR_MOLTEN_CLOAK] = true;
        }
        else if (response == "Molten Cloak")
        {
            say("@It is believed to be a cloak which once draped the shoulders of the king of the demons, Tranix, long ago within the demon realm.@");
            say("@Legend has it that when man first entered the demon realm in a showing of peace Tranix exchanged the Molten Cloak for the Hammer of Dedication.@");
            say("@The cloak itself is far too cumbersome for a human to wear but the history and lore surrounding it more than makes up for that.@");
			say("@If you wish to do the exchange I suggest that you seek out Gabbie Mardoddle of the Solusek Mining Company. Rumour has it that she has come into possession of it.@");
            UI_remove_answer("Molten Cloak");
        }
        else if (response == "I have the cloak")
        {
            say("@I will not enquire as to how you managed to get the cloak but I am pleased that you managed it. This shall fit wonderfully in the museum. Here is the scroll that you seek.@");
            UI_remove_party_items(1, MOLTEN_CLOAK, 0, 0);  // Removes cloak
            UI_add_party_items(1, ANCIENT_SCROLL, ANY, ANY); // Adds scroll
            UI_remove_answer("I have the cloak");
            gflags[GAVE_MOLTEN_CLOAK] = true;
        }
        else if (response == "Shield of Valor")
        {
            say("@I have heard of this item. It is an old shield which is passed on from many noble and skilled warriors. Last I had heard Hectar of Dewtopia possessed it.@");
            say("@Seeing as you have it now you must have done something couragous to earn it from him.@");
            say("@I doubt one such as yourself who has earned the shield through blood and sweat would part with it for mere coin... but would you consider parting with it for 1500 gold coins?@");
            PartWithShield();
            UI_remove_answer("Shield of Valor");
        }
		else if (response == "Inner Circle")
		{
			say("@While Brentonia is officially ruled by Lord Brent the Inner Circle helps to guide him in his decision making. Rarely does Lord Brent make a decision without consulting us.@");
			UI_remove_answer("Inner Circle");
		}
		else if (response == "Train")
		{
			say("@I can train your mind to work with the world around you. You will find this will help your spell casting ability. However I must charge you 75 gold coins for the lession.@");
			say("@Do you wish for me to teach you?@");
			Alagnar_Train();
			UI_remove_answer("Train");
		}
        
		}
}
	UI_remove_npc_face(item);
	}

