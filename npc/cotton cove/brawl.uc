/*
Brawl, sheriff of Cotton Cove
*/

void FakeResolution()
{
    UI_push_answers();
    UI_add_answer("Mayors garbage");
    UI_add_answer("Mayors house");
    UI_add_answer("Mayors underwear drawer");
    
    converse
    {
        if (response == "Mayors garbage")
        {
            say("@I would think the mayor would be smart enough to destroy such a document instead of merely tossing it in the garbage. However, it is plausible and the scroll appears to be genuine.@");
            say("@As much as I do not believe you, I have no option but to bring this to the mayor and have it enforced. However, you should note it is my judgment that determines punishments for crimes...@");
            say("@As I believe this find to be incredibly suspicious but have no proof of any wrongdoing on your part I shall merely enforce the resolution. Delphynia will face no repercussions.@");
			say("@Do not speak to me about this again.@");
            gflags[FAKE_RESOLUTION_PASSED] = true;
            UI_remove_party_items(1, GOOD_SCROLL, 80, 5);
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Mayors house")
        {
            say("@And what were you doing in the mayors house? Do not tell me hogwash.@");
            UI_remove_answer("Mayors house");
        }
        else if (response == "Mayors underwear drawer")
        {
            say("@How dare you say such a thing!@");
            UI_remove_answer("Mayors underwear drawer");
        }
    }
}

void BrawlSign()
{
    UI_push_answers();
    UI_add_answer("I will break your legs if not");
    UI_add_answer("They are unfairly taxed");
    UI_add_answer("You can protect more people");
    UI_add_answer("More taxes means a better wage for you");
    
    converse
    {
        if (response == "I will break your legs if not")
        {
            say("@My, aren't you quite the big man. I laugh at your feeble attempts to intimidate me. But as you have tried to intimidate me, I will not sign your proposal.@");
            gflags[BRAWL_NO] = true;
            proposalsigs = proposalsigs - 1;
            karma = karma - 15;
            HaveEnoughSigs();
			KarmaBadSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "They are unfairly taxed")
        {
            say("@If I were them I would simply not pay taxes for something I do not receive. Tis not a difficult concept. You will have to do better than that.@");
            UI_remove_answer("They are unfairly taxed");
        }
        else if (response == "You can protect more people")
        {
            say("@Ha, why would I want more work to do? In fact, your have succeeded in the opposite of your goal. Now I will never sign your proposal!@");
            gflags[BRAWL_NO] = true;
            proposalsigs = proposalsigs - 1;
            karma = karma + 15;
            HaveEnoughSigs();
			KarmaGoodSprites();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "More taxes means a better wage for you")
        {
            say("@You are speaking my tongue! With them officially part of the town the more money from taxes will be entering the towns coffers, and I can get paid a better wage. I shall sign.@");
            gflags[BRAWL_YES] = true;
            proposalsigs = proposalsigs + 1;
            //karma = karma - 15; // Not adding karma here as it makes no sense either way
            HaveEnoughSigs();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}


void Brawl object#(0x473) ()
	{
	
var bark = "Keep out of trouble.";
var bark_intro = "Hail,";

var fake_scroll = UI_count_objects(PARTY, GOOD_SCROLL, 80, 5);
 
	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
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
        call Brawl, TALK;
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
		say("@Keeping out of trouble I see.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Ah, it is you, the survivor from the boat which was destroyed in the storm.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if (fake_scroll >0)
{
    UI_add_answer("Hidden resolution");
}


		converse
		{
        if (response == "Bye")
        {
            say("@Do not cause any trouble.@");
            break;
        }
        else if (response == "Name")
        {
            say("@My name is Brawl, but though may refer to me as @The Sheriff.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the law here in Cotton Cove. Do not cause trouble and we shall get along fine.@");
            UI_remove_answer("Job");
            UI_add_answer("Cotton Cove");
            UI_add_answer("The law");
        }
        else if (response == "Cotton Cove")
        {
            say("@It is a small and peaceful town, and I stress the peaceful. We rather enjoy not having trouble in this town, it keeps my job easy and the expenses down. So do not cause any trouble.@");
            UI_remove_answer("Cotton Cove");
        }
        else if (response == "The law")
        {
            say("@I am not a guard, but you might as well call me one. I enforce the rules here in Cotton Cove. If you break them, you will have to deal with me. We do not have a jail, so if I have to deal with you, I may have to toss you into the caves...@");
            UI_remove_answer("The law");
            UI_add_answer("Caves");
        }
        else if (response == "Caves")
        {
            if (gflags[COVE_HARPY_DEAD])
            {
                say("@Now that the harpy that took up residence there is no longer alive, it is much safer. But that does not mean that you want to get placed in the cave. It is a rather uncomfortable place to spend your time.@");
            }
            else
            {
            say("@The caves are dank, dark, and all around unhospitable. And to top it off a harpy have taken up residence in the cave. So if you get tossed in there, you are at the harpy's mercy.@");
            UI_add_answer("Harpy");
            }
            UI_remove_answer("Caves");
        }
        else if (response == "Harpy")
        {
            say("@A winged witch is what I would call it. Regardless, they are not picky on what sort of meats they eat... human included.@");
            UI_remove_answer("Harpy");
        }
        else if (response == "Sign proposal")
        {
            if(gflags[BRAWL_YES])
            {
				say("@I am surprised that you have the memory not to cross the law yet you have already forgotten that I have signed this proposal.@");
            }
            else if (gflags[BRAWL_NO])
            {
                say("@I thought I made it perfectly clear I will not support you in this.@");
            }
            else
            {
                say("@And why would I want to put my name to such a thing?");
                BrawlSign();
            }
            UI_remove_answer("Sign proposal");
        }
        else if (response == "Hidden resolution")
        {
            say("@You claim to have found a resolution passed by the old mayor? I admit, I find the timing of this 'discovery' and the failure of the proposal you were touting to be suspicious... Where did you find this?@");
            FakeResolution();
            
            UI_remove_answer("Hidden resolution");
        }

		}
	UI_remove_npc_face(item);
	}
	   }

