/*
Petra the ghost in exeter
*/

void Petra object#(0x41c) ()
	{

var has_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);
var has_orb_infinity = UI_count_objects(PARTY, ORB_OF_INFINITY, ANY, ANY);

var bark = "What...";
var bark_intro = "Ghost";

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
				UI_item_say(item, "who... where...");
			else if (n == 2)
				UI_item_say(item, "the torment...");
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
        call Petra, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
		
	UI_show_npc_face(277, 1);


	
if(has_orb >0 || has_orb_infinity > 0)
{

    UI_add_answer("Name");
    UI_add_answer("Job");
    UI_add_answer("Bye");
    UI_add_answer("What happened here?");


if (UI_get_item_flag(item, MET)) 
	{
		say("@I... can speak...@");
		UI_remove_answer("Name");

	}
else
	{

		say("@End... end the torment.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag



		converse
		{
        if (response == "Bye")
        {
            say("@Please... help me...@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am... I was... I was Petra.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@Job... once... once I healed... healed...@");
            UI_remove_answer("Job");
			UI_add_answer("Heal");
        }
        else if (response == "What happened here?")
        {
            say("@The... the great light... light tore... tore the fabric...@");
            UI_remove_answer("What happened here?");
            UI_add_answer("Light");
            UI_add_answer("Fabric");
        }
        else if (response == "Light")
        {
            say("@The light... pain... and suffering... pain brought by the light...@");
            UI_remove_answer("Light");
        }
        else if (response == "Fabric")
        {
            say("@Energy... ripple... tore fabric... I... cannot go on...@");
            break;
        }
		else if (response == "Heal")
		{
			say("@Could... could not heal those injured. Too hurt... too quickly... I... heal you...@");
			UI_remove_answer("Heal");
			UI_add_answer("Heal me");
		}
		else if (response == "Heal me")
		{
			say("Petras temporal hand reaches for some bandages but just goes through them. @Heal... heal you...@");
			RandomPartySay("@It would appear this shade cannot fully grasp her situation.@");
			UI_remove_answer("Heal me");
		}

		}
}
else
{
    say("@Unghhh.@");
}
	UI_remove_npc_face(item);
	}
}
