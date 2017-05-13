/*
Leon, in the small buildings just past cotton cove bridge
*/

void GetSigs()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if (response == "Yes")
        {
            say("@Wonderful! If you can get the majority of the town to sign this proposal and deliver it to the mayor I would be most appreciative.@");
            say("@And watch out for the guard... if he learns of this no doubt he will take the proposal@");
			say("@If fact I suspect even if it has signatures he would take it. I doubt the townspeople would be receptive to signing the same thing multiple times.@");
            gflags[GET_SIGS] = true;
            UI_add_party_items(1, GOOD_SCROLL, 78, 0);
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("@A pity. I thought you would be one willing to help.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}


void Leon object#(0x438) ()
	{
var bark = "How may I help you?";
var bark_intro = "Hail,";
var fake_scroll = UI_count_objects(PARTY, GOOD_SCROLL, 80, 5);

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
				UI_item_say(item, "Taxing without representation!");
			else if (n == 2)
				UI_item_say(item, "I should have been allowed to run in the election");
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
        call Leon, TALK;
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

if(gflags[PROPOSAL_PASSED])
{
    UI_add_answer("The proposal has passed");
}
if(gflags[FAKE_RESOLUTION_PASSED])
{
    UI_add_answer("The resolution is in force");
}
if (gflags[TOLD_LEON]) // removes this so you can't keep getting exp
{
    UI_remove_answer("The proposal has passed");
    UI_remove_answer("The resolution is in force");
}


if (UI_get_item_flag(item, MET)) 
	{
		say("@It is always a pleasure to see you again.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Hello there, a pleasure to meet you.@");
		UI_set_item_flag(item, MET, true);
	}
	
if(gflags[KILL_PLAINSRIDER_HECTAR] || gflags[KILL_PLAINSRIDER])
{
	if(UI_is_dead(-500))
	{
	}
	else
	{
		add(["The Plains Rider"]);
	}
}
	
// End MET Flag


		converse
		{
        if (response == "Bye")
        {
            say("@I hope that you visit again.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Leon, I am Leon at your service.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            if(gflags[TOLD_LEON])
            {
                say("@With your help I am now a citizen of Cotton Cove and can take part in their politics. I do believe I should start a campaign!@");
                UI_add_answer("Campaign");
            }
            else if (gflags[PROPOSAL_FAILED])
            {
                if(fake_scroll > 0)
                {
                    say("@Bring the resolution to the sheriff!");
                    break;
                }
                else
                {
                say("@I am sad to hear that you have been unable to get the votes needed to let us join the town. I suppose it was never meant to be.@");
                say("@Of course... there is always another way.@");
                }
                UI_add_answer("Another way");
            }
            else
            {
            say("@I am currently not employed after the gross inequity that occurred between our small village and Cotton Cove.@");
            UI_add_answer("Gross inequity");
            UI_add_answer("Small village");
            UI_add_answer("Cotton Cove");
            }
            UI_remove_answer("Job");
        }
        else if (response == "Gross inequity")
        {
            say("@There was recently an election in Cotton Cove and I was not allowed to run in the campaign because we are not officially part of the town of Cotton Cove.@");
            say("@Despite the fact that we take care of the bridge to the town they will not let us officially join the town or take part in their politics!@");
            UI_remove_answer("Gross inequity");
            UI_add_answer("Politics");
        }
        else if (response == "Small village")
        {
            say("@We do not have an official name, we are simply @the village by Cotton Cove@ to many. Although, in my opinion we are practically part of the town.@");
            UI_remove_answer("Small village");
        }
        else if (response == "Cotton Cove")
        {
            say("@Across the bridge leads to Cotton Cove. Though if you ask me this village should be part of Cotton Cove.@");
            UI_remove_answer("Cotton Cove");
        }
        else if (response == "Politics")
        {
            say("@We pay taxes to the city of Cotton Cove so that if something were to happen we are to be able to depend on them, but that is all the taxes are supposed to be used for.@");
            say("@However, nothing has happened and they use our taxes for their own projects and activities! They tax us and we are not even allowed the vote!@");
            UI_remove_answer("Politics");
            UI_add_answer("Vote");
        }
        else if (response == "Vote")
        {
            say("@If we could get the majority of the inhabitants to agree to my proposal there will be no choice for the mayor but to incorporate us into the town.@");
            say("@However, that guard the mayor has posted has also been instructed to not let me into the city claiming I pester its citizens too much. Would you help me get signatures?@");
            GetSigs();
            UI_remove_answer("Vote");
        }
        else if (response == "Campaign")
        {
            say("@I do not know what platform I should run on yet, but I am sure I can get my fellow villagers to vote for me.@");
            UI_remove_answer("Campaign");
        }
        else if (response == "The proposal has passed")
        {
            say("@Wonderful! I cannot thank you enough! You have done a great deal for our village. I cannot offer you anything for your help, but I am sure you has gained a great deal of experience from this.@");
            gflags[TOLD_LEON] = true;
            UI_set_npc_prop(AVATAR, EXPERIENCE, 150); // add 150 exp for completing quest
            karma = karma + 200; // 200 good karma for passing it the good way
            UI_remove_answer("The proposal has passed");
        }
        else if (response == "The resolution is in force")
        {
            say("@Wonderful! It is unfortunate the methods by which we had to become part of the town but in the end I feel it was worth it. I cannot offer much for all of your assistance but I hope you have gained some experience from this.@");
            gflags[TOLD_LEON] = true;
            UI_set_npc_prop(AVATAR, EXPERIENCE, 150); // add 150 exp for completing quest
            karma = karma -200; // 200 bad karma for passing it the evil way
            UI_remove_answer("The resolution is in force");
        }
        else if (response == "Another way")
        {
            say("@It could turn out that the previous mayor has already a passed resolution but Delphynia decided to keep it quiet to maintain power...@");
            UI_remove_answer("Another way");
            UI_add_answer("What of the old mayor?");
        }
        else if (response == "What of the old mayor?")
        {
            say("@The old mayor is no longer living so he cannot claim otherwise... If you were to take a forged resolution to Brawl, the sheriff of Cotton Cove, he will have no choice but to enforce it.@");
            UI_remove_answer("What of the old mayor?");
            UI_add_answer("I will do it");
        }
        else if (response == "I will do it")
        {
            say("@Thank you! I do not like acting in such underhanded ways but sometimes one must go to drastic measures for fairness. I the sheriff asks you where you found it, make something up. I am sure you can come up with a convincing tale.@");
            UI_remove_answer("I will do it");
            UI_add_party_items(1, GOOD_SCROLL, 80, 5);
        }
		else if (response == "The Plains Rider")
		{
			say("Leon looks enraged. @That man is scum! We pay him for protection and he then he keeps demanding more and more. He even threatened us if we refused to pay!@");
			say("@We would have none of that though... as soon as he threatened us we banded together and ran him off. He curtailed it south as fast as he could go and I have not seen him since.@");
			UI_remove_answer("The Plains Rider");
		}

		}
	UI_remove_npc_face(item);
	}
	   }

