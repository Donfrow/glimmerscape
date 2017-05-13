/*

Dennen in the Northern forest NPC 351

*/



void Dennen object#(0x55c) ()
	{

var bark = "Well met";
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
				UI_item_say(item, "It is exhausting");
			else if (n == 2)
				UI_item_say(item, "Such is life");
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
        call Dennen, TALK;
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
	say("@I am glad to see you are still in one piece.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to our humble forest.@");
	UI_set_item_flag(item, MET, true);
	}



		converse
		{
	if (response == "Bye")
			{
			say("@It was a pleasure.@");
			break;
			}

		else if (response == "Name")
			{
			say("@I am Dennen, husband of Minerva.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am a lumberjack along with my wife here in the Northern Forest.@");
			UI_add_answer("Wife");
			UI_add_answer("Lumberjack");
			UI_remove_answer("Job");
			}
		else if (response == "Lumberjack")
			{
			say("@It is not an easy life but it lacks much of the drama and complications of the big cities. I would not trade it for anything.@");
			say("@The only complications that we experience here is the occasional bandit activity.@");
			UI_remove_answer("Lumberjack");
			UI_add_answer("Bandits");
			}
		else if (response == "Wife")
			{
			say("@Minerva is the love of my life. I do not know what would happen she were not with me.@");
			UI_remove_answer("Wife");
			}

		else if (response == "Bandits")
			{
			if (gflags[NORTHERN_BANDITS_DEAD])
				{
				say("@Minerva has told me that you had defeated the bandits which trouble this forest. You have put my mind at ease.@");
				UI_remove_answer("Bandits");
				}
			else
				{
				say("@I spit upon that plague of the forest. Although they leave us simple lumberjacks alone at the moment I fear that one day they will decide differently.@");
				UI_remove_answer("Bandits");
				}
			}

		}
	UI_remove_npc_face(item);
	}
	}
