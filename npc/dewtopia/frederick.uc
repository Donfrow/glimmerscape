/* Frederick in Dewtopian Jail
*/

void Frederick object#(0x4f2) ()
{
var bark = "Care to let me out?";
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
				UI_item_say(item, "I am innocent");
			else if (n == 2)
				UI_item_say(item, "Anyone? Anyone?");
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
        call Frederick, TALK;
    }
    // avatar's script here
    abort;
}

else if (event == TALK)
{

if (gflags[ACCUSED])
	{
	UI_show_npc_face(item);
	say("How novel, a talking lump of refuse!");

	}
else
{
UI_show_npc_face(item);
if (UI_get_item_flag(item, MET)) 
	{
	say("Have you won my freedom yet?");
	}
else
	{
	say("Help me! I've been falsely accused!");
	UI_set_item_flag(item, MET, true);
	}


UI_add_answer("Name");
UI_add_answer("Job");
UI_add_answer("Bye");	
UI_add_answer("Falsely accused?");
converse
	{
	if (response == "Bye")
			break;
		else if (response == "Name")
			{
			say("@I am Frederick, or Prisoner 45231 now.@");
			UI_remove_answer("Name");
			UI_add_answer("45231?");
			}
		else if (response == "45231?")
			{
			say("@It is the order in which they booked me.@");
			UI_remove_answer("45231?");
			}
		else if (response == "Job")
			{
			say("@Are you daft? Clearly I have no job if I am locked up in here!@");
			UI_remove_answer("Job");
			UI_add_answer("What was your job?");
			}
		else if (response == "What was your job?")
			{
			say("@I was a collector of exotic goods. I brought many a fine gem back from just outside the walls of this city.@");
			say("@Those goblins are richer than one would think.@");
			UI_remove_answer("What was your job?");
			}
		else if (response == "Falsely accused?")
			{
			say("@I am innocent! Never have I ever even stepped into the castle! How could I plan a heist without knowing the layout!@");
			UI_remove_answer("Falsely accused?");
			UI_add_answer("Who said anything about a heist?");
			UI_add_answer("Castle?");
			}
		else if (response == "Who said anything about a heist?")
			{
			say("@Erm, ahh, How's the weather out there?@");
			UI_remove_answer("Who said anything about a heist?");
			UI_add_answer("You are guilty!");
			}
		else if (response == "You are guilty!")
			{
			say("@You are dung!@");
			gflags[ACCUSED] = true;
			UI_remove_answer("and you are guilty!");
			break;
			}
		else if (response == "Castle?")
			{
			say("@It is where Lord Dew doth reside along with his current fling, but also home to much gold and many exotic goods...@");
			say("@Of course, they say it is impossible to steal from, but I am sure it is possible.@");
			UI_add_answer("Fling?");
			UI_remove_answer ("Castle?");
			}
		else if (response == "Fling?")
			{
			say("@Pretend you did not hear that. I do not want to lose my tongue as well!@");
			UI_remove_answer("Fling?");
			}
		}
	UI_remove_npc_face(item);
	}
}
}
