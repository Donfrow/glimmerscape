/*
Gerth, wounded husband of Catherine in Cotton Cove
*/

void GerthSign()
{
    UI_push_answers();
    UI_add_answer("The village is not represented!");
    UI_add_answer("Sign it ya roof falling bag of filth!");
    UI_add_answer("I will cause you great pain if you do not sign");
    converse
    {
        if (response == "The village is not represented!")
        {
            say("@I am rather whoozy right now but I think I see your point... I will sign.@");
            gflags[GERTH_YES] = true;
            proposalsigs = proposalsigs + 1;
            karma = karma + 15;
            HaveEnoughSigs();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Sign it ya roof falling bag of filth!")
        {
            say("@I may be injured and half concious but I can tell I do not with to deal with such tactics. I will not sign.@");
            gflags[GERTH_NO] = true;
            karma = karma - 15;
            badproposalsigs = badproposalsigs -1;
            HaveEnoughSigs();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "I will cause you great pain if you do not sign")
        {
            say("@Well it is a good thing I am married to the town healer or such tactics may almost have worked... except that you are a small weakling. Go away I will not sign.@");
            gflags[GERTH_NO] = true;
            karma = karma - 15;
            badproposalsigs = badproposalsigs -1;
            HaveEnoughSigs();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}


void Gerth object#(0x474) ()
	{

var bark = "Oh the pain.";
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
				UI_item_say(item, "Ungh");
			else if (n == 2)
				UI_item_say(item, "Ouch...@");
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
        call Gerth, TALK;
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
		say("@Ugh, why do you continue to pester me?@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Oh my aching head. Why did you wake me?@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{
        if (response == "Bye")
        {
            say("@Thank you.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Did you truely wake me up to ask this? But I am awake now... I am Gerth. Any other questions of such importance that you felt it necessary to wake me?@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@Clearly a question of great importance. I have various jobs, but right now it is to recover from my fall. Please, leave me be.@");
            break;

        }
        else if (response == "Sign proposal")
        {
            if (gflags[GERTH_YES])
            {
                say("@I have signed... I am in and out of conciousness yet even I recall that. Perhaps you should see a witch doctor.@");
            }
            else if (gflags[GERTH_NO])
            {
                say("@Leave me be, I have made it clear I will not sign.@");
            }
            else
            {
            say("@Waking me up for what now?@");
            GerthSign();
            }
            UI_remove_answer("Sign proposal");
            
        }

		}
		wounded_man_move();
	UI_remove_npc_face(item);
	}
 }

