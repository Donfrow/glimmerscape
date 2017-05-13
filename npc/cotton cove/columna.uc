/*
Columna in CC wife of Garth
*/

void ColumnaSign()
{
    UI_push_answers();
    UI_add_answer("I will slay Dewbert if you do not");
    UI_add_answer("Sign or I will cry");
    UI_add_answer("They are taxed yet not allowed to vote");
    converse
    {
        if (response == "I will slay Dewbert if you do not")
        {
            say("@You will do no such thing! I shall slay you before you ever lay a finger upon him. You hast lost my vote for your threats!");
            gflags[COLUMNA_NO] = true;
            karma = karma - 15;
            badproposalsigs = badproposalsigs -1;
            HaveEnoughSigs();
			KarmaBadSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Sign or I will cry")
        {
            say("@While I do not wish to see you in tears, I would like more information on it before making a decision.@");
            UI_remove_answer("Sign or I will cry");
        }
        else if (response == "They are taxed yet not allowed to vote")
        {
            say("@This is a very good reason for signing such a proposal. You have my vote.@");
            gflags[COLUMNA_YES] = true;
            karma = karma + 15;
            proposalsigs = proposalsigs + 1;
            HaveEnoughSigs();
			KarmaGoodSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        
    }
}

void Columna object#(0x40e) ()
	{

var bark = "Yes darling?";
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
				UI_item_say(item, "My husband is my life");
			else if (n == 2)
				UI_item_say(item, "Such a nice place to raise a child");
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
        call Columna, TALK;
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
		say("@Please, be brief. If I take my eyes of Dewbert for a moment he will get himself into all sorts of trouble.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@You are the fellow from the storm. I had heard about you. It is nice to see you are doing well.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{
        if (response == "Bye")
        {
            say("@Goodbye and do be safer in the future.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Columna, wife of Garth.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the wife of Garth as well as mother to Dewbert. Of course, I do all that here in Cotton Cove");
            UI_remove_answer("Job");
            UI_add_answer("Garth");
            UI_add_answer("Dewbert");
            UI_add_answer("Cotton Cove");
        }
        else if (response == "Garth")
        {
            say("@Garth is the twin brother of Gerth whom is married to Catherine. People often get the two confused but I am able to tell the difference.@");
            UI_remove_answer("Garth");
        }
        else if (response == "Dewbert")
        {
            if(gflags[TALKED_TO_COLUMNA])
            {
                say("@Begone, I care not speak to you about this. You hast ruined it all.@");
                break;
            }
            else
            {
            say("@Little Dewbert is my little toddler. He can be a handful sometimes but it is well worth the reward.@");
            }

            UI_remove_answer("Dewbert");
            UI_add_answer("Reward");
            if(gflags[READ_DEWBERT_SCROLL])
            {
                UI_add_answer("Liar!");
                UI_remove_answer("Reward");
            }
        }
        else if (response == "Reward")
        {
            say("@Well, you see Dewbert is... erm... you know what I mean. Raising a child is such a reward. Who would not want to raise such a little bundle of joy and energy? Hmm? Hmm?");
            UI_remove_answer("Reward");
        }
        else if (response == "Cotton Cove")
        {
            say("@It is not as nice as the bigger cities such as Dewtopia but it is decent enough... I suppose anyway.@");
            UI_remove_answer("Cotton Cove");
            UI_add_answer("Dewtopia");
        }
        else if (response == "Dewtopia")
        {
            say("@Dewtopia is a large city to the east of Cotton Cove. It is wonderful and run by quite rich Lord Dew.@");
            UI_remove_answer("Dewtopia");
        }
        else if (response == "Liar!")
        {
            say("@Who hast you been talking to?! I knew I shoulkd have asked for more gold. Now that the secret is out I cannot get anymore gold from that fool of a king. You hast ruined everything!");
            gflags[TALKED_TO_COLUMNA] = true;
            break;
        }
        else if (response == "Sign proposal")
        {
            if(gflags[COLUMNA_YES])
            {
                say("@If you look my signature is already on your proposal...@");
            }
            else if (gflags[COLUMNA_NO])
            {
                say("@I thought I had already made it clear I will not sign such a thing.@");
            }
            else
            {
            say("@Why should I sign such a proposal?@");
            ColumnaSign();
            }
            UI_remove_answer("Sign proposal");
        }

		}
	UI_remove_npc_face(item);
	}
	   }

