/*
Klemens at Dante's Trading Post
*/

void Klemens object#(0x452) ()
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
				UI_item_say(item, "It was a disaster");
			else if (n == 2)
				UI_item_say(item, "I cannot believe that it actually happened");
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
        call Klemens, TALK;
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
		say("@What is the good word?");
		UI_remove_answer("Name");
	}
else
	{

		say("@Well met stranger.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{

	if (response == "Bye")
			{
			say("@May your travels in the icy waters be better than ours.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I be first mate Klemens.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am First Mate aboard the Lusitania.@");
			UI_remove_answer("Job");
			UI_add_answer("Lusitania");
			UI_add_answer("First Mate");

			}
		else if (response == "Lusitania")
			{
            say("@It is the ship that is captained by Captain Lucid. Though, there is not much crew to captain after the Yeti attack.@");
		      UI_remove_answer("Lusitania");
		      UI_add_answer("Yeti attack");
			}
		else if (response == "Yeti attack")
		{
		  say("@It was a bloodbath in the icy regions just north of here. It is not my place to speak of it. If you truely desire knowledge of it speak with Captain Lucid.@");
		  UI_remove_answer("Yeti attack");
        }
        else if (response == "First Mate")
        {
            say("@It is the second in command of a ship. I thought this was common knowledge.@");
            UI_remove_answer("First Mate");
        }
        
		      

		}
	UI_remove_npc_face(item);
	}
}
