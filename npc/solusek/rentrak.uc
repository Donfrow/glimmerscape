/*
Rentrak the gnome on solusek island
*/


void Rentrak object#(0x42b) ()
	{

var bark = "Hi to you";
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
				UI_item_say(item, "Pretty");
			else if (n == 2)
				UI_item_say(item, "Nupnup");
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
        call Rentrak, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Again hello I say to you.@");
		UI_remove_answer("Name");
	}
else
	{

	say("@Hello is said to you by me.@");
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
			say("@See you off with good fortune I wish.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Rentrak I am called.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@Job is not known by gnomes. Gnomes gather precious metal, gnomes mine!@");
			UI_remove_answer("Job");
			UI_add_answer("Gnomes");
			UI_add_answer("Mine");
			}
		else if (response == "Gnomes")
			{
			say("@Rentrak, Kartner and Olive are gnomes. Live in mountain we do.@");
			UI_remove_answer("Gnomes");
			UI_add_answer("Kartner");
			UI_add_answer("Olive");
			}

		else if (response == "Kartner")
			{
			say("@Kartner is friend of Rentrak. We fled same mountain. We were only two to survive the humans that came. We have traveled long time until resting here.@");
			UI_remove_answer("Kartner");
			}
		else if (response == "Olive")
			{
			say("@Olive is mate of Kartner. She is nice gnome.@");
			UI_remove_answer("Olive");
			}
		else if (response == "Mine")
			{
			say("@Mine for precious metals! Gnomes like precious metals so we search for precious metals.@");
			UI_remove_answer("Mine");
			}
		else if (response == "Precious metals")
			{
			say("@Precious metals must found to be admired. Gnomes make objects out of metals for decoration.@");
			UI_remove_answer("Precious metals");
			UI_add_answer("Objects");
			}
		else if (response == "Objects")
			{
			say("@Many humans make objects from precious metals but none are as precise as those done by a gnome hand.@");
			UI_add_answer("Objects");
			}

		
		}
	UI_remove_npc_face(item);
	}
}
