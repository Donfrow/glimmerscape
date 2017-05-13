/*

Naked Woman on South Island

*/

void NakedWoman object#(0x550) ()
	{

var bark = "Lighten up and embrace The Provider";
var bark_intro = "Cover your shame!";

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
				UI_item_say(item, "Teehee");
			else if (n == 2)
				UI_item_say(item, "I love The Provider");
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
        call NakedWoman, TALK;
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
	say("@Hello!@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to our paradise.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@May The Provider guide you.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I have no need for a name name when it is just my mate and I.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@To live free and have no worries.@");
			UI_remove_answer("Job");
			UI_add_answer("How do you survive?");
			}
		else if (response == "How do you survive?")
			{
			say("@The Provider provides my mate and I with everything we need.@");
			UI_remove_answer("How do you survive?");
			UI_add_answer("Provider");
			}
		else if (response == "Provider")
			{
			say("@The Provider is the greatest being in the land. He provides my mate and I with food and shelter in return for sacrifice.@");
			UI_remove_answer("Provider");
			UI_add_answer("Sacrifice");

			}
		else if (response == "Sacrifice")
			{
			say("@All the Provider asks in return is obedience. As long as we live by the Provider's rules we are safe and content.@");
			say("@But there are many bad people who do not do not obey the Provider.@");
			UI_remove_answer("Sacrifice");
			UI_add_answer("Bad people");
			}
		else if (response == "Bad people")
		{
			say("@Many people try to take what the Provider gives us but the Provider takes care of them.@");
			say("@We know the Provider has deemed someone as bad when they enter the cave and do not return. Thus is the Provider's will.@");
			UI_remove_answer("Bad people");
		}
		

		}
	UI_remove_npc_face(item);
	}
}
