/*
Turak the ghost in Exeter - need him to learn what to do with the ring
*/

void Turak object#(0x4c2) ()
	{

var has_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);
var has_orb_infinity = UI_count_objects(PARTY, ORB_OF_INFINITY, ANY, ANY);

var bark = "Uggh";
var bark_intro = "Hail ghost";

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
				UI_item_say(item, "The pain");
			else if (n == 2)
				UI_item_say(item, "Ungh");
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
        call Turak, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);


	
if(has_orb >0 || has_orb_infinity > 0)
{

    UI_add_answer("Name");
    UI_add_answer("Job");
    UI_add_answer("Bye");

if (gflags[TALK_TO_TURAK])
{
    UI_add_answer("Ring");
}

if (UI_get_item_flag(item, MET)) 
	{
		say("@I... can speak...@");
		UI_remove_answer("Name");

	}
else
	{

		say("@Please... save me from this torment.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag



		converse
		{
        if (response == "Bye")
        {
            say("@Do not leave me...@");
            break;
        }
        else if (response == "Name")
        {
            say("@So long... Tongak? Tolak? Trunk? Turak?@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@To have a job... so long ago... seek knowledge? I do not know...@");
            UI_remove_answer("Job");
        }
        else if (response == "Ring")
        {
            say("@Ring... ring of Ssra... I... recall...@");
            UI_remove_answer("Ring");
            UI_add_answer("What of the ring?");
        }
        else if (response == "What of the ring?")
        {
            say("@Ancient...@");
            UI_remove_answer("What of the ring?");
            UI_add_answer("What does it do?");
        }
        else if (response == "What does it do?")
        {
            say("@What... what does what do?@");
            UI_remove_answer("What does it do?");
            UI_add_answer("What does the ring do?");
        }
        else if (response == "What does the ring do?")
        {
            if(gflags[DROPPED_SCROLL])
            {
                say("@Read... I cannot... cannot go on...@");
                UI_add_answer("Where is the ring?");
            }
            else
            {
            say("@The ring... ancient ring... I cannot... I cannot go on...@");
            var scroll = UI_create_new_object(GOOD_SCROLL);
            UI_set_item_frame(scroll, 6);
            UI_set_item_quality(scroll, 75);
            UI_update_last_created(get_object_position(194));
            gflags[DROPPED_SCROLL] = true;
			RandomPartySay("@It appears to have dropped a scroll.@");
            }
            break;
            
        }
		else if (response == "Where is the ring?")
		{
			say("@Lost... mountains... Kint... I cannot go on...@");
			break; 
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
