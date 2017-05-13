/*
The Fire ELemental Servant to the Lord of Flame
*/

void Fire_Elemental_Servant object#(0x584) ()
	{

var bark = "What... want...";
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
				UI_item_say(item, "");
			else if (n == 2)
				UI_item_say(item, "");
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
        call Fire_Elemental_Servant, TALK;
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
		say("The fire elemntals empty expression faces you. @What desire?@");
		UI_remove_answer("Name");

	}
else
	{
		say("A creature with empty eyes of flame faces you. @What desire?@");

		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


    converse
    {
        if (response == "Bye")
        {
            say("The fire elemental does not even acknowledge your farewell.");
            break;
        }
        else if (response == "Name")
        {
            say("What you think is a puzzled looks appears before the creature opens its burning mouth. @Me no understand.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("A fiery mouth opens. @Serve master.@");
            UI_remove_answer("Job");
            UI_add_answer("Serve");
            UI_add_answer("Master");
        }
        else if (response == "Serve")
        {
            say("@Master make... do chore.@");
            UI_remove_answer("Serve");
        }
        else if (response == "Master")
        {
			say("The creature pipes up in nearly perfect tongue. @The Lord of Flame is my one and only master.@");
			AVATAR.say("@It would appear the Lord of Flame has trained this creature well to know who he is.@");
			UI_remove_answer("Master");
        }
}
	UI_remove_npc_face(item);
	}
}
