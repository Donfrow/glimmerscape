/*
Headless beasts in the cells
*/

void Headless object#(0x58c) ()
	{

var bark_intro = "Hail";

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
        wait 8;
        call Headless, TALK;
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

say("The creature waves its arms frantically.");

		converse
		{

	if (response == "Bye")
			{
			say("A series of strange sounds is heard.");
			
			break;
			}
		else if (response == "Name")
			{
			say("The creature flails its arms.");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("A series of strange noises are heard as the creature flails its limbs around frantically.");
			RandomPartySay("@This creature appears to be making noise from... somewhere.@");
			UI_remove_answer("Job");
			}
	}
	UI_remove_npc_face(item);
	}
}
