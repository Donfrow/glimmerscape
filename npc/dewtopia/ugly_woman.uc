/*
Ugly woman in jail
*/

void Prisoner object#(0x4f4) ()
	{
var bark = "I am so hungry";
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
				UI_item_say(item, "So hungry");
			else if (n == 2)
				UI_item_say(item, "So thirsty");
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
        call Prisoner, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

if (gflags[FED_BEGGER])
	{
	UI_show_npc_face(item);
	say("@Thank you for your kindness@");
	say("@Will you give me more food?@");
	UI_add_answer("Yes");
	UI_add_answer("No");
	converse
	{
	if (response == "Yes")
			{
			say("@Thank you once again. Truely you a kind soul.@");
				
			break;
			}
		else if (response == "No")
			{
			say("@Well you did what you could.@");
			break;
			}
	}
	UI_remove_npc_face(item);
	}
	
else
	{
	UI_show_npc_face(item);
	say("@Help me...@");
	
		UI_add_answer("Help");
		UI_add_answer("Bye");

		converse
		{
	if (response == "Bye")
			{
			say("@Please... help...@");

			break;
			}
		else if (response == "Help")
			{
			say("@I need food... others keep taking it... will you give me food.. I beg of you...@");
			UI_remove_answer("Help");
			UI_add_answer("Yes");
			UI_add_answer("No");
			}
		else if (response == "Yes")
			{
			say("@Thank you... maybe I shall live another day...@");
			UI_remove_answer("Yes");
			UI_remove_answer("No");
			karma = karma + 50;
			gflags[FED_BEGGER] = true;
			break;
			}
		else if (response == "No")
			{
			say("@I will starve thanks to you.@");
			UI_remove_npc_face(item);
			karma = karma - 50;
			UI_item_say(item, "Gaaaaaack");
			UI_kill_npc(-244);
			break;
			}

		}
	UI_remove_npc_face(item);
	}
	}
}
