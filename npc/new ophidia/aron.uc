//Vanessa guard 1 in Cambray

void Aron object#(0x575) ()
	{
	
var bark = "Hello";
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
				UI_item_say(item, "Warm your bones at the House of Warmth");
			else if (n == 2)
				UI_item_say(item, "A cold chill is in the air");
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
        call Aron, TALK;
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
		say("@You still look quite cold. Perhaps I could interest you in a visit to the House of Warmth?@");
		UI_remove_answer("Name");
	}
else
	{

	say("@You certainly look chilled.@");
	UI_set_item_flag(item, MET, true);

	}

converse
    {
        if(response == "Bye")
        {
            say("@Do come back sometime.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Straight to business with you I see! The names Aron.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("A giant smile appears. @I run the House of Warmth here in New Ophidia.@");
            UI_remove_answer("Job");
            UI_add_answer("House of Warmth");
            UI_add_answer("New Ophidia");
        }
        else if (response == "House of Warmth")
        {
            say("@It is quite chilly here in New Ophidia and at times it can be nice to relax as if we were in the more tropical regions. The House of Warmth fulfills that desire.@");
            say("@As much as one can in this cold climate anyway.@");
            UI_remove_answer("House of Warmth");
        }
        else if (response == "New Ophidia")
        {
            say("@This town, though I would rather call it a settlement, rests on the great icy plains near where the Ophidian Empire used to be.@");
            UI_remove_answer("New Ophidia");
            UI_add_answer("Ophidian Empire");
        }
        else if (response == "Ophidian Empire")
        {
            say("@What do I look like to you, a history teacher? Go read a book if you want to learn about the Ophidian Empire.@");
            UI_remove_answer("Ophidian Empire");
        }


    }

}
		
UI_remove_npc_face(item);	
}

