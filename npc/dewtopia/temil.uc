/* Temil the inner city farmer
*/

void Temil object#(0x52a) ()
	{

var bark = "What can I do for you?";
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
				UI_item_say(item, "Such a lovely day");
			else if (n == 2)
				UI_item_say(item, "Hail Lord Dew");
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
        call Temil, TALK;
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
	say("@Welcome back friend");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to Dewtopia!");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@So long.@");	
			break;
			}
		else if (response == "Name")
			{
			say("@I am Temil good sir.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I tend the royal animals here in Dewtopia.@");
			UI_remove_answer("Job");
			UI_add_answer("Royal animals");
			}
		else if (response == "Royal animals")
			{
			say("@Lord Dew deserves the best animals for his meals, and I am lucky enough to provide that.@");
			UI_add_answer("Lucky");
			UI_remove_answer("Royal animals");
			}
		else if (response == "Lucky")
			{
			say("@The walls protect my home and Lord Dew's animals, as such I need not worry about goblins or bandits.@");
			UI_remove_answer("Lucky");
			UI_add_answer("Goblins");
			UI_add_answer("Bandits");
			}
		else if (response == "Goblins")
			{
			say("@Horrible creatures. Strong as an oxe but as bright as the chickens I tend to.@");
			say("@They attempt to raid Dewtopia on a constant basis but we are protected by fine guards.@");
			UI_remove_answer("Goblins");
			}
		else if (response == "Bandits")
			{
			say("@The Plains Bandits have been a constant annoyance for some time now, but they are not nearly as much of a problem as the goblins.@");
			say("@They tend to attack those alone outside of the city, so they do not concern me much.@");
			UI_remove_answer("Bandits");
			}


		}
	UI_remove_npc_face(item);
	}
}
