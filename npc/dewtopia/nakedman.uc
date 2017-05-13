/*

Naked Man on South Island

*/

void NakedMan object#(0x551) ()
	{

var bark = "Hello to you!";
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
				UI_item_say(item, "I love The Provider");
			else if (n == 2)
				UI_item_say(item, "Bless The Provider");
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
        call NakedMan, TALK;
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
	say("@Have you found The Provider in your heart yet?@");
	UI_remove_answer("Name");
	}
else
	{
	say("W@elcome to our home.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@May the provider guide you.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I have no name. My mate and I are content with how it is.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@To live free and praise The Provider.@");
			UI_remove_answer("Job");
			UI_add_answer("Provider");
			}

		else if (response == "Provider")
			{
			say("@The Provider protects my mate and I from the brutes of the land and provide us with everything we desire.@");
			say("@In return we both rever and worship The Provider's greatness.@");
			UI_remove_answer("Provider");
			UI_add_answer("Greatness");

			}
		else if (response == "Greatness")
			{
			say("@The Provider doth strike down pirates and unsavoury characters to protect us. You best not attempt to harm us or remove anything from our island.@");
			say("@Such a thing would upset The Provider.@");
			UI_remove_answer("Greatness");
			UI_add_answer("Upset");
			}
		else if (response == "Upset")
			{
			say("@You would not like The Provider when upset. Pirates upset The Provider the most. They take what he provides for us and they suffer the wrath.@");
			UI_remove_answer("Upset");
			}
		

		}
	UI_remove_npc_face(item);
	}
}
