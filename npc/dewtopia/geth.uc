/*
Bandit Leader Geth NPC # 283
*/

void Slay_Brunt()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if (response == "Yes")
        {
            say("@Wonderful. Return to me when he no longer walks the mortal realm for your reward.@");
            gflags[KILL_BRUNT] = true;
            break;	
        }
        else if (response == "No")
        {
            say("@It is a shame you are unwilling to help us. And as you now know too much of our plan we cannot let you leave here. A shame...@");
            break;
            karma = karma + 100;
        }
    }
}

void Geth object#(0x51b) ()
	{

var bark_intro = "You there,";
var bark = "Who dare speak to me?";

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == SLEEP)
			{
			UI_item_say(item, "Zzzz...");
			
			return;
			}
		var n = UI_get_random(2);// 1-2.
		if (n == 1)
			UI_item_say(item, "Dewtopia is rich!");
		else if (n == 2)
			UI_item_say(item, "A cunning plan...");
		return;
		}

	UI_show_npc_face(item);
	
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
        call Geth, TALK;
    }
    abort;
}

else if (event == TALK)
{
	
if (UI_get_item_flag(item, MET))
	{
	say("@Ah, we meet again.@");
		if (UI_is_dead(BRUNT) == true)
		{
		UI_add_answer("Brunt is slain");
		}
	}
else
	{

	say("@Halt, who goes there?@");

	UI_set_item_flag(item, MET, true);
	
	UI_add_answer("Me");
	UI_add_answer("Myself");
	UI_add_answer("I");
	
	converse
        {
		if (response == "Me")
			{
			say("@I see...@");
            UI_clear_answers();
			}
		else if (response == "Myself")
			{
			say("@I can appreciate how one would like to remain... unknown.@");
            UI_clear_answers();
			}
		else if (response == "I")
			{
			say("@Very secretive... you are wise.@");
            UI_clear_answers();
			}
        }
}
	// End of opening IF


	
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

		converse
		{
	if (response == "Bye")
    {
        say("@Indeed...@");
        break;
    }

    else if (response == "Name")
    {
    	say("@If you must know I am Geth.@");
        UI_remove_answer("Name");
    }
    else if (response == "Job")
    {
        say("@I acquire things.@");
        UI_remove_answer("Job");
        UI_add_answer("Things");
    }
    else if (response == "Things")
    {
        say("@You were wise when we first met, so I shall indulge you. I lead the bandits of these plains... and you have stumbled into our encampment.@");
        UI_remove_answer("Things");
        UI_add_answer("Encampment");
    }
    else if (response == "Encampment")
    {
        say("@We have large plans underway... if you try to stop us then you shall see how quickly a dagger ends up in your back.@");
        say("@However... I have a proposition for you.@");
        UI_remove_answer("Encampment");
        UI_add_answer("Proposition");
    }
    else if (response == "Proposition")
    {
        say("@There is a strong armed fellow named Brunt who doth live in Dewtopia. His current occupation doth cause problems for our current plans. If you were to slay him it would aid our plans more generously.@");
        UI_remove_answer("Proposition");
    	UI_add_answer("Slay");
    }
    else if (response == "Slay")
    {
        say("@We prefer the use of stealth for our... how shall I put it... larger jobs. For this plan we have an operative within the castle in Dewtopia which provides us information about Brunt.@");
        say("@It would seem that Brunt guards the Royal Mint in Dewtopia every hour of every day making an attempt to rob the Royal Mint quite difficult as the use of stealth is impossible.@");
        say("@If he were to be slain this problem would be eliminated. Wouldst you care to make some fast coin doing this for us?@");
        say("@Will you slay him?@");
        gflags[OPERATIVE_IN_CASTLE] = true;
        UI_remove_answer("Slay");
        Slay_Brunt();
        
        if(gflags[KILL_BRUNT])
        {
            break;
        }
        else
        {
            UI_set_alignment(-283, HOSTILE);
            UI_set_schedule_type(-283, IN_COMBAT);
            UI_set_opponent(-283, AVATAR);
	
            UI_set_alignment(-288, 2);
            UI_set_alignment(-289, 2);
            UI_set_alignment(-290, 2);
            UI_set_alignment(-291, 2);
            UI_set_alignment(-286, 2);

            UI_set_opponent(-288, AVATAR);
            UI_set_opponent(-289, AVATAR);
            UI_set_opponent(-290, AVATAR);
            UI_set_opponent(-291, AVATAR);
            UI_set_opponent(-286, AVATAR);

            UI_set_schedule_type(-288, IN_COMBAT);
            UI_set_schedule_type(-289, IN_COMBAT);
            UI_set_schedule_type(-290, IN_COMBAT);
            UI_set_schedule_type(-291, IN_COMBAT);
            UI_set_schedule_type(-286, IN_COMBAT);
            
            break;
        }
    }

    else if (response == "Brunt is slain")
    {
        say("@Very good. You have been a useful tool. Now all that is left is to dispose of you.@");
        
        UI_set_alignment(-283, HOSTILE);
        UI_set_schedule_type(-283, IN_COMBAT);
        UI_set_opponent(-283, AVATAR);

        UI_set_alignment(-288, 2);
        UI_set_alignment(-289, 2);
        UI_set_alignment(-290, 2);
        UI_set_alignment(-291, 2);
        UI_set_alignment(-286, 2);

        UI_set_opponent(-288, AVATAR);
        UI_set_opponent(-289, AVATAR);
        UI_set_opponent(-290, AVATAR);
        UI_set_opponent(-291, AVATAR);
        UI_set_opponent(-286, AVATAR);

        UI_set_schedule_type(-288, IN_COMBAT);
        UI_set_schedule_type(-289, IN_COMBAT);
        UI_set_schedule_type(-290, IN_COMBAT);
    	UI_set_schedule_type(-291, IN_COMBAT);
        UI_set_schedule_type(-286, IN_COMBAT);
        
        break;
    }

}

}

	UI_remove_npc_face(item);
}
