/*
Olive the gnome on solusek island
*/


void Olive object#(0x4b0) ()
	{

var bark = "Hello to you Human";
var bark_intro = "Hello little one";

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
				UI_item_say(item, "Shiny objects");
			else if (n == 2)
				UI_item_say(item, "Punt!");
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
        call Olive, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Again hello is said by Olive.@");
		UI_remove_answer("Name");
	}
else
	{

	say("@Olive say hello to you stranger.@");
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
			say("@Goodbye I wish to you.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Olive you can refer me as.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am mate of Kartner and friend of Rentrak.@");
			UI_remove_answer("Job");
			UI_add_answer("Kartner");
			UI_add_answer("Rentrak");
			}
		else if (response == "Kartner")
			{
			say("@Kartner is mate of Olive. He has found us sanctuary in this mountain. We can now live and work in peace.@");
			UI_remove_answer("Kartner");
			UI_add_answer("Sanctuary");
			}

		else if (response == "Sanctuary")
			{
			say("@Humans do not bother us here. Humans that visit are kind and only seek us to make things out of metals that are brought.@");
			UI_remove_answer("Sanctuary");
			UI_add_answer("Make things");
			}
		else if (response == "Make things")
			{
			say("@Make things gnomes love! Gnome lot in life is to tinker! If you ever need us to make you something you must simply ask. Gnomes would be honoured to help make an item.@");
			UI_remove_answer("Make things");
			}
		else if (response == "Rentrak")
			{
			say("@Rentrak is long time companion of Kartner. They fled mountain with group of gnomes but only they survived. Bond of friendship of theirs cannot be broken.@");
			
			UI_remove_answer("Rentrak");
			UI_add_answer("Fled");
			}
		else if (response == "Fled")
			{
			say("@Fled before meeting Olive. You should ask one of them about it.@");
			UI_remove_answer("Fled");
			}
		
		}
	UI_remove_npc_face(item);
	}
}
