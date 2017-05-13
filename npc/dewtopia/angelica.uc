/*

Trainee Angelica

*/

void Angelica object#(0x537) ()
	{

var bark = "Yes?";
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
				UI_item_say(item, "I shall prove myself");
			else if (n == 2)
				UI_item_say(item, "I will soon be a knight");
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
        call Angelica, TALK;
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
	say("@Yes sir?");
	UI_remove_answer("Name");
	}
else
	{
	say("@Yes sir?@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Sir yes sir!@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Trainee Angelica reporting sir.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@To become a fine knight of Dewtopia sir!@");
			UI_remove_answer("Job");
			UI_add_answer("You are the only female trainee?");
			}
		else if (response == "You are the only female trainee?")
			{
			say("@Yes sir! I am strong and skilled with my blade. I will not let Dewtopia down.@");
			UI_remove_answer("You are the only female trainee?");
			UI_add_answer("Dewtopia");
			}
		else if (response == "Dewtopia")
			{
			say("@It is the finest city in all these lands, but under constant threat from goblins sir!@");
			UI_remove_answer("Dewtopia");
			UI_add_answer("Goblins");

			}
		else if (response == "Goblins")
			{
			say("@They are an evil menace who eat the flesh of their foes as well as their own kind. I cannot stand idly by and let Dewtopia be ravaged by them sir!@");
			UI_remove_answer("Goblins");

			}
		

		
		}}
	UI_remove_npc_face(item);
	}
