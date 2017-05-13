/*
Delphynia the mayor of Cotton Cove
*/


void Delphynia object#(0x430) ()
	{
	
var bark = "Hail to you as well.";
var bark_intro = "Hail";

var harpy_dead = UI_is_dead(-101);

var roof_fixed = UI_find_nearby([0962, 1745, 5], 223, 15, MASK_NONE); // determine if the roof is fixed

var roofspot1 = UI_get_item_shape(roof_fixed[1]);
var roofspot2 = UI_get_item_shape(roof_fixed[2]);
var roofspot3 = UI_get_item_shape(roof_fixed[3]);

if(roofspot1 == 0 && roofspot2 == 0 && roofspot3 == 0)
{
gflags[ROOF_IS_FIXED] = true;
}

if(gflags[ROOF_IS_FIXED])
{
    UI_add_answer("Roof is fixed");
}

 
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
				UI_item_say(item, "Sometimes I wonder why I bother");
			else if (n == 2)
				UI_item_say(item, "I should never have ran in the election");
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
        call Delphynia, TALK;
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
		UI_add_answer("Work");
		SignProposal();
		if (gflags[ENOUGH_SIGS] && UI_count_objects(PARTY, 797, 78, ANY)) // Have enough sigs and have the paper on you
		{
            UI_add_answer("Signed proposal");
            UI_remove_answer("Sign proposal");
            if(gflags[TOLD_LEON])
            {
                UI_remove_answer("Signed proposal");
            }
        }


if (UI_get_item_flag(item, MET)) 
	{
		say("@I hope you are feeling better and ready for work.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@It is good to see you moving around. I hope you are ready for work.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


if (harpy_dead) // Checks to see if the cove harpy has been slain, and if so, have you claimed the reward?
{
    UI_add_answer("Harpy is slain");
        if(gflags[COVE_HARPY_DEAD])
        {
            UI_remove_answer("Harpy is slain");
        }

}

if(gflags[FAKE_RESOLUTION_PASSED])
{
    UI_add_answer("Resolution");
}

		converse
		{
        if (response == "Bye")
        {
            say("@I hope you do not find yourself in more trouble.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am Delphynia.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the mayor here in Cotton Cove.@");
            UI_remove_answer("Job");
            UI_add_answer("Mayor");
            UI_add_answer("Cotton Cove");
        }
        else if (response == "Mayor")
        {
            say("@I tend to the finances and day to day operations of the town, typical mayoral duties.@");

            UI_remove_answer("Mayor");
        }
        else if (response == "Cotton Cove")
        {
            say("@It is the town in which you are in right now. Nice and humble if I may so, but the finances are stretching a bit then.@");
            UI_remove_answer("Cotton Cove");
            UI_add_answer("Finances");
        }
        else if (response == "Finances")
        {
            if(gflags[LECHUCK_DEAD]) // Means the Nautical guild is sailing again
            {
                say("@The city has run into much trouble financially lately. The cave on the island recently became infested with a harpy.@");
				say("@We paid a self professed harpy slayer to clean it out but he skipped out of town with the money leaving us with much less gold and leaving the harpy.@");
				say("@If you ever run across a Bains feel free to punch him in the face for me.@");
                say("@The Nautical Guilds refusal to sail did not help either. Usually chartered boats of tourists would stop by the island but that was not the case with the ban on sailing. Hopefully it will once again pickup now that they are sailing again but even if that is the case it will be a slow process.@");
            }
            else
            {
				say("@The city has run into much trouble financially lately. The cave on the island recently became infested with a harpy.@");
				say("@We paid a self professed harpy slayer to clean it out but he skipped out of town with the money leaving us with much less gold and leaving the harpy.@");
				say("@If you ever run across a Bains feel free to punch him in the face for me.@");
                say("@The Nautical Guilds refusal to sail does not help the matter either as it has hurt the tourism to our fine town.@");
				say("@Normally sightseeing boats visit the town on a fairly regular basis but without many ships sailing that simply is not the case anymore.@");
            }
            UI_remove_answer("Finances");
            UI_add_answer("Harpy");
        }
        else if (response == "Harpy")
        {
            if(gflags[COVE_HARPY_DEAD])
            {
                say("@I am surprised that you have managed to slay the harpy's within the cave, especially so soon after your accident.@");
            }
            else
            {
                say("@I do not know where they came from but they have the townspeople on edge. I had originally commissioned a warrior to exterminate them but he simply ran off with the money.@");
				say("@It is this reason that I have posted a guard on the bridge to the town.@");
                say("@Although I do not recommend it, if you so desire I am willing to pay you 75 gold coins if you were to rid the cave of the foul creatures.@");
            }
            UI_remove_answer("Harpy");
        }
        else if (response == "Work")
        {
            say("@Normally I would not expect you to pay for the services provided by Catherine in your circumstances.@");
			say("@That said, there is a shortage of finances and everyone in town needs to be paid for their goods or services as of late.@");
            say("@I paid Catherine 150 gold coins mending you but I also paid for it out of the town coffer. I must put the gold back into the town coffers before I will allow you to leave the city.@");
			say("@There is various work around the town you can do to earn the required 150 gold coins.@");
            UI_remove_answer("Work");
            UI_add_answer("Finances");
            UI_add_answer("Catherine");
            UI_add_answer("Various work");
        }
        else if (response == "Catherine")
        {
            say("@She is a skilled and caring woman. If it were not for the hard times I am sure she would have healed you for free, but alas, that is not the case.@");
            UI_remove_answer("Catherine");
        }
        else if (response == "Various work")
        {
            if(gflags[ROOF_IS_FIXED])
            {
                say("@As I have mentioned you have done a wonderful job on the roof.@");
            }
            else
            {
            say("@After Gerth fell off the roof of my home and office while repairing damage caused by the storm the roof repairs have not been stalled.@");
			say("@If you so desire I can pay you 30 gold if you would fix the roof. All the needed supplies can be found outside my house.@");
            }
            say("@Garth is always looking for people to assist him in picking his fruits and vegetables. It is not a job that will get you rich but it is good honest work.@");
            UI_remove_answer("Various work");
        }
        else if (response == "Harpy is slain")
        {
            say("@I cannot thank you enough, both on behalf of the town and personally. Everyone has been rather uneasy since it was occupying the cave. At least that is one of our worries dealt with.@");
            gflags[COVE_HARPY_DEAD] = true;
            UI_add_party_items(75, SHAPE_GOLD, ANY, ANY);
            UI_remove_answer("Harpy is slain");
        }
        else if (response == "Roof is fixed")
        {
			if(gflags[PAID_FOR_ROOF])
			{
				say("@Indeed it is and you have already been paid for your labours!@");
			}
            else
			{
				say("@You have done a wonderful job on the roof. Here is the gold as agreed upon for the task.@");
				UI_add_party_items(30, SHAPE_GOLD, ANY, ANY);
				UI_remove_answer("Roof is fixed");
				gflags[PAID_FOR_ROOF] = true;
			}
        }
        else if (response == "Sign proposal")
        {
            say("@I see Leon has gotten you to do his dirty work since I have not allowed him entrance into the town. You were foolish to ask me as well. Of course my answer is no.@");
            UI_remove_answer("Sign proposal");
        }
        else if (response == "Signed proposal")
        {
            say("@Well, it appears that you have managed to get enough signatures to have that little village become part of Cotton Cove.@");
            say("@Although I disagree with it, you have managed to sway the townspeople. I will let you break the 'good' news to Leon.@");
            UI_remove_party_items(1, GOOD_SCROLL, 78, ANY);
            gflags[PROPOSAL_PASSED] = true;
            UI_remove_answer("Signed proposal");
        }
        else if (response == "Resolution")
        {
            say("@I never hid such a resolution, and I believe that you and that rat Leon had something to do with this. Unfortunately I cannot prove a thing, but I will say that we should have left you for dead after that storm!@");
            break;
            UI_remove_answer("Resolution");
        }

		}
	UI_remove_npc_face(item);
}	
	}

