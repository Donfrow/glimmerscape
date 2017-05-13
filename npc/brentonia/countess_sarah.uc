// Countess Sarah, the face that launched a thousand ships


void Countess_Sarah object#(0x448) ()
{

var love_letter = UI_count_objects(PARTY, GOOD_SCROLL, 92, ANY); // Love Letter from Lord Dew

var loc = UI_get_object_position(72);
sarahx = loc[1];
sarahy = loc[2];

var bark = "Yes?";
var bark_intro = "My Lady";

if (gflags[KILL_BRENDA_TRAVLEN_TALK])
{
}
else
{	
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
				UI_item_say(item, "All hail me");
			else if (n == 2)
				UI_item_say(item, "Flakey!");
			}
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
        call Countess_Sarah, TALK;
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
	
	if(love_letter > 0)
	{
        UI_add_answer("Letter from Lord Dew");
        
        if(gflags[GAVE_LOVE_LETTER])
        {
            UI_remove_answer("Letter from Lord Dew");
        }
    }
    
    if (UI_get_item_flag(item, MET))
	{
		say("@Hello again, it has not been long since I last saw you.@");
		UI_remove_answer("Name");
	}
    else
	{
    	say("@Greetings, stranger.@");
        UI_set_item_flag(item, MET, true);
	}
	
	converse
	{
        if(response == "Bye")
        {
            say("@I hope to see you again.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am Sarah, Countess of Rothes.@");
            UI_remove_answer("Name");
            UI_add_answer("Rothes");
        }
        else if (response == "Rothes")
        {
            say("@Twas a small village which no longer exists. It was destroyed by the tides some time ago. Since then I hath been here in Brentonia.@");
            UI_remove_answer("Rothes");
        }
        else if (response == "Job")
        {
            say("@I do something... or another");
            UI_remove_answer("Job");
        }
        else if (response == "Letter from Lord Dew")
        {
            say("@A letter from Lord Dew? Let me see it!");
            say("@Oh my, this would be bad if Lord Brent were to find out about this. You must speak of this to noone. If Lord Brent were to find out it could very well lead to war!@");
            UI_remove_party_items(1, GOOD_SCROLL, 92, ANY);
            UI_remove_answer("Letter from Lord Dew");
            gflags[GAVE_LOVE_LETTER] = true;
            /*
            if (sarahx >= 1879 && sarahx <= 1902 && sarahy <= 1038 && sarahy >= 993) // Throne room
            {
                UI_si_path_run_usecode(-63, [loc[1], loc[2], loc[3]], SCRIPTED, AVATAR, Dew_Letter_Found, 1); // 63 is the Lord Brent NPC Number
                // UI_set_path_failure(Poo_Test, 237, 237); -- THIS IS CURRENTLY WORKING AS IT SHOULD
            }
            else if (sarahx >= 1841 && sarahx <= 1869 && sarahy >= 993 && sarahy <= 1033) // Dining room
            {
                UI_si_path_run_usecode(-63, [loc[1], loc[2], loc[3]], SCRIPTED, AVATAR, Dew_Letter_Found, 1); // 63 is the Lord Brent NPC Number
            }
            */
            UI_si_path_run_usecode(-63, [loc[1], loc[2], loc[3]], SCRIPTED, AVATAR, Dew_Letter_Found, 1); // 63 is the Lord Brent NPC Number
            break;
        }
    }
    

}	

UI_remove_npc_face(item);

}
