/*

Skynet - the newest automation in Dewtopia

*/


void Skynet object#(0x5f7) () //Old number with 0x4c6 with npc 198
	{
var position = UI_get_object_position();
var input_instructions = UI_count_objects(PARTY, GOOD_SCROLL, 70, ANY);

	UI_show_npc_face(item);
    UI_set_item_flag(item, MET, true);
	UI_add_answer("Name");
	UI_add_answer("Job");
	UI_add_answer("Bye");
	UI_add_answer("Information");	
	
if (input_instructions > 0)
{
    UI_add_answer("Input code");
}

if (gflags[BOT_JOINABLE])
{
    UI_add_answer("Join");
}

say("Click.");


if (inParty(-503))
{
    UI_add_answer("Leave");
    UI_remove_answer("Join");
    converse
    {
        if (response == "Bye")
			{
			say("Click.");
			break;
			}
		else if (response == "Name")
			{
			say("@T-850.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am currently tasked to serve you.@");
			UI_remove_answer("Job");
			}

		else if (response == "Information")
			{
			say("@Unit Statistics:@");
			say("@Unit T-850 Endoskeleton with available power of 120 years.@");
			say("@CPU is a neural net processor. A learning computer.@");
			UI_remove_answer("Information");
			}
		else if (response == "Leave")
		{
            say("@Shutting down. Will remain in this spot until reactivated.@");
            UI_remove_from_party(-503);
            UI_modify_schedule(-503, 0, STAND, [position[1], position[2]]);
            UI_modify_schedule(-503, 1, STAND, [position[1], position[2]]);
            UI_modify_schedule(-503, 2, STAND, [position[1], position[2]]);
            UI_modify_schedule(-503, 3, STAND, [position[1], position[2]]);
            UI_modify_schedule(-503, 4, STAND, [position[1], position[2]]);
            UI_modify_schedule(-503, 5, STAND, [position[1], position[2]]);
            UI_modify_schedule(-503, 6, STAND, [position[1], position[2]]);
            UI_modify_schedule(-503, 7, STAND, [position[1], position[2]]);
            break;
        }
    }
}
else
{


		converse
		{
	if (response == "Bye")
			{
			say("Click.");
			break;
			}
		else if (response == "Name")
			{
			say("@Information not yet entered.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@Information not yet entered.@");
			UI_remove_answer("Job");
			}

		else if (response == "Information")
			{
			say("@Unit Statistics:@");
			say("@Unit T-850 Endoskeleton with available power of 120 years.@");
			say("@CPU is a neural net processor. A learning computer.@");
			UI_remove_answer("Information");
			}
		else if (response == "Input code")
		{
		  say("Click whirr whirr click");
		  say("@Code input. Rebooting.@");
		  UI_remove_party_items(1, GOOD_SCROLL, 70, ANY);
		  gflags[BOT_JOINABLE] = true;
		  break;
        }
        else if (response == "Join")
        {
            say("@Following orders of leader. Click.@");
            UI_add_to_party(-503);
            UI_remove_answer("Join");
        }

		      }

		}
	UI_remove_npc_face(item);
	}
