/*
LeChuck the pirate in old monk isle
*/


void LeChuck object#(0x4d1) ()
	{

var bark = "What is this?!";
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
				UI_item_say(item, "The seas will be mine");
			else if (n == 2)
				UI_item_say(item, "Soon I shall be master of the seas");
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
        call LeChuck, TALK;
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

if (UI_get_item_flag(item, MET)) 
	{
		say("@You are foolish to have trespassed here.@");
		UI_remove_answer("Name");

	}
else
	{

		say("@You are not one of us! How have you gotten in here?!@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{
        if (response == "Bye")
        {
            say("@I shall now slay you like I have slain many others. Slow and painfully.@");
            UI_set_schedule_type(-209, IN_COMBAT);
			UI_set_opponent(-209, PARTY);
			UI_set_alignment(-209, HOSTILE);
            break;
        }
        else if (response == "Name")
        {
            say("@Buhaha. I am Captain LeChuck.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@One such as you dare asks my job? It is to rob and pillage and drink and sail! It is the pirates life for me.@");
            UI_remove_answer("Job");
            UI_add_answer("Pirate");
        }
        else if (response == "Pirate")
        {
            say("@I am the meanest and most feared pirates throughout these lands. It is I who has bandedtogether a band of scruffy unorganized fools into the massive pirate empire that you see today.@");
            UI_remove_answer("Pirate");
            UI_add_answer("Banded together");
        }
        else if (response == "Banded together")
        {
            say("@Before I brought them together the Nautical Guild was able to keep track and sail the sea without fear of pirates, but now they do not even sail the seas out of fear and soon even that useless organization will collapse.@");
            UI_remove_answer("Banded together");
            UI_add_answer("Nautical Guild");
        }
        else if (response == "Nautical Guild")
        {
            say("@Foolish and unskilled people who dare call themselves sailors. They could not last even the most calmest of storms. Soon they shall be no more!@");
            UI_remove_answer("Nautical Guild");
            UI_add_answer("You seem to be filled with a lot of hate");
        }
        else if (response == "You seem to be filled with a lot of hate")
        {
            say("@It is not hate but contempt for such an incompetant and useless organization. But enough talk. It is time for you to die.@");
            UI_remove_answer("You seem to be filled with a lot of hate");
            UI_set_schedule_type(-209, IN_COMBAT);
			UI_set_opponent(-209, PARTY);
			UI_set_alignment(-209, HOSTILE);
            break;
        }
        


        
		}
	UI_remove_npc_face(item);
	}
}
