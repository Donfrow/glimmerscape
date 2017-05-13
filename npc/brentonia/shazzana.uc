/*
Shazzana in Brentonia
*/


void Shazzana object#(0x44a) ()
	{

var bark = "Well met";
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
				UI_item_say(item, "Keep your skills up");
			else if (n == 2)
				UI_item_say(item, "Beware of the beasts which lurk in the wild");
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
        call Shazzana, TALK;
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
		say("@What can I do for you?@");
		UI_remove_answer("Name");

	}
else
	{

		say("@What can I do for you stranger?@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Be careful in your travels.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Shazzana be my name.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am a fighter for the kingdom of Brentonia.@");
            UI_remove_answer("Job");
            UI_add_answer("Brentonia");
            UI_add_answer("Fighter");
        }
        else if (response == "Brentonia")
        {
            say("@Brentonia is a wonderous city run by a most benevolent leader.@");
            UI_remove_answer("Brentonia");
            UI_add_answer("Benevolent leader");
        }
        else if (response == "Benevolent leader")
        {
            say("@Lord Brent is a wise and kind, a better leader one could not ask for. He even allows the citizens of the city to view his collection of antiquities.@");
            UI_remove_answer("Benevolent leader");
            UI_add_answer("Antiquities");
        }
        else if (response == "Antiquities")
        {
            say("@It is quite the collection of goods that the kingdom has acquired over the years. Some of it even dates back to the Ophidians. It is quite awe inspiring in my opinion.@");
			say("@But I blather on. I suggest that you check the museum out yourself. It is far better to experience it yourself as I am no expert on the subject.@");
            UI_remove_answer("Antiquities");
        }
        else if (response == "Fighter")
        {
            say("@Indeed, a fighter. And do not be thinking that just because I only have one eye I cannot figure out how far I need to slash my sword for you would not last long if you tried.@");
            UI_remove_answer("Fighter");
        }

		}
	UI_remove_npc_face(item);
	}
}
