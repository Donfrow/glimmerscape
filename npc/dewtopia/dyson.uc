/*

Dyson in Dewtopia

*/


void Dyson object#(0x40c) ()
	{

var bot_log = UI_count_objects(AVATAR, GOOD_SCROLL, 59, ANY);

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
				UI_item_say(item, "Incredible");
			else if (n == 2)
				UI_item_say(item, "I do not know how much longer I cna hold this");
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
        call Dyson, TALK;
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
	say("@Hello.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to my world of knowledge.@");
	UI_set_item_flag(item, MET, true);
	}

// Logs from broken automaton

if (gflags[TALK_TO_DYSON] && bot_log >0)
	{
	UI_add_answer("Bot Log");
	}




		converse
		{
	if (response == "Bye")
			{
			say("@Remember to seek knowledge.@");
			break;
			}
		else if (response == "Name")
			{
			say("@My name is Miles Bennett Dyson. You may call me Dyson.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I create and repair the robotic life which Dewtopia uses.@");
			UI_remove_answer("Job");
			UI_add_answer("Robotic Life");
			}

		else if (response == "Robotic Life")
			{
			say("@I gained the knowledge of robotic life from a partially broken item known as a 'chip'. It highly advanced and I do not know where it came from.@");
			say("@However, if you have ever entered the Sugar Caves you will have seen some of my creations that the 'chip' helped inspire. They are referred to as Prison Bots there.@");
			say("@My also have my newest, most advanced creation in my laboratory.@");
			UI_remove_answer("Robotic Life");
			UI_add_answer("Laboratory");
			UI_add_answer("Newest Creation");
			}
		else if (response == "Laboratory")
			{
			say("@The greatest advancements in this technology come from my laboratory.@");
			UI_remove_answer("Laboratory");
			}
		else if (response == "Newest Creation")
			{
			say("@My newest creation is the most advanced form of robotics yet created in these lands. At the moment it is merely a shell with only the most basic programming.@");
			say("@If you desire you feel free to interact with it.@");

			UI_remove_answer("Newest Creation");

			}
		else if (response == "Bot Log")
			{
			say("@I see you have discovered the log of the missing prison bot. If you will just let me see it I will examine it.@");

		UI_remove_npc_face(item);
		UI_show_npc_face(648, 0);

			say("@You hand Dyson the log as he inspects his hand visibly shakes. While reviewing it he nods several times before returning his attention to you.@");

UI_show_npc_face(item);
	
			say("@It appears that the prison bot experienced some damage during a cave in. It was damaged in such a way that those sentenced to the caves were able to overpower it.@");
			say("@If you will give me the log I can use it for my later studies. After all, noone else needs to see these besides myself so I best just take it off your hands.@");
			gflags[TALK_TO_YESSERM] = true;
			UI_remove_answer("Bot Log");
			UI_add_answer("Give scroll");
			}

		else if (response == "Give scroll")	
			{
			say("@Thank you, this shall aid me in improving the prison bots.@");
			UI_remove_party_items(1, GOOD_SCROLL, 59, ANY); // removes the scroll

			UI_remove_answer("Give scroll");
			}
		

		}
	UI_remove_npc_face(item);
	}
	}
