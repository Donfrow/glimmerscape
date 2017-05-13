//Sophia, dock master of new ophidia

void Sophia object#(0x579) ()
	{
	
var bark = "Arrr";
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
				UI_item_say(item, "Icy waters");
			else if (n == 2)
				UI_item_say(item, "Brrrr");
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
        call Sophia, TALK;
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
		say("@I am glad to see the chills have not gotten to you yet.@");
		UI_remove_answer("Name");
	}
else
	{

	say("@You are not one of the regular sailors. Nice to meet you.@");
	UI_set_item_flag(item, MET, true);

	}

converse
    {
        if(response == "Bye")
        {
            say("@Be careful in the icy waters.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I go by Sophia.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the harbor master here in New Ophidia, if you can call it a harbor.@");
            UI_remove_answer("Job");
            UI_add_answer("Harbor master");
            UI_add_answer("Harbor");
            UI_add_answer("New Ophidia");
        }
        else if (response == "Harbor master")
        {
            say("@Indeed, the harbor master. I take care of ensuring that the ships are loaded and sent off on time.@");
            UI_remove_answer("Harbor master");
        }
        else if (response == "Harbor")
        {
            say("@It is more of a small dock on the edge of the ice. It is quite small, but then again only merchant vessels tend to visit.@");
            say("@Though even that has been slow due to pirates.@");
            UI_remove_answer("Harbor");
            UI_add_answer("Merchant vessel");
            UI_add_answer("Pirates");
        }
        else if (response == "Merchant vessel")
        {
            say("@If you look around you can tell that this area is not the biggest tourist attraction. Wild beasts and cold weather tend to put a hamper on that sort of thing.@");
            UI_remove_answer("Merchant vessel");
        }
        else if (response == "Pirates")
        {
            if(gflags[LECHUCK_DEAD])
            {
                say("@Word has spread, even up to this cold climate, that the pirate LeChuck has been slain. Hopefully this will increase the ships that make it into port.@");
            }
            else
            {
                say("@Piracy has been on the rise in the warmer climates, though we normally do not see any pirates up in these frigid waters.@");
                say("@Unfortunately our merchant vessels must travel to these warmer areas to unload their cargo. It is here that the pirates strike us.@");
            }
            UI_remove_answer("Pirates");
        }
        else if (response == "New Ophidia")
        {
            say("@This area is technically still a trapper settlement with no official name, everyone simple calls it New Ophidia due to its proximity to the Ophidian ruins.@");
            UI_remove_answer("New Ophidia");
        }


    }

}
		
UI_remove_npc_face(item);	
}

