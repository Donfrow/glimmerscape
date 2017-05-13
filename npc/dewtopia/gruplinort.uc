void Gruplinort object#(0x51A) ()
	{

var bark = "Human!";
var bark_intro = "Halt beast";

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
				UI_item_say(item, "Oooga mooga");
			else if (n == 2)
				UI_item_say(item, "Boogadeemoo!");
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
        call Gruplinort, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

	UI_show_npc_face(item);

if (UI_get_item_flag(item, 28)) 
	{
	say("@You evaded me last time, I shall slay you this time!@");
	}
else
	{
	say("@Foolish human, you will be slain by goblin might.@");
	UI_set_item_flag(item, 28, true);
	}
	// End of opening IF
	
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{
	if (response == "Bye")
			{
			say("@Bye from this world human.@");
			set_alignment(HOSTILE); 
   			set_schedule_type(IN_COMBAT);
   			set_opponent(AVATAR); 
			break;
			}
		else if (response == "Name")
			{
			say("@You are about to be slain by Gruplinort.@");
			UI_remove_answer("Name");
			UI_add_answer("Slain");
			}
		else if (response == "Job")
			{
			say("@To slay you foolish one");
			UI_remove_answer("Job");
			}
		else if (response == "Slain")
			{
			say("@You will perish!");
			UI_remove_answer("Slain");
			set_alignment(HOSTILE); 
   			set_schedule_type(IN_COMBAT);
   			set_opponent(AVATAR); 
			
			break;
			}

		}
	UI_remove_npc_face(item);
	}
	}
