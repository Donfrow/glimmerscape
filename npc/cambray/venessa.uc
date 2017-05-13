//Vanessa guard 1 in Cambray

void Venessa object#(0x56f) ()
	{
	
var bark = "Hello";
var bark_intro = "Hail";
	
	if (event == 0)
		{
		if(gflags[HYDRA_HYSTERIA])
		{
		}
		else
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
				UI_item_say(item, "Keep out of trouble");
			else if (n == 2)
				UI_item_say(item, "Do not cause trouble");
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
        call Venessa, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");


UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Good to see you are still keeping out of trouble.@");
		UI_remove_answer("Name");

	}
else
	{
	say("The woman sizes you up. @Welcome to Cambray. Stay out of trouble.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("Venessa grunts.");			
			break;
			}
		else if (response == "Name")
			{
			say("@Venessa.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@I am one of the guards here in Cambray. If I find you causing trouble, do not think I will hesitate to slit your throat.@");
            UI_remove_answer("Job");
            UI_add_answer("Guards");
            UI_add_answer("Cambray");
        }
        else if (response == "Guards")
        {
            say("@Yes... I help to keep order in this town along with my husband Xander. We take seperate shifts so there is always one of us keeping an eye on things.@");

            UI_remove_answer("Guards");
            UI_add_answer("Xander");
        }
        else if (response == "Xander")
        {
            say("@I have no reason to speak of him to you.@");
            UI_remove_answer("Xander");
        }
        else if (response == "Cambray")
        {
            say("@It is the island that is the home of the monument to Lady Elena as well as her tomb.@");
            UI_remove_answer("Cambray");
            UI_add_answer("Lady Elena");
        }
        else if (response == "Lady Elena")
        {
            say("@What do I look like? A tour guide? Go bother Olivia about this sort of thing.@");
            UI_remove_answer("Lady Elena");
        }

        } // end converse bracket

}		
	UI_remove_npc_face(item);	
	}

