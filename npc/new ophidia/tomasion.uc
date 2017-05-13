//Tomasion the hurt man in new ophidia

void Tomasion object#(0x57d) ()
	{
	
var bark = "Ugh";
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
				UI_item_say(item, "The pain...");
			else if (n == 2)
				UI_item_say(item, "My head...");
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
        call Tomasion, TALK;
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
		say("@Why do you continue to pester me?@");
		UI_remove_answer("Name");
	}
else
	{
        say("The man before you winces in pain. @Why do you pester me?@");
	UI_set_item_flag(item, MET, true);

	}

converse
    {
        if(response == "Bye")
        {
            say("Tomasion pays no attention to you as you leave.");
            break;
        }
        else if (response == "Name")
        {
            say("The man struggles to speak. @Tomasion.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("Even through all the bandages the man looks bewildered. @I am a trapper. Now please, I need my rest so I can heal.@");
            UI_remove_answer("Job");
            UI_add_answer("Trapper");
            UI_add_answer("Heal");
        }
        else if (response == "Trapper")
        {
            say("@Ask my brother Axell all your questions about these things. I need to rest.@");
            UI_remove_answer("Trapper");
        }
        else if (response == "Heal")
        {
            say("@I barely survived an encounter such terrible beasts the like you could never imagine.@");
            UI_remove_answer("Heal");
            UI_add_answer("Beasts");
        }
        else if (response == "Beasts")
        {
            say("Tomasion winces. @Talk to Axell about that... I need my rest.@");
            UI_remove_answer("Beasts");
        }


    }

}
		
UI_remove_npc_face(item);	
}

