/*
Alastor of the demon realm
*/


void Alastor object#(0x45d) ()
	{

var bark = "Human";
var bark_intro = "Demon";
	
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
				UI_item_say(item, "Steady");
			else if (n == 2)
				UI_item_say(item, "Stand fast");
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
        call Alastor, TALK;
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
		say("@It is nice to see that you have not been slain.@");
		UI_remove_answer("Name");

	}
else
	{

		say("@I bid you welcome to our realm, human.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag



		converse
		{
        if (response == "Bye")
        {
            say("@Do not perish.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am Alastor.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am a protector of our Lord.@");
            UI_remove_answer("Job");
            UI_add_answer("Lord");
        }
        else if (response == "Lord")
        {
            say("@Those whom the Hammer of Dedication is passed onto becomes the Lord of this realm.@");
            UI_remove_answer("Lord");
            UI_add_answer("Hammer");
        }
        else if (response == "Hammer")
        {
            say("@The Hammer of Dedication was gifted upon us by your kind long ago. It is the reason that your race is tolerated in our realm.@");
            UI_remove_answer("Hammer");
        }
        else if (response == "Ore")
        {
            say("@You are not the first human to enter our realm in search of this ore. Thee will have to search it out yourself... but I do not wish you harm, so be prepared to combat the inhabitants of our realm, my type included.@");
            say("@Now go, It is only a matter of time before you succumb to the foes of my realm.@");
            break;
        }

		}
		}
	UI_remove_npc_face(item);
	}

