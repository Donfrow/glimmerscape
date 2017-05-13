/*
Jefferson, guard in Cotton Cove
*/


void Jefferson object#(0x46f) ()
	{

var bark = "Please be brief";
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
				UI_item_say(item, "If I ever see that Bains...");
			else if (n == 2)
				UI_item_say(item, "I miss the days when my job was not needed");
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
        call Jefferson, TALK;
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
		
if (gflags[PAID_DEBT])
{

}
else
{
UI_add_answer("Pass");
}

if (gflags[GET_SIGS]) // get signatures to let the village join
{
    UI_add_answer("Sign proposal");
}


if (UI_get_item_flag(item, MET)) 
	{
		say("@Keeping out of trouble I see, good for you.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@You are that fellow whom Catherine healed. I am sorry but I have orders from the mayor to not let you leave until the pay 150 gold coins for Catherine's services.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{
        if (response == "Bye")
        {
            say("@Enjoy yourself.@");

            break;
        }
        else if (response == "Name")
        {
            say("@I am Jefferson. Jefferson the guard.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I was hired by the mayor of this town to guard the bridge to keep trouble makers out.@");
            UI_remove_answer("Job");
            UI_add_answer("Guard");
            UI_add_answer("Bridge");
        }
        else if (response == "Guard")
        {
            say("@I am not a native to this town. I was hired by the mayor after some fellow made off with much of the towns money without doing the job he was paid to do.@");
            UI_remove_answer("Guard");
            UI_add_answer("Man");
        }
        else if (response == "Man")
        {
            say("@Some fellow named Bains was paid to slay a harpy which took up residence in the cave.@");
			say("@It seems that the town paid him in advance and he took off without slaying the beast.@");
			say("@I would slay it myself but the meger pay they are now offering for the job is not worth the risk to myself.@");
            say("@However, if I do see that Bains fellow I am to apprehend him by any means necessary.@");
            UI_remove_answer("Man");
        }
        else if (response == "Bridge")
        {
            say("@The bridge goes from the main island of the town to the main continent of Desporia. There are several homes across the bridge but they are not actually part of the town itself.@");
            UI_remove_answer("Bridge");
        }
        else if (response == "Pass")
        {
            if (chargeGold(150))
            {
                say("@Very well. Your debt to the city is now repaid. You may come and go as you please.@");
                say("@If I may offer a suggestion, the look on your face seems to be that of a lost child. Perhaps you should head to Dewtopia to find something to do with your life. It is east of Cotton Cove.@");
                gflags[PAID_DEBT] = true;
            }
            else
            {
                say("@I am sorry but you do not have enough coin to pay the debt which you owe.@");
            }
            UI_remove_answer("Pass");
        }
        else if (response == "Sign proposal")
        {
            say("@I see that you leave the town then meet Leon and agree to do his dirty work. They should have charged you more to leave the city.@");
            say("@In any case, I will not let you pester the citizens with such things so I will not let this proposal enter the town. You may enter, but the proposal may not.@");
            say("@As an aside... I do not know why you asked me to sign it anyway, I am not even a citizen of this town!@");
            UI_remove_party_items(1, GOOD_SCROLL, 78, ANY);
            UI_remove_answer("Sign proposal");
        }

		}
	UI_remove_npc_face(item);
	}
    }

