//Morrison - mayor of Cambray

void Morrison object#(0x568) ()
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
				UI_item_say(item, "Work work work");
			else if (n == 2)
				UI_item_say(item, "Indeed");
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
        call Morrison, TALK;
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
		say("@Always a pleasure to see thee.@");
		UI_remove_answer("Name");
	}
else
	{
	say("A serious looking man looks back at you. @Greetings stranger.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("@Do not forget to visit the monument while you are here.@");			
			break;
			}
		else if (response == "Name")
			{
			say("@You may call me Morrison.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@I am the mayor of Cambray.@");
            UI_remove_answer("Job");
            UI_add_answer("Mayor");
            UI_add_answer("Cambray");
        }
        else if (response == "Mayor")
        {
            say("The man stares at you intently. @As mayor of Cambray it is my duty to deal with issues such as taxes, town protection and any other political issue.@");
            UI_remove_answer("Mayor");
            UI_add_answer("Taxes");
            UI_add_answer("Protection");
            UI_add_answer("Political issues");
        }
        else if (response == "Taxes")
        {
            say("@In order for the local government to function money must be collected from citizens in the form of taxes. We do try to keep them low however.@");
            UI_remove_answer("Taxes");
        }
        else if (response == "Protection")
        {
            say("@Pirates are always a concern for the town but rarely do they venture into established settlements. I have hired two full time guards to keep order in the city.@");
            if(gflags[LECHUCK_DEAD])
            {
                say("@However with news that LeChuck has been slain and the pirates scattered I am not sure we even need two anymore.@");
            }
            else
            {
                say("@Despite pirates tendancy to stay on the sea I feel it is best that I have two full time guards to protect the city.@");
            }

            UI_remove_answer("Protection");
        }
        else if (response == "Political issues")
        {
            say("@Mostly minor squabbles and land disputes between citizens. It is usually nothing serious. The only real political issue of interest is whether or not to allow the tomb of the Death Knight Arthis to be open to the public.@");
            UI_remove_answer("Political issues");
            UI_add_answer("Tomb");
            UI_add_answer("Death Knight Arthis");
            UI_add_answer("Open to the public");
        }
        else if (response == "Tomb")
        {
            say("@It is best that you speak to my wife Olivia about that. She acts as the town historian.@");
            UI_remove_answer("Tomb");
            UI_add_answer("Olivia");
        }
        else if (response == "Olivia")
        {
            say("@During the day hours you can usually find her at the great monument to the south west part of town.@");
            UI_remove_answer("Olivia");
            UI_add_answer("Great monument");
        }
        else if (response == "Great monument")
        {
            say("@It is homage to Lady Elena over her triumph of the Death Knight Arthis on this very island. You can find out more from my wife about this.@");
            UI_remove_answer("Great monument");
        }
        else if (response == "Death Knight Arthis")
        {
            say("@Arthis was a terrible man who spread fear across the lands until he was slain by Lady Elena. You can find out more about this from my wife.@");
            UI_remove_answer("Death Knight Arthis");
        }
        else if (response == "Open to the public")
        {
            say("@As it stands only those with my permission are allowed to use the key to enter the tomb however there are some who believe that it should be open to all to increase tourism.@");
            say("He stares at you for a moment. @Personally I think we get enough visitors to Lady Elena's monument and do not think the town needs the kind of tourists that opening that tomb would attract.@");
            UI_remove_answer("Open to the public");
            UI_add_answer("Key");
        }
        else if (response == "Key")
        {
            say("@I keep the key for safe keeping. Someone would surely be sick to try and circumvent the process to gain entry.@");
            UI_remove_answer("Key");
        }
        else if (response == "Cambray")
        {
            say("@Cambray is an island with several small mountain ranges. It is also the island where the Death Knight Arthis was slain many generations ago.@");
            UI_remove_answer("Cambray");
            UI_add_answer("Death Knight Arthis");
        }

        } // end converse bracket

}		
	UI_remove_npc_face(item);	
	}

