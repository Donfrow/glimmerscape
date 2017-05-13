//Urstan, leader of new ophidia cult

void Urstan object#(0x577) ()
	{
	
var bark = "Hello there";
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
				UI_item_say(item, "Stay for my sermon");
			else if (n == 2)
				UI_item_say(item, "Long live the Ophidians");
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
        call Urstan, TALK;
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
		say("@Have you heard the calling of the Ophidians yet?@");
		UI_remove_answer("Name");
	}
else
	{

	say("@Have you learned about the Ophidians yet?@");
	UI_set_item_flag(item, MET, true);

	}

converse
    {
        if(response == "Bye")
        {
            say("@Live your life how the Ophidians would like you to.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Urstand at your service.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I run the Trapper's House here in New Ophidia.@");
            UI_remove_answer("Job");
            UI_add_answer("Trapper's House");
            UI_add_answer("New Ophidia");
        }
        else if (response == "Trapper's House")
        {
            say("Urstan smiles at you. @It is free room and board run by Tasha and myself for anyone who wishes to learn the ways of the Ophidians.@");
            UI_remove_answer("Trapper's House");
            UI_add_answer("Free room and board");
            UI_add_answer("Ophidians");
            UI_add_answer("Tasha");
        }
        else if (response == "Free room and board")
        {
            say("@All that Tasha and I ask of anyone staying here is to listen to the nightly sermons on how to live a better life by following the teachings of the Ophidians.@");
            UI_remove_answer("Free room and board");
        }
        else if (response == "Ophidians")
        {
            say("@Such a magestic and wonderful people the Ophidians were. It is a shame that their civilization came to such an unfortunate end.@");
            say("@Thankfully all of their knowledge was not lost, and now we can teach one another about their greatness, and let the empire rise again.@");
            UI_remove_answer("Ophidians");
        }
        else if (response == "Rise again")
        {
            say("@Their is so much wrong with the world, yet the world was at peace when the Ophidians Empire existed. It is our dream and duty to let this empire rise again.@");
            say("@If you wish to learn more I have nightly sermons at 6 o'clock.@");
            UI_remove_answer("Rise again");
        }
        else if (response == "New Ophidia")
        {
            say("@Is it not grand that the Ophidian Empire will soon rise again? They were such a proud and wise people. Soon the shattered remains of the empire shall be rebuild.@");
            UI_remove_answer("New Ophidia");
			UI_add_answer("Shattered remains");
        }
		else if (response == "Shattered remains")
		{
			say("@It brings a tear to my eye to see the ruins of the great empire laying in waste throughout the lands. Once enough people have seen the light I intend to begin with the great castle.@");
			UI_remove_answer("Shattered remains");
			UI_add_answer("Great castle");
		}
		else if (response == "Great castle")
		{
			say("@One of the greatest Ophidian buildings lies in ruins to the east. It is unfortunate that it lies in such a state but soon it will be restored to greatness.@");
			UI_remove_answer("Great castle");
		}
        else if (response == "Tasha")
        {
            say("@Tasha is my lovely wife who shares the dream for a new Ophidian Empire.@");
            UI_remove_answer("Tasha");
        }

    }

}
		
UI_remove_npc_face(item);	
}

