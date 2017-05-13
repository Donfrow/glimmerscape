/*
Ratman working near the mushrooms in the cave
*/


void Ratman object#(0x4c1) ()
	{

var bark = "Please do not hurt me!";
var bark_intro = "Ratman";

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
				UI_item_say(item, "Must not displease the masters");
			else if (n == 2)
				UI_item_say(item, "Please no more beatings");
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
        call Ratman, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Please, just leave me be.@");
	}
else
	{

		say("@Please do not beat me!");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag






		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Escape while you can!@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@The goblins call me rat.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@Job? I do not know what you mean.@");
			UI_remove_answer("Job");
			UI_add_answer("What is thy purpose?");
			}
		else if (response == "What is thy purpose?")
			{
			say("@The goblins creations must be fed. I gather mushrooms and feed it to the beasts. If they find out I am talking to thee they will beat me. Do not let them know!");
			UI_remove_answer("What is thy purpose?");
			UI_add_answer("Goblins");
			UI_add_answer("Creations");
			}
		else if (response == "Goblins")
			{
			say("@Serve the goblins I must. Cannot run for they will find me. If I run beatings will be more severe. Must work, must work.@");
			break;
			}
		else if (response == "Creations")
			{
			say("@Down the tunnel is a room where creations are fed. I slip food through bars. Horrible creatures, half man and half spider. Would eat me if they could.@");
			
			UI_remove_answer("Creations");
			
			}


		}
	UI_remove_npc_face(item);
	}
}
