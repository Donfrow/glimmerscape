/*
Gwani Servant to the ice witch
*/

void Gwani_Servant object#(0x586) ()
	{

var bark = "What serve you?";
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
				UI_item_say(item, "No beat!");
			else if (n == 2)
				UI_item_say(item, "No hurt servant!");
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
        call Gwani_Servant, TALK;
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
		say("The yeti stares at you. @What do for you?@");
		UI_remove_answer("Name");

	}
else
	{
		say("What appears to be a domesticated yeti stares at you. @What do for you?@");

		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


    converse
    {
        if (response == "Bye")
        {
            say("The yeti mumbles something about work as you wave it off.");
            break;
        }
        else if (response == "Name")
        {
            say("@Servant.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("It is obvious the yeti has trouble speaking the common tongue. @Servant serve for mistress.@");
            UI_remove_answer("Job");
            UI_add_answer("Serve");
            UI_add_answer("Mistress");
        }
        else if (response == "Serve")
        {
            say("@Work with other servant. Do chores.@");
            UI_remove_answer("Serve");
            UI_add_answer("Other servant");
        }
        else if (response == "Other servant")
        {
			say("The yeti points around. @Ice goblin other servant. Ice goblin work in kitchen. Ice goblin no talk.@");
			UI_remove_answer("Other servant");
        }
        else if (response == "Mistress")
        {
			say("@Mistress of Ice. Work for Mistress. Servant no want beatings!@");
			UI_remove_answer("Mistress");
			UI_add_answer("Beatings");
        }
        else if (response == "Beatings")
        {
			say("@Mistress order troll beat servant if servant not do well! Servant do well! No beat! No beat!@");
			UI_remove_answer("Beatings");
			UI_add_answer("Troll");
        }
        else if (response == "Troll")
        {
			say("@Troll strong! Troll total obidient. Troll hurt servant when ordered. No order troll to beat!@");
			script item
			{
				say "No beat!";
			}
			break;
			UI_remove_answer("Troll");
        }
}
	UI_remove_npc_face(item);
	}
}
