/*
Larianna outside Cotton Cove
*/

void Larianna object#(0x46d) ()
	{

var bark = "Good day to you";
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
				UI_item_say(item, "The crop is coming nicely");
			else if (n == 2)
				UI_item_say(item, "Nice day");
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
        call Larianna, TALK;
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
		say("@I am glad to see that the bandits or goblins have not gotten you.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Hello there. I do not believe we have met.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if(gflags[KILL_PLAINSRIDER_HECTAR] || gflags[KILL_PLAINSRIDER])
{
	if(UI_is_dead(-500))
	{
	}
	else
	{
		add(["The Plains Rider"]);
	}
}

		converse
		{
        if (response == "Bye")
        {
            say("@I hope your journies are safe.@");
            break;
        }
        else if (response == "Name")
        {
            say("@You may call me Larianna.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am but a simple farmer here outside of Cotton Cove. I am also the wife of Ruggs and mother to little Bugsy.@");
            UI_remove_answer("Job");
            UI_add_answer("Cotton Cove");
            UI_add_answer("Ruggs");
            UI_add_answer("Bugsy");
        }
        else if (response == "Cotton Cove")
        {
            say("@Cotton Cove is just over the bridge. It is a rather well kept island though I believe several homes were damaged in the recent storm.@");
            UI_remove_answer("Cotton Cove");
            UI_add_answer("Storm");

        }
        else if (response == "Storm")
        {
            say("@It was terrible. I am glad noone on the island actually perished in it but I fear if there were any ships on the sea they would have perished.@");
            UI_remove_answer("Storm");
        }
        else if (response == "Bugsy")
        {
            say("@Bugsy is the child of Ruggs and I. He can be a handful but I do love him so.@");
            UI_remove_answer("Bugsy");
        }
        else if (response == "Ruggs")
        {
            say("@Ruggs is my husband. He is a hard working man who would do anything in the world for me.@");
            UI_remove_answer("Ruggs");
        }
		else if (response == "The Plains Rider")
		{
			say("@I have heard of him but I do not know much about him. You best speak to my husband Ruggs.@");
			UI_remove_answer("The Plains Rider");
		}



		}
	UI_remove_npc_face(item);
	}
}
