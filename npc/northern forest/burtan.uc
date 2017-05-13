/*

Burtan at The Logger's Stump

*/


void Burtan object#(0x557) ()
	{

var bark = "Greetings";
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
				UI_item_say(item, "A lovely day");
			else if (n == 2)
				UI_item_say(item, "The peace is wonderful");
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
        call Burtan, TALK;
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
	say("@The Logger's Stump welcomes you back.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@You has chosen a fine place to rest milord.@");
	UI_set_item_flag(item, MET, true);
	}

// Jesse Bains escapee quest

if (gflags[READ_INN_LOG] && gflags[READ_JAIL_BREAK_BOOK])
	{
	UI_add_answer("Jesse and Bains");
	}

LookForArtemis();


		converse
		{
	if (response == "Bye")
			{
			say("@Be wary of bandits.@");
			break;
			}
		else if (response == "Job")
			{
			say("@I am the propreitor of The Logger's Stump Inn.@");
			UI_add_answer("The Logger's Stump");
			UI_remove_answer("Job");
			}
		else if (response == "Name")
			{
			say("@My full name is Burtanoloinomoniuc. But you may call me Burtan.@");
			UI_remove_answer("Name");
			}
		else if (response == "The Logger's Stump")
			{
			say("@It is the inn you are in here in the northern forest. It is where travelling loggers and fur traders can rest their weary legs without fear of bandits.@");
			UI_remove_answer("The Logger's Stump");
			UI_add_answer("Bandits");
			}
		else if (response == "Bandits")
			{
			say("@A group of ruffians known as the Northern Bandits robs weary travellers in this very forest.@");
			say("@Do not worry about them if you decide to stay here though. My wife, son and I will protect you as you rest.@");
			UI_remove_answer("Bandits");
			}
		else if (response == "Jesse and Bains")
			{
			say("@Aye, they did stay here recently. They were rather unsavory if you ask me but they did pay promptly and tip well.@");

			UI_remove_answer("Jesse and Bains");
			UI_add_answer("Where did they go");
			}
		else if (response == "Where did they go")
			{
			say("@I am unsure where those two did go after they left here. Perhaps Wendy heard something. You should ask her.@");
			UI_remove_answer("Where did they go");
		
			// To ask Wendy where Jesse and Bains went

			gflags[ASK_WENDY] = true;
			}

		else if (response == "Artemis Batbane")
			{
			say("@Yes, a fellow by that name did stay here some time ago. I believe he left to return home. You should check the registry as I cannot remember where he was from off the top of my head.@");
			UI_remove_answer("Artemis Batbane");
			}
		

		}
	UI_remove_npc_face(item);
	}
	}
