/*
Burglemagoo the goblin in souther mountains
*/

void Burglemagoo object#(0x580) ()
	{

var bark = "Prulamun";
var bark_intro = "Goblin";

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
				UI_item_say(item, "Groshbrog Lord Nagafen!");
			else if (n == 2)
				UI_item_say(item, "Burlamug Nugran!");
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
        call Burglemagoo, TALK;
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
		say("The goblins wounds still appear as if they were fresh. @Greet nosh, Human.@");
		UI_remove_answer("Name");

	}
else
	{
		say("The goblin before you appears scarred and burnt but attempts to speak to you in your own tongue. @Meetings to you.@");

		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


    converse
    {
        if (response == "Bye")
        {
            say("@Gribblegob.@");
            break;
        }
        else if (response == "Name")
        {
            say("The goblin winces, clearly in pain, as he speaks to you. @Burglemagoo.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("The goblin points to his injuries. @Burglemagoo rest.@");
            UI_remove_answer("Job");
            UI_add_answer("Rest");
            UI_add_answer("Injuries");
        }
        else if (response == "Rest")
        {
            say("A green hand waves to the pelts around you. @Much hurt. Must rest. Recover for fight again.@");
            UI_remove_answer("Rest");
            UI_add_answer("Fight");
        }
        else if (response == "Fight")
        {
            say("Burglemoo cringes. @Big beast. Goblins fight. Graplinosh and Burglemagoo only survive.@");
            UI_remove_answer("Fight");
            UI_add_answer("Big beast");
            UI_add_answer("Graplinosh");
        }
        else if (response == "Big beast")
        {
			say("A pause fills the conversation as the goblin tries to think of the world. @You call dragon.@");
			UI_remove_answer("Big beast");
			UI_add_answer("Dragon");
        }
        else if (response == "Dragon")
        {
			say("@Red dragon beast live in cave. Lord Nagafen feed on goblins.@");
			UI_remove_answer("Dragon");
        }
        else if (response == "Graplinosh")
        {
			say("@Graplinosh new king. Lord Nagafen have goblin crown. Sad for Graplinosh.@");
			UI_remove_answer("Graplinosh");
			UI_add_answer("Goblin crown");
        }
        else if (response == "Goblin crown")
        {
			say("@Graplinosh not fully king without crown. Speak to Graplinosh.@");
			UI_remove_answer("Goblin crown");
        }
        else if (response == "Injuries")
        {
			say("As the creature speaks you can clearly tell it winces in pain. @Big beast burn Burglemagoo.@");
			UI_remove_answer("Injuries");
			UI_add_answer("Big beast");
        }
}
	UI_remove_npc_face(item);
	}
}
