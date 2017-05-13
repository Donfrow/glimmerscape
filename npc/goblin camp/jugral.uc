/*
Jugral the goblin lore keeper
*/

void Jugral object#(0x561)()
	{

var bark = "Human!";
var bark_intro = "Stop beast";

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
				UI_item_say(item, "Gruplinot gooble");
			else if (n == 2)
				UI_item_say(item, "Gobbledeegook");
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
        call Jugral, TALK;
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
	say("@You will make a lovely experiment.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@You will make a lovely experiment.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@You will be suffering as I test my knew knowledge onto you.@");
			set_alignment(HOSTILE); 
   			set_schedule_type(IN_COMBAT); 
   			set_opponent(AVATAR); 
			break;
			}
		else if (response == "Name")
			{
			say("@Jugral, the smartest goblin of them all.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@To take the Liche's teaching and allow it to empower us as much as possible.@");
			UI_remove_answer("Job");
			UI_add_answer("The Liche is slain");
			}
		else if (response == "The Liche is slain")
			{
			say("@The Liche believed that it was stronger than us but with my improvements and experiments we do not need such a feable being anymore.@");
			say("@You will now become part of my experiments. Do enjoy.@");
			UI_remove_answer("Pets");
			set_alignment(HOSTILE); 
   			set_schedule_type(IN_COMBAT); 
   			set_opponent(AVATAR); 
			break;
			}
		}
	UI_remove_npc_face(item);
	}
	}
