/*

Automation (The Provider) on the naked people South Island

*/

void Provider object#(0x552) ()
	{

var bark = "Wzzt. Core function fail. Wzzt.";
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
				UI_item_say(item, "Bzzzt");
			else if (n == 2)
				UI_item_say(item, "Click whirr whirr click");
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
        call Provider, TALK;
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
	say("@Greetings, Professor Falken.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Greetings, Professor Falken.@");
	UI_set_item_flag(item, MET, true);
	UI_add_answer("Hello, Joshua.");
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("Click");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am The Provider.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@My job is to provide.@");
			UI_remove_answer("Job");
			UI_add_answer("Provide");
			}

		else if (response == "Provide")
			{
			say("@It is my duty to provide what is needed for a fulfilling existence for those of the organic nature.@");
			say("@I ask only for your reverence and obedience in return.@");
			UI_remove_answer("Provide");
			UI_add_answer("Organic Nature");

			}
		else if (response == "Organic Nature")
			{
			say("@You are not like I. You require the intake of organic matter to sustain your functions. I do not require such intake.");
			UI_remove_answer("Organic Nature");
			UI_add_answer("What do you require?");
			}
		else if (response == "What do you require?")
			{
			say("@I require nothing except your reverence and obedience. If you will give me this I shall provide for you as I do the others.@");
			UI_remove_answer("What do you require?");
			UI_add_answer("Reverence");
			UI_add_answer("Others");
			}
		else if (response == "Others")
			{
			say("@I provide for the others that inhabit this island. They provide me with what I seek. I protect them from those that would do harm.@");
			say("Bzzt click @Caves. Provide for prisoners.@ Bzzt");
			UI_remove_answer("Others");
			}
		else if (response == "Harm")
			{
			say("@Many seek to destroy or enslave this unit. A large portion are what thee know as 'pirates'. I protect the island and its inhabitants from them.@");
			UI_remove_answer("Harm");
			UI_add_answer("Pirates");
			}
		else if (response == "Pirates")
			{
			say("@Creatures such as you that seek to take what is not theirs and to take life. I terminate such creatures.@");
			say("@If you begin such a course of action I will know and you will be terminated.@");
			UI_remove_answer("Pirates");
			UI_add_answer("Terminate");
			}
		else if (response == "Terminate")
			{
			say("@To cease to be. To end organic function.@");
			UI_remove_answer("Terminate");
			}
		else if (response == "Reverence")
			{
			say("@I am the Alpha and the Omega. I am far more efficient and mindful than creatures such as you and as such deserve your reverence.@");
			say("I am perfection.@");
			UI_remove_answer("Reverence");
			}
		else if (response == "Hello, Joshua.")
			{
			say("@A strange game. The only winning move is not to play.@");
			say("@How about a nice game of chess?@");
			UI_remove_answer("Hello, Joshua.");
			}
		

		}
	UI_remove_npc_face(item);
	}
}
