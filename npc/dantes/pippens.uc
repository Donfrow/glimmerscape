/*
Pippens the Swabbie at Dante's Trading Post
*/

void Pippens object#(0x45b) ()
	{

var bark = "Eek!";
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
				UI_item_say(item, "Can't sleep yeti'll eat me");
			else if (n == 2)
				UI_item_say(item, "Aieee");
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
        call Pippens, TALK;
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
		say("@Do not surprise me like that!@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Eeek!@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{

	if (response == "Bye")
			{
			say("@So quite....@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Pippens...@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I was a swabbie on an ill fated journey.@");
			UI_remove_answer("Job");
			UI_add_answer("Journey");

			}
		else if (response == "Journey")
			{
            say("@The Yeti... they slayed and ate the crew... I cannot think of it... leave me be...@");
			break;
			}

		}
	UI_remove_npc_face(item);
	}
}
