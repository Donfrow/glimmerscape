/*
Adach, guard to Thanatos
*/

void Adach object#(0x459) ()
	{

var bark = "Halt";
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
				UI_item_say(item, "Stay clear");
			else if (n == 2)
				UI_item_say(item, "Thantos shall reign supreme");
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
        call Adach, TALK;
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
		say("@Do not anger milord and we will both be happy.@");
		UI_remove_answer("Name");
	}
else
	{

	say("@Let it be known stranger that if you anger milord while you are here I will not hesitate to cut you down.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag




		converse
		{

	if (response == "Bye")
			{
			say("@Do not make me destory you.@");
			break;
			}
		else if (response == "Name")
			{
			say("@I am Adach, but overall my name is certainly not important.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the personal protector of Lord Thanatos. You best stay out of trouble while in his land.@");
			UI_remove_answer("Job");
			UI_add_answer("Lord");
			UI_add_answer("Land");
			}
		else if (response == "Lord")
			{
			say("@Lord Thanatos is a powerful and fierce ruler who I would give my life for in a moments notice. Do not think I will not take yours for even insulting him.@");
			UI_remove_answer("Lord");
			}

		else if (response == "Land")
			{
			say("@You are on his land now, and thou would be wise to remember that fact. While he only controls a small portion of land at this time soon he will inherit all the lands.@");
			UI_remove_answer("Land");
			UI_add_answer("Inherit");
			}
		else if (response == "Inherit")
			{
			say("@It is his destiny to inherit all of Desporia. I will be made his general of all the lands when this happens. I will serve him to the end of time.@");
			UI_remove_answer("Inherit");
			}


		
		
		}
	UI_remove_npc_face(item);
}
	}

