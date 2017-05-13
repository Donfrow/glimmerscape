// Cotton Cove Dewbert son of Columna and Lord dew but thnks Garth is father

void Dewbert object#(0x468) ()
	{

var bark = "Hi!";
var bark_intro = "Hello little boy";
	
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
				UI_item_say(item, "Cawww");
			else if (n == 2)
				UI_item_say(item, "It's a Jim Beam caw!");
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
        call Dewbert, TALK;
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


if (gflags[TALKED_TO_COLUMNA])
{
    UI_add_answer("Garth ain't your daddy and your momma's a ho");
}

if (UI_get_item_flag(item, MET)) 
	{
		say("@It you again!@");
		UI_remove_answer("Name");
	}
else
	{

	say("@Hullo stwangaw.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag




		converse
		{

	if (response == "Bye")
			{
			say("@Bye bye!@");			
			break;
			}
		else if (response == "Name")
			{
			say("@Dewbert!@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@You funny! Me not have a job!@");
			UI_remove_answer("Job");
			}
        else if (response == "Garth ain't your daddy and your momma's a ho")
        {
            say("@Noo that's impossible! Noooo!@");
			KarmaBadSprites();
            karma = karma - 250;
            break;
        }		

		
		}
	UI_remove_npc_face(item);
}	
	}

