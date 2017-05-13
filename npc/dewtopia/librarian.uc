/*

Librarian in Dewtopia

*/

void Librarian object#(0x54d) ()
	{

var bark = "Hail to you";
var bark_intro = "Hail";

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
				UI_item_say(item, "Where is that book");
			else if (n == 2)
				UI_item_say(item, "So much dust");
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
        call Librarian, TALK;
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
	say("@Again we meet sir");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to the Dewtopian Library. I am thy guide. If you desire help finding a book you mayest ask me.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Continue to read.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@It is a good question! Everyone has reffered to me simply as The Librarian for so long, I have forgotten.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I tend the Dewtopian Library. If you seek knowledge from a book, you hath come to the right place.@");
			UI_remove_answer("Job");
			UI_add_answer("Library");
			}
		else if (response == "Library")
			{
			say("@Knowledge is power and the written word allows for knowledge to last the ages and be easily shared with others.@");
			say("@You are welcome to browse the library, but I only allow citizens of Dewtopia to remove a book from the building. If you desire you can sit by the table to read here.@");
			UI_remove_answer("Library");

			}
		
		}
	UI_remove_npc_face(item);
	}
}
