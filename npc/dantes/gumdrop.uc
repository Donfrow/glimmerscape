/*
Gumdrop - Gnome at Dante's Trading Post
*/

void GumDrop object#(0x41e) ()
	{

var bark = "Gumdrop sees you";
var bark_intro = "Gnome";

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
				UI_item_say(item, "Ohhh shiny");
			else if (n == 2)
				UI_item_say(item, "Gumdrop likes!");
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
        call GumDrop, TALK;
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
		say("@Greetings I say again to you.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@New face is seen by me and hello is given.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{

	if (response == "Bye")
			{
			say("@Travels be safe and no problems you encounter I hope.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@GumDrop!@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@Prepare objects out of metals and other materials I do. Masters at this gnomes are.@");
			UI_remove_answer("Job");
			UI_add_answer("Objects");
			UI_add_answer("Gnome");

			}
		else if (response == "Objects")
			{
            say("@Master artisans gnomes are. Better detail and quality in gnome made than human made trinkets. Will make object for you if desired.@");
			UI_remove_answer("Objects");
			}
        else if (response == "Gnome")
            {
            say("@Gnome is my race. Live in mountains we do. GumDrop alone here with humans but it is not so bad.@");
            UI_remove_answer("Gnome");
            UI_add_answer("Not so bad");
            }
         else if (response == "Not so bad")
            {
                say("@Misses other gnomes I do but safe here I am. No harm to brought upon GumDrop here.@");
                UI_remove_answer("Not so bad");
                UI_add_answer("Harm");
            }
         else if (response == "Harm")
         {
            say("@Humans run gnomes out of cave homes. Many gnomes slain by humans or die of exposure outside caves. Many humans view gnomes as vermin. No worry is needed by me as safe here it is.@");
            UI_remove_answer("Harm");
         }
            
		}
	UI_remove_npc_face(item);
	}
}
