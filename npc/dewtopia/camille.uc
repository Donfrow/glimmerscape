/*
Camille - Cook in Castle Dew
*/

void Camille object#(0x4fe) ()
	{

var scroll = UI_count_objects(-357, 707, 50, -359);
var n = UI_get_random(2);

	if (event == 0)
		{
            if(gflags[CAMILLE_CAUGHT])
            {
                if (UI_get_schedule_type(item) == SLEEP)
                {
                    UI_item_say(item, "Zzzz...");
                    return;
                }

                if (n == 1)
                {
                    UI_item_say(item, "Blast those Dewtopians!");
                }
                else if (n == 2)
                {
                    UI_item_say(item, "Apox on Dewtopia!");
                    return;
                }
            }
            else
            {
                if (UI_get_schedule_type(item) == SLEEP)
                {
                    UI_item_say(item, "Zzzz...");
                    return;
                }

                if (n == 1)
                {
                    UI_item_say(item, "Work work work");
                }
                else if (n == 2)
                {
                    UI_item_say(item, "Work is never done");
                    return;
                }
            }
		}

	UI_show_npc_face(item);

if (event == DOUBLECLICK)
{

var bark_intro = "Hail";
var bark = "Hail";

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
        call Camille, TALK;
    }
    abort;
}

else if (event == TALK)
{


if (gflags[CAMILLE_CAUGHT])

{
        if (UI_get_item_flag(item, MET))
        {
            say("@What do you want scum?@");
        }
        else
        {
            say("@What is it you want knight of Dewtopia?@");
            UI_set_item_flag(item, MET, true);
        }

UI_add_answer("Name");
UI_add_answer("Job@");
UI_add_answer("Bye");
        
converse

    {

        if (response == "Bye")
        {
            say("@I spit upon you!@");
            break;
        }
        else if (response == "Name")
        {
            say("@Like you dost not know my name, it is thy fault I am here!@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am still a bandit and you will feel my wrath one day... do not think that because I am here that you will not have to constantly be looking over thy shoulder.@");
            say("@I possess many connections among those not stuck in this vile place who are more than eager to slay the one who foiled our plans.@");
            UI_add_answer("Connections");
            UI_remove_answer("Job");
        }
        else if (response == "Connections")
        {
            say("@I did not rise to where I am without making some connections and I have already spread the word about you. Do not expect to live much longer, for I surely do not expect you to.@");
            UI_remove_answer("Connections");
        }

    }

} // end bracker for if camille caught statement

else
{

    if (UI_get_item_flag(item, MET))
    {
        say("@Welcome back milord.@");
    }
    else
	{
        say("@Welcome to Castle Dew.@");
        UI_set_item_flag(item, MET, true);
	}

// IF statements for the Sanala quest line

if (gflags[CAMILLE_ACCUSED])
    {
        UI_add_answer("Sanala's story");
	}
if (gflags[DOG_BARK])
	{
        UI_add_answer("The dog barks at midnight");
	}
	
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
converse
{
	if (response == "Bye")
		{
            say("@Stay plump!@");
            break;
		}
	else if (response == "Name")
		{
            say("@I am Camille.@");
            UI_remove_answer("Name");
		}
	else if (response == "Job")
		{
            say("@I am the royal cook.@");
            UI_remove_answer("Job");
            UI_add_answer("Royal cook");
		}
	else if (response == "Royal cook")
		{
            say("@I prepare only the finest meals for all the members of Lord Dew's court here in the castle.@");
			say("@Although it can be rough at times having to constantly serve royal banquets it is much better than the life I had before Lord Dew took me in.@");
            UI_remove_answer("Royal cook");
            UI_add_answer("Before");
		}
	else if (response == "Before")
		{
            say("@Before Lord Dew took me in I was living outside the city walls in constant fear of goblin and bandits, wondering each day if I would survive to the next.@");
			say("@Luckily rumour had it that Lord Dew had needed a new Royal Cook after he had his old one sent to the Sugar Caves for treason.@");
            say("@Apparantly the old cook had actually been a bandit spy gathering information to rob the Royal Mint, but Brunt had discovered her secret. Because of her treachery I am here today.@");
            UI_remove_answer("Before");
            UI_add_answer("Goblins");
            UI_add_answer("Bandits");
		}
	else if (response == "Goblins")
		{
            if (gflags[GRUPLINORT_SLAIN])
			{
                say("@I have heard of your triumph over the goblin Gruplinort. I do hope that this lowers the amount of goblin ambushes but I fear such ruthless creatures will continue regardless.@");
                UI_remove_answer("Goblins");
			}
		else
			{
                say("@Foul and ruthless creatures the goblins are, they would slay every child if it meant one more piece of meat.@");
                say("@In fact I have heard rumours of a particularly cunning one which leads their attacks. If you are looking to help fight the goblin menance you should speak to Hectar.@");
                UI_remove_answer("Goblins");
			}
		}
	else if (response == "Bandits")
		{
            if (gflags[GETH_SLAIN])
			{
                say("@I have heard that someone infiltrated the Plains Bandits and put an end to their leader in a most gruesome fashion.@");
				say("@Whoever did this should fear for their life as the Plains Bandits will surely seek out revenge for this transgression.@");
                UI_remove_answer("Bandits");
			}
		else
			{
                say("@The Plains Bandits are a ruthless bunch. They attack you from behind when you least suspect it. They are cunning and devious, preferring the use of stealth over brute strength.");
				say("@But that is not to say they do not use brute strength for they when such tactics are needed.@");
                UI_remove_answer("Bandits");
			}
		}

	else if (response == "Sanala's story")
		{
            say("@The previous royal cook claims that I set her up? Only a fool would believe a word from the mouth of someone toiling in the Sugar Caves, and I do not believe that you are a fool.@");
            say("@Or are you?@");
            UI_remove_answer("Sanala's story");
		}
	else if (response == "The dog barks at midnight")
		{
            say("@It does bark at midnight... as well as mid-day.@");
            say("@It is about time someone was sent to pickup the information I have gathered. I want this operation to be over soon as I hate this terrible place.@");
            say("@I have no doubt you were delayed by Geth's untimely death. It is a shame but we shall hunt down the culprit and avenge him.@");
			say("@But enough of the idle chatter, you want the information no doubt.@");
            say("@I keep the information on a scroll I keep in a locked chest within the kitchen. Take this key and return the scroll to whomever is in charge now.@");
            say("@We must talk no more of this lest my cover be revealed.@");
            UI_remove_answer("The dog barks at midnight");
            UI_add_party_items(1, 641, 18, 13);
            gflags[DOG_BARK] = false;
            gflags[PROOF_OF_CAMILLE] = true;
		}
	}
}
	UI_remove_npc_face(item);
}
}







