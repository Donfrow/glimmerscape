/*
Catherine the healer of Cotton Cove
*/

void CatherineSign()
{
    UI_push_answers();
    UI_add_answer("They are taxed yet not represented");
    UI_add_answer("Because you are pretty");
    UI_add_answer("I will slay your husband");
    UI_add_answer("Just because");
    converse
    {
        if (response == "They are taxed yet not represented")
        {
            say("@That is quite a good reason. I did not know such a thing was happening. Of course I will sign.@");
            gflags[CATHERINE_YES] = true;
            karma = karma + 15;
            proposalsigs = proposalsigs + 1;
            HaveEnoughSigs();
			KarmaGoodSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Because you are pretty")
        {
            say("@While I thank you for the compliment it does not offer me any information as to why I should sign. Perhaps you could provide me with useful information?@");
            UI_remove_answer("Because you are pretty");
        }
        else if (response == "I will slay your husband")
        {
            say("@After I brought you back from the brink of death you dare to threaten my husband? I will never sign such a thing for you!@");
            gflags[CATHERINE_NO] = true;
            karma = karma - 15;
            badproposalsigs = badproposalsigs -1;
            HaveEnoughSigs();
			KarmaBadSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Just because")
        {
            say("@If that were a good reason I would be signing all sorts of things. Perhaps you could offer me some useful information?@");
            UI_remove_answer("Just because");
        }

    }
}

void Catherine object#(0x48d) ()
	{

var bark = "It is a pleasure to see you.";
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
				UI_item_say(item, "My poor Gerth");
			else if (n == 2)
				UI_item_say(item, "I do hope noone else was injured");
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
        call Catherine, TALK;
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

		UI_remove_answer("Name");
	}
else
	{
        say("@I am glad to see that you have managed to survive. I was worried about you pulling through.@");
        UI_add_answer("What happened?");
        UI_set_item_flag(item, MET, true);
	}
// End MET Flag



		converse
		{
        if (response == "Bye")
        {
            say("@Do be careful, wounds have a nasty habit of opening again.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I did not expect you to remember when I introduced myself originally; you were in quite the stupor. I am Catherine.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
			say("@I heal those who require such services here in the town of Cotton Cove. Fortunately only yourself and my husband Gerth are the only who have been in need of my services as of late.@");
            UI_remove_answer("Job");
            UI_add_answer("Healer");
            UI_add_answer("Cotton Cove");
            UI_add_answer("Gerth");
        }
        else if (response == "Healer")
        {
            say("@It was I who healed you after your ship was thrust into the rocks during the storm. Your wounds were grave but luckily you have managed to pull through.@");
            UI_remove_answer("Healer");
            UI_add_answer("Ship");
            UI_add_answer("Storm");
        }
        else if (response == "Cotton Cove")
        {
            say("@Cotton Cove is a small town within a cove of the mainland. It is quite a pleasant place to live.@");
            UI_remove_answer("Cotton Cove");
            UI_add_answer("Mainland");
        }
        else if (response == "Mainland")
        {
            say("@You must have taken quite the beating during the collision. Desporia has many islands but what everyone refers to as 'the mainland' is the land that spans across nearly the entire world.@");
            UI_remove_answer("Mainland");
            UI_add_answer("World");
        }
        else if (response == "World")
        {
            say("@The world is known as Desporia. I do hope your head has not been too injured.@");
            UI_remove_answer("World");
        }
        else if (response == "What happened?")
        {
            say("@There was a terrible storm and your ship was struck the mountains of the island. You were found gravely injured but alive and brought to me for healing.@");
            UI_remove_answer("What happened?");
            UI_add_answer("Ship");
            UI_add_answer("Storm");
        }
        else if (response == "Ship")
        {
            say("@I do not know why you were sailing while the Nautical Guild has a ban the activity as your cargo and any identifying information aboard your ship was lost in the storm.@");
			say("@Unfortunately you were the only survivor that we found.@");
            if(gflags[LECHUCK_DEAD])
            {
            }
            else
            {
                UI_add_answer("Nautical Guild");
            }
            UI_remove_answer("Ship");
        }
        else if (response == "Storm")
        {
            say("@It was a terrible storm indeed. Along with your ship several buildings here in Cotton Cove were damaged as well. I do hope that noone else was caught within it.@");
            UI_remove_answer("Storm");
        }
        else if (response == "Nautical Guild")
        {
            say("@The Nautical Guild is the organization that much of the merchant ships of Desporia belong to. Currently due to an increase in pirate activity they have refused to sail.@");
            UI_remove_answer("Nautical Guild");
        }
        else if (response == "Gerth")
        {
            say("@Gerth is my husband brother to Garth whom also lives here in Cotton Cove. He was recently injured when he fell off the roof of the mayor's house while in the process of repairing it.@");
            UI_remove_answer("Gerth");
        }
        else if (response == "Sign proposal")
        {
            if (gflags[CATHERINE_YES])
            {
                say("@You have already gotten me to sign the proposal.@");
            }
            else if (gflags[CATHERINE_NO])
            {
                say("@I already told you I will not sign something when you say such terrible things.@");
            }
            else
            {
            say("@Interesting idea. Do you have a compelling reason why I should put my vote into this?@");
            CatherineSign();
            }
            UI_remove_answer("Sign proposal");
        }


		}
	UI_remove_npc_face(item);
	}
 }

