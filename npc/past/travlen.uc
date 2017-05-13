// Travlen in the past

void Travlen object#(0x4e4) ()
{

var bark = "Who dare enter my realm?";
var bark_intro = "Hail";

if (gflags[KILL_BRENDA_TRAVLEN_TALK])
{
}
else
{	
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
				UI_item_say(item, "The suffering...");
			else if (n == 2)
				UI_item_say(item, "They are the ones who are mad");
			}
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
        call Travlen, TALK;
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

if(UI_is_dead(-268)) // Brenda is dead
{
if (UI_get_item_flag(item, MET))
	{
		say("An expressionless face stares at you. @You had best leave this place Avatar.@");
		UI_remove_answer("Name");
		UI_add_answer("Orbs");
	}
else
	{
    	say("You shouldn't be seeing this text");
        UI_set_item_flag(item, MET, true);
	}
	
	converse
	{
	   if(response == "Name")
        {
            say("Why is this showing?");
            UI_remove_answer("Name");
        }
        else if (response == "Bye")
        {
            say("@Leave this place.@");
            break;
        }
        else if (response == "Job")
        {
            say("@My job is now to protect the orbs from those who would abuse the power which they possess.@");
            UI_remove_answer("Job");
        }
        else if (response == "Orbs")
        {
            say("You almost sense as if the man is genuinely apologetic. @I apologize for doing what I did Avatar but I had to do it for the greater good.@");
            UI_remove_answer("Orbs");
            UI_add_answer("Greater good");
        }
        else if (response == "Greater good")
        {
            say("@I have indeed listened to Glenlorn's prophecies. If they are indeed true the orbs shall bring great suffering. I must guard them to prevent this. I must be dead before I shall give up possession of the orbs.@");
            UI_remove_answer("Greater good");
        }
    }

}
else // Orb making sequence not yet initiated
{

if (UI_get_item_flag(item, MET))
	{
		say("The soulless face gazes upon you once more. @You try my patience.@");
		UI_remove_answer("Name");
	}
else
	{
    	say("A soulless face gazes upon you, almost as if looking deep within you. @Tis been some time since one have entered my domain.@");
        UI_set_item_flag(item, MET, true);
	}

    converse
    {

        if (response == "Bye")
        {
            say("@You are lucky this time.@");			
            break;
        }
		else if (response == "Name")
        {
			say("The man looks deep within you. @No doubt I have been removed from all Ophidian references. I am certain they would like to forget that Travlen still exists.@");
			UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("The man laughs at you. @I am to study the magic and arts which that blasted Wisdom's Eye says not to. I shall be the one to create powerful artifacts, I shall be remembered.@");
			say("@I shall not be hampered by a mere trinket!@");
            UI_remove_answer("Job");
            UI_add_answer("Magic and arts");
            UI_add_answer("Wisdom's Eye");
            UI_add_answer("Trinket");
        }
        else if (response == "Magic and arts")
        {
            say("You begin to think that the man will not hurt you, as long as you do not pose a threat to him. @I shall be the one to rise to greatness.@");
			say("@I shall not be hampered by some nameless entity and I shall not be hampered by mere mortals.@");
            UI_remove_answer("Magic and arts");
            UI_add_answer("Mortals");
        }
        else if (response == "Mortals")
        {
            say("A cackle escapes from the whisperly lips. @The Ophidians ordered myself and my fellow mages out of this cavern when it was decreed the great pillars shall no longer be visited.@");
			say("@Many of them turned against me when I refused, and I had no choice but to slay them. Only Brenda was a challenge.@");
            UI_remove_answer("Mortals");
            UI_add_answer("Brenda");
            UI_add_answer("Pillars");
        }
        else if (response == "Brenda")
        {
            say("The man becomes angry. @Brenda is a witch as powerful as I. She was mine lover before the cavern was sealed. She did not wish to leave but she listened to the orders to leave anyway.@");
			say("@She did aid them in their attempt to destroy me but we were too evenly skilled. Neither of us can beat one another.@");
            UI_remove_answer("Brenda");
        }
        else if (response == "Pillars")
        {
            say("You sense the man knows that you seek to use the power of the ancient pillars. @The pillars possess the ability to bind powerful magic into the appropriate vessels.@");
			say("@Place your pieces upon the altars, use your magic and watch the binding occur.@");
            UI_remove_answer("Pillars");
        }
        else if (response == "Wisdom's Eye")
        {
            say("The man grins. @A wonderful tool to control the masses, I will give it that. But it is ntohing but a hamper to innovation and knowledge.@");
			say("@How can one learn greatness if one dare not experiment with the forbidden fruits?@");
            UI_remove_answer("Wisdom's Eye");
            UI_add_answer("Forbidden fruit");
        }
        else if (response == "Forbidden fruit")
        {
            say("You become tense as the man begins to answer. @One must make sacrifices in order to achieve greatness. In fact, I have been looking for a human subject for my experiments.@");
            UI_remove_answer("Forbidden fruit");
            UI_add_answer("Human subject");
        }
        else if (response == "Human subject")
        {
            say("A big grin comes across the mans face. @Indeed, human subjects. I have been stuck using rats and other cavern dwelling creatures for far too long.@");
            say("@I sense you feel uneasy... do not worry. I feel that there is much more left for you to do. It is not your time yet.@");
            UI_remove_answer("Human subject");
            UI_add_answer("Time");
        }
        else if (response == "Time")
        {
            say("What you think is a chuckle escapes the mans lips. @You have much to do yet.@");
            UI_remove_answer("Time");
        }
        else if (response == "Trinket")
        {
            say("@Wisdom's Eye is a mere trinket. A tool to control the masses. I know not if there is even a nameless entity which places its desired will within it.@");
			say("@Either way, I care not for no man, woman or child should be bound by anything but themself.@");
            UI_remove_answer("Trinket");
        }
    }
    }	
	UI_remove_npc_face(item);
}
}
