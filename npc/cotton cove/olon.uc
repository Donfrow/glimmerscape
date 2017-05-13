/*
Olon husband of the mayor of Cotton Cove
*/

void OlonSign()
{
    UI_push_answers();
    UI_add_answer("They are unfairly taxed");
    UI_add_answer("Sign or die");
    UI_add_answer("It is unfair!");
    UI_add_answer("Sign, pretty please");
    converse
    {
        if (response == "They are unfairly taxed")
        {
            say("@You make a compelling arguement that they should become part of the town... but I know my wife would be most displeased if I signed.@");
            say("@But I suppose it is for the best that I do. I must do the right thing, even if mine wife will be displeased with me.@");
            gflags[OLON_YES] = true;
            karma = karma + 15;
            proposalsigs = proposalsigs + 1;
            HaveEnoughSigs();
			KarmaGoodSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Sign or die")
        {
            say("@I do not take your threats lightly. I will not sign as your methods of intimidation are not worthy of politics.@");
            gflags[OLON_NO] = true;
            karma = karma - 15;
            badproposalsigs = badproposalsigs -1;
            HaveEnoughSigs();
			KarmaBadSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "It is unfair!")
        {
            say("@I must admit... I believe it to be unfair... but my wife would be so displeased with me if she saw my signature on the proposal... but I must do the right thing. I will sign.@");
            gflags[OLON_YES] = true;
            karma = karma + 15;
            proposalsigs = proposalsigs + 1;
            HaveEnoughSigs();
			KarmaGoodSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Sign, pretty please")
        {
            say("@I find it very sad that a man who can survive such a storm is reduced to begging like a child. If you can come up with a convincing argument I will consider it@");
			say("@Your argument must be good and sound as my wife would be most displeased if she saw my signature on such a proposal.@");
            UI_remove_answer("Sign, pretty please");
        }
    }
}


void Olon object#(0x43a) ()
	{

var bark = "How can I help you?";
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
				UI_item_say(item, "The cove is lovely today");
			else if (n == 2)
				UI_item_say(item, "It is a fine life");
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
        call Olon, TALK;
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
		say("@I do hope you are feeling better.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@It is good to see you up and about. I had feared you would not make it.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@I hope the world treats you better than it has been.@");
            break;
        }
        else if (response == "Name")
        {
            say("@You may call me Olon.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I run the house and mayor's office here in Cotton Cove.@");
            UI_remove_answer("Job");
            UI_add_answer("House");
            UI_add_answer("Mayor's office");
            UI_add_answer("Cotton Cove");
        }
        else if (response == "House")
        {
                            say("@It is a fine house if I may say so. It doubles as the home of my wife and I, as well as the mayors office.@");
            if(gflags[ROOF_IS_FIXED])
            {

                say("@May I also add that you have also done a wonderful job fixing the roof?");
            }
            else
            {
                say("@Unfortunately after the storm the roof was damaged. Gerth was to fix it but he was injured when he fell off the roof, leaving it incomplete.@");
                UI_add_answer("Gerth");
            }
            UI_remove_answer("House");
        }
        else if (response == "Gerth")
        {
            say("@Gerth is the twin brother of Garth and husband of Catherine, the town healer. It was she who fixed you up. I believe you have already met her.@");
            UI_remove_answer("Gerth");
            UI_add_answer("Catherine");
            UI_add_answer("Garth");
        }
        else if (response == "Catherine")
        {
            say("@She is a fine woman and able healer. She did stich you up, afterall.@");
            UI_remove_answer("Catherine");
        }
        else if (response == "Garth")
        {
            say("@He is the twin brother of Gerth, whom I was just speaking of. He and his wife run a small vegetable and fruit stand here on the island.@");
            UI_remove_answer("Garth");
        }
        else if (response == "Mayor's office")
        {
            say("@It is where my wife Delphynia takes care of the daily business here in Cotton Cove. I try to stay out of her way when she is busy.@");
            UI_remove_answer("Mayor's office");
        }
        else if (response == "Cotton Cove")
        {
            say("@It is the city that is nearby where your vessel struck the mountain. You are lucky the storm brought you here instead of somewhere in the middle of nowhere.@");
            UI_remove_answer("Cotton Cove");
        }
        else if (response == "Sign proposal")
        {
            if(gflags[OLON_YES])
            {
                say("@I believe I have already signed it.@");
            }
            else if (gflags[OLON_NO])
            {
                say("@I will not sign it after what you have said.@");
            }
            else
            {
                say("@Why should I consider such a proposal?@");
                OlonSign();
            }
            UI_remove_answer("Sign proposal");
        }

		}
	UI_remove_npc_face(item);
}	
	}

