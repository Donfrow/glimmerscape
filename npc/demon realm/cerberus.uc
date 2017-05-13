/*
Cerberus of the demon realm
*/


void Cerberus object#(0x457) ()
	{


var bark = "Human...";
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
				UI_item_say(item, "Stand fast");
			else if (n == 2)
				UI_item_say(item, "Steady");
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
        call Cerberus, TALK;
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
		UI_add_answer("Ore");

if (UI_get_item_flag(item, MET)) 
	{
		say("@Humph.@");
		UI_remove_answer("Name");

	}
else
	{

		say("@What do you want, human?@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag



		converse
		{
        if (response == "Bye")
        {
            say("@Humph.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am Cerberus.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the protector of our Lord.@");
            UI_remove_answer("Job");
            UI_add_answer("Lord");
        }
        else if (response == "Lord")
        {
            say("@Those whom the Hammer of Dedication is passed onto becomes the Lord of this realm. The hammer is the only reason we do not slay the likes of you on sight.@");
            UI_remove_answer("Lord");
            UI_add_answer("Hammer");
        }
        else if (response == "Hammer")
        {
            say("@The Hammer of Dedication was forged many moons ago by those of your realm. It was gifted upon our Lord by the first of your kind to enter our realm as an offering of peace. Since then we have tolerated the likes of you in our realm.@");
            say("@But that is not to say we all believe it should remain that way.@");
            UI_remove_answer("Hammer");
            UI_add_answer("Believe");
        }
        else if (response == "Believe")
        {
            say("@Many do not believe we should tolerate the likes of you and should cut you down on sight. I happen to be one of them... tis only your luck that our Lord still believes we should tolerate your kind.@");
            UI_remove_answer("Believe");
        }
        else if (response == "Ore")
        {
            say("@I will not aid you in stealing from our realm. I do hope that as you search it out that our native beasts slay you.@");
            UI_remove_answer("Ore");
        }

		}
	UI_remove_npc_face(item);
	}
}
