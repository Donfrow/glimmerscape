//Loretta in Cambray

void Loretta object#(0x573) ()
	{
	
var bark = "Can I help you?";
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
				UI_item_say(item, "So much work to be done");
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
        call Loretta, TALK;
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
		say("@I hope you are still doing well.@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");

	}
else
	{
	say("The woman smiles. @Welcome stranger.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("Loretta waves you off.");			
			break;
			}
		else if (response == "Name")
			{
			say("The woman does a small curtsy. @I am Loretta.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@I am a seamstress here in Cambray. Occasionally I may also help my husband in the field.@");
            UI_remove_answer("Job");
            UI_add_answer("Seamstress");
            UI_add_answer("Field");
            UI_add_answer("Husband");
            UI_add_answer("Cambray");
        }
        else if (response == "Seamstress")
        {
            say("@I sew. And sew lots. Many here in town order clothes from me and I am slightly backlogged. I can however sell you bandages.@");
            UI_remove_answer("Seamstress");
            UI_add_answer("Buy");
        }
        else if (response == "Buy")
        {
            if (UI_get_schedule_type(item) == SEW)
            {
                var bandagecost = 5;
                BuyBandages(bandagecost);
            }
            else
            {
                say("@I am happy to sell you bandages but please do come back when I am working.@");
            }
            UI_remove_answer("Buy");
        }
        else if (response == "Field")
        {
            say("@There is not much farmland in Cambray but what farmland is present is near the mayors office. My husband tends to the fields most of the time however.@");
            say("@Lately he has mentioned that while tending the field he constantly hears bickering between the mayor and his wife.@");
            UI_remove_answer("Field");
        }
        else if (response == "Husband")
        {
            say("@Jasper is my husband. He can be quite unpleasent to deal with if you catch him while tending to the fields, but if you get a chance to speak with him while he is not working he will really open up.@");
            UI_remove_answer("Husband");
        }
        else if (response == "Cambray")
        {
            say("@Cambray is the island as well as the town name. I do not know what it means or why it was named suched, but it is a nice place to live.@");
            UI_remove_answer("Cambray");
        }

        } // end converse bracket

}		
	UI_remove_npc_face(item);	
	}

