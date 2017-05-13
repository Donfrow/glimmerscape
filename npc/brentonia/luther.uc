/*
Luther in Brentonia
*/


void Luther object#(0x447) ()
	{

var bark = "What do you want of me?";
var bark_intro = "Hail";
var schedule = UI_get_schedule_type(item);
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
				UI_item_say(item, "Everyone should admire me");
			else if (n == 2)
				UI_item_say(item, "I am such a perfect knight");
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
        call Luther, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if(schedule == SIT || schedule == EAT_AT_INN)
{
	say("@Can you not see I am busy watching the show? Leave me be!@");
}
else
{
	
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (UI_get_item_flag(item, MET)) 
	{
		say("@Why do you continue to pester such a mighty knight of Brentonia?@");
		UI_remove_answer("Name");

	}
else
	{

		say("@What business do you have with a mighty knight of Brentonia such as myself?@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Do not cause trouble or I will toss you into the jail.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Guard Luther, but you can refer to me by my official rank as knight.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am one of the guards here in Brentonia. I train and patrol the city to ensure that everything is safe. And do not think about causing trouble for I have dealt with far better adversaries than the likes of you.@");
            UI_remove_answer("Job");
            UI_add_answer("Brentonia");
			UI_add_answer("Adversaries");
        }
		else if (response == "Adversaries")
		{
			say("It is quite obvious that this man likes to speak of his deeds. @Just recently a swindler tried to pick my pocket. I made quick work of him and he now rests in the jail.@");
			say("@But can you believe that? Someone tried to pick my pocket, a mighty knight of Dewtopia! The gall is amazing.@");
			UI_remove_answer("Adversaries");
			UI_add_answer("Swindler");
		}
		else if (response == "Swindler")
		{
			say("@Marsten is his name. Apparantly he had managed to pick pocket from several others before I brought him to justice. In fact, I like to go visit him in jail every now and then to mock his foolishness.@");
			UI_remove_answer("Swindler");
		}
        else if (response == "Brentonia")
        {
            say("@It is one of the grandest cities in all the land, and also at a very strategic spot to repel invasion.@");
            UI_remove_answer("Brentonia");
            UI_add_answer("Strategic spot");
			UI_add_answer("Invasion");
        }
        else if (response == "Strategic spot")
        {
            say("@The city is nestled in the great northern mountain range. Unless someone were to travel the mountains the city is only accessible from the south east side. This ensures us ample protection.@");
            UI_remove_answer("Strategic spot");
        }
		else if (response == "Invasion")
		{
			say("@Be it from goblin, man or any other foe us knights of Brentonia are ready to fight any potential invader.@");
			UI_remove_answer("Invasion");
		}

		}
	UI_remove_npc_face(item);
	}
}
}
