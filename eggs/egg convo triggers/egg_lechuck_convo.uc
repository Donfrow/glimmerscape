void LeChuckConvo()
{

UI_show_npc_face(619, 0);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

say("A rather burly looking man looks at you. @I have no idea how you got in here but it shall be the last place you go...@");
		
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
            say("@I am the meanest and most feared pirate throughout these lands. It is I who has banded together a band of scruffy unorganized fools into the massive pirate empire that you see today.@");
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
            say("@Foolish and unskilled people who dare call themselves sailers. They could not last even the most calmest of storms. Soon they shall be no more!@");
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
}