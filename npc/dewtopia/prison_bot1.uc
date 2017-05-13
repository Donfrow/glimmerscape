/*
Prison automation inside sugar caves
*/

void PrisonBot1 object#(0x53e) ()
	{

var bark = "Function response called";
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
				UI_item_say(item, "Click whirr whirr click");
			else if (n == 2)
				UI_item_say(item, "Click");
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
        call PrisonBot1, TALK;
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
	say("@Entrance Remains Secure. No Escapes.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Entrance Remains Secure. No Escapes.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("click");
			break;
			}
		else if (response == "Name")
			{
			say("@Prison Bot 541.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@The entrance to the Sugar Caves must be guarded. I fulfill that requirement.@");
			say("@Please move along.@");
			UI_remove_answer("Job");
			UI_add_answer("Sugar Caves");
			}
		else if (response == "Sugar Caves")
			{
			say("@Violators of Lord Dew's laws are sent to toil in the Sugar Caves. They remain here until they are set free.@");
			UI_remove_answer("Sugar Caves");
			}

		}
	UI_remove_npc_face(item);
	}
}
