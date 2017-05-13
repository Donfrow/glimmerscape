//Jasper the farmer in Cambray

void Jasper object#(0x572) ()
	{
	
var bark = "Please, I have much work to do";
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
				UI_item_say(item, "Such long days");
			else if (n == 2)
				UI_item_say(item, "So much toil");
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
        call Jasper, TALK;
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
		say("@Please be brief. I have so little free time in my days.@");
		UI_remove_answer("Name");

	}
else
	{
	say("The man looks at you. @Please be brief, there is much work to be done.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("Jasper shrugs and turns away.");			
			break;
			}
		else if (response == "Name")
			{
			say("@I am known as Jasper.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@I tend to the local farmland here on Cambray island.@");
            UI_remove_answer("Job");
            UI_add_answer("Farmland");
            UI_add_answer("Cambray");
        }
        else if (response == "Farmland")
        {
            say("@Cambray is not the greatest for farming but it does have a small plot of land by the mayors office that is suitable. While it may be small it is still a large amount of work.@");
            UI_remove_answer("Farmland");
            UI_add_answer("Mayors office");
        }
        else if (response == "Mayors office")
        {
            if (UI_get_schedule_type(item) == FARM)
            {
            say("@Do you think I pay attention to what goes on in there? I have work to do you know. Unlike some people I do not have the luxury of getting into other peoples business.@");
            say("@Now if you excuse me some of us have to get back to work...@");
            break;
            }
            else
            {
                say("@Sometimes when I am farming I hear the mayor and his wife arguing about Arthis's tomb. Apparantly Olivia wants to bury the tomb permanently but Morrison is uneasy about the idea.@");
            }
            UI_remove_answer("Mayors office");
        }
        else if (response == "Cambray")
        {
            if (UI_get_schedule_type(item) == FARM)
            {
                say("@Why would you ask me such a dumb question? Do you not see I have work to do?@");
                break;
            }
            else
            {
                say("@Cambray is the island you are on. It is also the name of the town here.@");
            }
            UI_remove_answer("Cambray");
        }

        } // end converse bracket

}		
	UI_remove_npc_face(item);	
	}

