/*
Dante, head guy at Dante's outpost at the river border between ice and non-ice areas
*/

void Dante object#(0x435) ()
	{

var bark = "Hail";
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
				UI_item_say(item, "The air is chilled");
			else if (n == 2)
				UI_item_say(item, "The ice flows are heavy");
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
        call Dante, TALK;
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
		say("@Come for more trading?@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Well met trader.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{

	if (response == "Bye")
			{
			say("@Do return with your trades.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Why, I am Dante!");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@Are you slow? I am the head of this outpost, it being Dante's Trading Post and I being Dante...@");
			UI_remove_answer("Job");
			UI_add_answer("Trading Post");
			}
		else if (response == "Trading Post")
			{
			say("@It is a junction between the icy waters of the Frigid Planes and the more temperate waters of the rest of the land.@");
			UI_remove_answer("Trading Post");
			UI_add_answer("Frigid Planes");
			}
        else if (response == "Frigid Planes")
            {
            say("@The Frigid Planes are where many of the finest pelts throughout the lands come from. It is also home of the feared Yeti.@");
            UI_remove_answer("Frigid Planes");
            UI_add_answer("Pelts");
            UI_add_answer("Yeti");
            }

        else if (response == "Pelts")
            {
                say("@Much of the pelts that you may purchase in cities are from the Frigid Planes. This also means that most of them pass through this outpost at some point.@");
                UI_remove_answer("Pelts");
            }
        else if (response == "Yeti")
            {
                say("@Fearsome creatures the Yeti are. Some call them the fur-covered goblins. Difficult beasts to slay but they do offer excellent pelts.@");
                UI_remove_answer("Yeti");
            }
		}
	UI_remove_npc_face(item);
	}
	}
	
