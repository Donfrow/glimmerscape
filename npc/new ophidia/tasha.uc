//Tasha, wife in new ophidia

void Tasha object#(0x578) ()
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
				UI_item_say(item, "Learn about Ophidians!");
			else if (n == 2)
				UI_item_say(item, "Stay for the sermon");
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
        call Tasha, TALK;
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
		say("@Does your heart yet point you to the Ophidian way?@");
		UI_remove_answer("Name");
	}
else
	{

	say("@Welcome to New Ophidia.@");
	UI_set_item_flag(item, MET, true);

	}

converse
    {
        if(response == "Bye")
        {
            say("@Walk the path of the Ophidians.@");
            break;
        }
        else if (response == "Name")
        {
            say("The woman does a small cursty. @Tasha.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am wife of Urstan and co-owner of the Trapper's House.@");
            UI_remove_answer("Job");
            UI_add_answer("Urstan");
            UI_add_answer("Trapper's House");
        }
        else if (response == "Urstan")
        {
            say("@A fine man Urstan is. We met him when we were trappers up here several years ago. We immediately fell in love and not long ago founded the Trapper's House.@");
            UI_remove_answer("Urstan");
            UI_add_answer("Trappers");
        }
        else if (response == "Trappers")
        {
            say("@Trappers are men and women who fight mighty beasts for the hides so that fine clothes can be made from them. It is a difficult job but the rewards are great.@");
            UI_remove_answer("Trappers");
            UI_add_answer("Rewards");
        }
        else if (response == "Rewards")
        {
            say("@The payment from the job is so nice that by combining Urstan and I's income we were able to stop trapping and rent out the old slaughter house from Strehin so that we could begin our work.@");
            UI_remove_answer("Rewards");
            UI_add_answer("Stop trapping");
            UI_add_answer("Strehin");
        }
        else if (response == "Stop trapping")
        {
            say("@Urstan and I no longer trap creatures. We now devote our lifes to teaching the ways of the Ophidians.@");
            UI_remove_answer("Stop trapping");
            UI_add_answer("Ophidians");
        }
        else if (response == "Ophidians")
        {
            say("@You could learn much by attending one of Urstans nightly sermons. They begin at 6.@");
            UI_remove_answer("Ophidians");
        }
        else if (response == "Strehin")
        {
            say("@Strehin rented out the old slaughter house to Urstan and I. He runs New Ophidia for the time being.@");
            UI_remove_answer("Strehin");
            UI_add_answer("New Ophidia");
            UI_add_answer("Time being");
        }
        else if (response == "New Ophidia")
        {
            say("@New Ophidia is this settlement which is near the ruins of the Ophidian Empire.@");
            say("@Strehin says he founded it here due to geographical benefits but Urstan and I know that deep down the Ophidians were beckoning him to start their rebirth.@");
            UI_remove_answer("New Ophidia");
        }
        else if (response == "Time being")
        {
            say("@Do not get the wrong idea, we do not plan on usurping Strehin as leader but soon enough time will remove him from his current position.@");
            say("@It is when this happens that Urstan and I will rise together to grow this small settlement into a new Ophidian Empire.@");
            UI_remove_answer("Time being");
        }
        else if (response == "Trapper's House")
        {
            say("@The Trapper's House is a place where Urstan and I allow people to have a nice meal and a warm place to sleep. All we ask is that you attend the nightly sermons.@");
            UI_remove_answer("Trapper's House");
            UI_add_answer("Nightly sermons");
        }
        else if (response == "Nightly sermons")
        {
            say("@Urstan teaches about the virtues of the Ophidians every night at 6 o'clock.@");
            UI_remove_answer("Nightly sermons");
        }

    }

}
		
UI_remove_npc_face(item);	
}

