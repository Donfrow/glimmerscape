//Xander guard 2 in Cambray

void Xander object#(0x570) ()
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
        call Xander, TALK;
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
		say("@I am glad we have not yet run into problems.@");
		UI_remove_answer("Name");

	}
else
	{
	say("The man sizes you up. @Welcome to Cambray. Stay out of trouble.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("Xander shrugs.");			
			break;
			}
		else if (response == "Name")
			{
			say("@You can refer to me as Xander.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@I am one of the guards here in Cambray. If you are causing trouble you will have to deal with me or my wife.@");
            UI_remove_answer("Job");
            UI_add_answer("Guards");
            UI_add_answer("Wife");
            UI_add_answer("Cambray");
        }
        else if (response == "Guards")
        {
            say("@Are you daft? Guards guard things you fool.@");
            UI_remove_answer("Guards");
        }
        else if (response == "Wife")
        {
            say("@I am married to Venessa. That is all you need to know.@");
            UI_remove_answer("Wife");
        }
        else if (response == "Cambray")
        {
            say("@This island holds the monument and tomb to Lady Elena.@");
            UI_remove_answer("Cambray");
            UI_add_answer("Lady Elena");
        }
        else if (response == "Lady Elena")
        {
            say("@I am no tour guide but I know that Lady Elena defeated the Death Knight Arthis here. You should ask Olivia about all that.@");
            UI_remove_answer("Lady Elena");
        }

        } // end converse bracket

}		
	UI_remove_npc_face(item);	
	}

