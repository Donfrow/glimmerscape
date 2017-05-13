/*
Kaie, lady of the evil castle guy on Cabele Island
*/

void Kaie object#(0x4ba) ()
	{

var bark = "Why, it is a commoner";
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
				UI_item_say(item, "I am so great");
			else if (n == 2)
				UI_item_say(item, "Of course");
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
        call Kaie, TALK;
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
		say("@What do you want again?@");
		UI_remove_answer("Name");
	}
else
	{

	say("@What would you like with me?@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag




		converse
		{

	if (response == "Bye")
			{
			say("@You will not be missed.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Kaie, Lady Kaie to you.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@Why, I am the wife of the lord of this island.@");
			UI_remove_answer("Job");
			UI_add_answer("Lord");
			UI_add_answer("Island");
			}
		else if (response == "Lord")
			{
			say("@Lord Thanatos is such a fine man and ruler. You are lucky he even lets the likes of you wander his castle.@");
			UI_remove_answer("Lord");
			}

		else if (response == "Island")
			{
			say("@You are on Cabele island, the island of our lord. I ask that you show respect while here by not asking dumb questions.@");
			UI_remove_answer("Island");
			}

		
		
		}
	UI_remove_npc_face(item);
	}
}
