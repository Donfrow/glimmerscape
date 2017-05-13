/*
Zulith, owener of ruined home in Cotton Cove
*/

void ZulithSign()
{
    UI_push_answers();
    UI_add_answer("They are unfairly taxed");
    UI_add_answer("Sign or I will slay you");
    UI_add_answer("The town can charge them more taxes if they join");
    converse
    {
        if(response == "They are unfairly taxed")
        {
            say("@Good I say. If they are taxed and not represented that means more of their gold to help me. I will not sign your proposal.@");
            gflags[ZULITH_NO] = true;
            karma = karma + 15;
            badproposalsigs = badproposalsigs -1;
            HaveEnoughSigs();
			KarmaBadSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Sign or I will slay you")
        {
            say("@I doubt you could slay a moth after the injuries you sustained. Regardless, I do not take kindly to threats. I will not sign.@");
            gflags[ZULITH_NO] = true;
            karma = karma - 15;
            badproposalsigs = badproposalsigs -1;
            HaveEnoughSigs();
			KarmaBadSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "The town can charge them more taxes if they join")
        {
            say("@You make a good point! If more gold is coming into the town then there is more gold to help me rebuild my home and business! Of course I will sign!@");
            gflags[ZULITH_YES] = true;
            proposalsigs = proposalsigs + 1;
            HaveEnoughSigs();
			KarmaGoodSprites();
            karma = karma + 15;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void BuyZulithWine()
{
    var amount = 800;
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if (response == "Yes")
        {
            if(hasGold(amount))
            {
                say("@You know a fine wine when you see it! Here is your bottle. Enjoy!@");
                chargeGold(amount);
                UI_add_party_items(1, ZULITH_WINE, ANY, ANY);
            }
            else
            {
                say("@You do not have enough coin! A pity... tis wonderful wine.@");

            }
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("@Very well. I doubt you could afford a wine of such fine taste anyway.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    

    }
}

void Zulith object#(0x43d) ()
	{

var bark = "What?";
var bark_intro = "Hail,";

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
				UI_item_say(item, "My poor home");
			else if (n == 2)
				UI_item_say(item, "How could this happen to me?");
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
        call Zulith, TALK;
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
		SignProposal();


if (UI_get_item_flag(item, MET)) 
	{
		say("@What is it you want with me?@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");
	}
else
	{

		say("@Can you not see that this is not the time for idle chatter?");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{
        if (response == "Bye")
        {
            say("@Leave me to my rubble.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Zulith. Zulith the man with the broken home!");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I make wine here in Cotton Cove. Well, that is to say I used to. The storm ruined much of my home and cellar.@");
            UI_remove_answer("Job");
            UI_add_answer("Storm");
            UI_add_answer("Cellar");
            UI_add_answer("Wine");
        }
        else if (response == "Storm")
        {
            say("@Are you not the one who was on the ship which crashed into the mountains? I thought you were. I figured you would know all about that terrible storm.@");
			say("@It came quickly and ended nearly as fast as it came, but not before doing terrible damage. It must have done some damage to your mind if you do not remember such an event.@");
            UI_remove_answer("Storm");
            UI_add_answer("Damage");
        }
        else if (response == "Damage")
        {
            say("@Many of the houses here wert damaged during the storm, unfortunatly mine was the worst hit of them all. My walls are crumbling and my wine making celler destroyed.@");
            UI_remove_answer("Damage");
        }
        else if (response == "Cellar")
        {
            say("@Tis where I had my wine making operation setup. The storm damaged it and now it is leaking and much of my equipment destroyed. I do not know how I will recover from this.@");
            UI_remove_answer("Cellar");
        }
        else if (response == "Sign proposal")
        {
            if (gflags[ZULITH_YES])
            {
                say("@You have already convinced me. I cannot sign twice.@");
            }
            else if (gflags[ZULITH_NO])
            {
                say("@I have already told you I will not sign such a thing. Go away.@");
            }
            else
            {
            say("@I do not care about anyones reasons for wanting to join the town. All I know is that I need as much assistance from the town as I can to rebuild my shattered life. Perhaps I can be swayed if you could give me a reason as to why I should sign such a thing.@");
            ZulithSign();
            }
            UI_remove_answer("Sign proposal");
        }
        else if (response == "Wine")
        {
            say("@I make such splendid wine, or I did until the storm. I do not know if I can recover as my wine is aged and it will be some time until I can begin production again.@");
            UI_remove_answer("Wine");
            UI_add_answer("Production");
        }
        else if (response == "Production")
        {
            say("@My cellar is destroyed and much of my stock destroyed. It will take some time to replenish the stock... though this could be a good thing. I shall be able to set the price extremely high! Yes, that will do!");
            UI_remove_answer("Production");
            UI_add_answer("Buy");
        }
        else if (response == "Buy")
        {

            say("@With my supply limited I have no choice but to increase the price of my wine. I can part with a bottle for, say, 800 gold. Dost you want a bottle?");
            BuyZulithWine();
            UI_remove_answer("Buy");
        }

		}
	UI_remove_npc_face(item);
	}
	   }

