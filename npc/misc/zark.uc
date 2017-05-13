/*
Zark the troll on the little island
*/

void NametoZark()
{
    UI_push_answers();
    UI_add_answer("Avatar");
    UI_add_answer("Your worst nightmare");
    UI_add_answer("I'm the Postman");
    
    converse
    {
        if (response == "Avatar")
        {
            say("@Me'z not heard of you.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Your worst nightmare")
        {
            say("@You is puny. You not scare Zark!");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "I'm the Postman")
        {
            say("@You be nothing but a drifter whos found a bag of mail!");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Zark object#(0x4ca) ()
	{

var ham = UI_count_objects(PARTY, 377, ANY, 11); // Ham

var bark = "Hullos human";
var bark_intro = "Troll";

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
				UI_item_say(item, "Zug zug");
			else if (n == 2)
				UI_item_say(item, "Gloooduk");
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
        call Zark, TALK;
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
		say("@Wut you want with Zark?@");
		UI_remove_answer("Name");

	}
else
	{

		say("@Wut do you want? Me means no harm.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


    converse
    {
        if (response == "Bye")
        {
            say("@Buhbye.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Me Zark! Who you be?@");
            NametoZark();
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@Troll not have job. Troll smash!@");
            UI_remove_answer("Job");
            UI_add_answer("Smash");
        }
        else if (response == "Smash")
        {
            say("@Me use club to smash. Me smash lots! Me not smash you!@");
            UI_remove_answer("Smash");
            UI_add_answer("Why not?");
        }
        else if (response == "Why not?")
        {
            say("@You's smell nice. Me sick of smell of fish you nice to smell.@");
            UI_remove_answer("Why not?");
            UI_add_answer("Fish");
        }
        else if (response == "Fish")
        {
            say("@Me here long time. Me eat lots of fish. Me sick of fish. Me would give shineys for piece of ham.@");
            UI_remove_answer("Fish");
            if (ham > 0)
            {
                UI_add_answer("I will give you ham");
            }
        }
        else if (response == "I will give you ham")
        {
            say("@You make me happy! Me glad I not smash you. Thanks you for ham! Here is some shinies.@");
            UI_remove_answer("I will give you ham");
            UI_remove_party_items(1, 377, ANY, 11);
            var rangold = UI_die_roll(9, 37);
            UI_add_party_items(rangold, SHAPE_GOLD, ANY, ANY);
        }
}
	UI_remove_npc_face(item);
	}
}
