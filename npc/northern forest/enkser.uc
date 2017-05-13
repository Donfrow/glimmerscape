/*

Enkser in the Northern forest inn

*/


void Enkser object#(0x55d) ()
	{

var bark = "Hail";
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
				UI_item_say(item, "Food!");
			else if (n == 2)
				UI_item_say(item, "What a boring day");
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
        call Enkser, TALK;
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
	say("@Again you bother me.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@What do you want?@");
	UI_set_item_flag(item, MET, true);
	}



		converse
		{
	if (response == "Name")
			{
						
			say("@Enkser, why do you want to know?@");
			UI_remove_answer("Name");
			}

		else if (response == "Job")
			{
			say("@Why do you want to know?@");
			UI_remove_answer("Job");
			UI_add_answer("Tell me your job");
			}
		else if (response == "Tell me your job")
			{
			say("@If you truely want to know you must tell me what your job is.@");
			UI_remove_answer("Bye");
			UI_remove_answer("Tell me your job");
			UI_add_answer("None of your business");
			UI_add_answer("Your God");
			UI_add_answer("Kung-Foo Master");
			UI_add_answer("Hobo");
			}
		else if (response == "None of your business")
			{
			say("@Just as mine is none of thine.@");
			UI_remove_answer("None of your business");
			break;
			}
		else if (response == "Your God")
			{
			say("@Ha! Someone has a big head on their shoulders.@");
			UI_remove_answer("Your God");
			UI_remove_answer("Kung-Foo Master");
			UI_remove_answer("Hobo");
			UI_remove_answer("None of your business");
			UI_add_answer("Bye");
			UI_add_answer("So what is your job?");
			}
		else if (response == "Kung-Foo Master")
			{
			say("@Kung-Foo? Methinks someone has been hitting the magical herbs a bit too much lately.@");
			UI_remove_answer("Your God");
			UI_remove_answer("Kung-Foo Master");
			UI_remove_answer("Hobo");
			UI_remove_answer("None of your business");
			UI_add_answer("Bye");
			UI_add_answer("So what is your job?");
			}
		else if (response == "Hobo")
			{
			say("@I thought as much. I could tell by your foul stench.@");
			UI_remove_answer("Your God");
			UI_remove_answer("Kung-Foo Master");
			UI_remove_answer("Hobo");
			UI_remove_answer("None of your business");
			UI_add_answer("Bye");
			UI_add_answer("So what is your job?");
			}
		
		else if (response == "So what is your job?")
			{
			say("@As you hath humoured me I shall indulge you. I am a bandit hunter.@");
			UI_remove_answer("So what is your job?");
			UI_add_answer("Bandit Hunter");
			}
		else if (response == "Bandit Hunter")
			{
			if (gflags[NORTHERN_BANDITS_DEAD])
				{
				say("@You did slay my target and ruin months of planning and effort. You are dung, did you know that?@");
				UI_remove_answer("Bandit Hunter");
				}
			else
				{
				say("@I am in search of a particularly cunning bandit known as Esame. I will not indulge you with any other details suffice to say he would kick your arrogant ass.@");
				UI_remove_answer("Bandit Hunter");
				}
			}


		else if (response == "Bye")
			{
			say("@Bye.@");
			break;
			}


		}
	UI_remove_npc_face(item);
	}
}
