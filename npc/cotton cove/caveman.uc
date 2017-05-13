/*

Man in the cave before the harpy in Cotton Cove

*/


void Caveman object#(0x46b) ()
	{

var bark = "Why do you approach me?";
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
				UI_item_say(item, "My queen...");
			else if (n == 2)
				UI_item_say(item, "Of course my precious...");
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
        call Caveman, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
		

if (UI_is_dead(-101)) // if the harpy is dead
{
    UI_show_npc_face(item);
    say("@No, my queen. My queen has fallen! You have slain the queen! My poor queen! I shall avenge you my queen!@");
    AttackAvatar();

}
else
{
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

        UI_show_npc_face(item);

if (UI_get_item_flag(item, MET))
	{
		say("@Does the queen deem you worthy?@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Oh look my queen another minion for you!@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

converse
{
    if (response == "Bye")
    {
        say("@The queen must be beckoning you. Go to the queen.@");
        break;
    }
    else if (response == "Name")
    {
        say("@Name? Name? The queen does not need a name for me. I am her noblest of subjects. Yes, I love the queen.@");
		UI_remove_answer("Name");
    }
    else if (response == "Job")
    {
        say("@To serve the queen! I must serve the queen.@");
        UI_remove_answer("Job");
        UI_add_answer("Queen");
    }
    else if (response == "Queen")
    {
        say("@The queen is so pretty and alluring. She is the perfect queen. Yes, I love the queen.@");
        UI_remove_answer("Queen");
        UI_add_answer("Where is the queen?");
    }
    else if (response == "Where is the queen?")
    {
        say("@The queen is in the next room. Yes. Go bow before our queen. Our queen is so lovely, is she not?@");
        UI_remove_answer("Where is the queen?");
    }
}
}


	
	UI_remove_npc_face(item);
}
	}

