/*
Karma Troll for the good karma test
*/

void KarmaTroll6()
{
    UI_push_answers();
    UI_add_answer("Quite a story for a dumb troll. Die!");
    UI_add_answer("It is unfortunate. I believe you.");

    converse
    {
        if (response == "Quite a story for a dumb troll. Die!")
        {
            say("@No it truth!@");
            gflags[KARMA_TROLL_KILL] = true;
            karma = 5000;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "It is unfortunate. I believe you.")
        {
            say("@You nice to listen to me instead of kill. Me hope that mother of child will understand as you have.@");
            say("@Me have key to back door in here but me never use it. You can have. Me thank you for listening!@");
            UI_add_party_items(1, KEY, 15, 6);
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void KarmaTroll5()
{
    UI_push_answers();
    UI_add_answer("So you slew him as well! Die!");
    UI_add_answer("Man?");

    converse
    {
        if (response == "So you slew him as well! Die!")
        {
            say("@No me not do that!");
            gflags[KARMA_TROLL_KILL] = true;
            karma = 5000;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Man?")
        {
            say("@Man scream about me killing child and attack me. Me had to fight man. Me not mean to kill him. Me feel bad.@");
            KarmaTroll6();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void KarmaTroll4()
{
    UI_push_answers();
    UI_add_answer("Your home to eat no doubt! Die!");
    UI_add_answer("Why not?");

    converse
    {
        if (response == "Your home to eat no doubt! Die!")
        {
            say("@No me not kill her! To her home!");
            gflags[KARMA_TROLL_KILL] = true;
            karma = 5000;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Why not?")
        {
            say("@Me tried to fight off blobs but they too much! Blobs attack child slay child than man show up. Man yell and scream at me.@");
            KarmaTroll5();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void KarmaTroll3()
{
    UI_push_answers();
    UI_add_answer("A good excuse! Die!");
    UI_add_answer("Blobs?");

    converse
    {
        if (response == "A good excuse! Die!")
        {
            say("@No me not kill her!@");
            gflags[KARMA_TROLL_KILL] = true;
            karma = 5000;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Blobs?")
        {
            say("@Blobs from swamp. Me saw child playing there when blobs attack. Me try to save so me could take home but me could not.@");
            KarmaTroll4();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void KarmaTroll2()
{
    UI_push_answers();
    UI_add_answer("Liar! Prepare to die!");
    UI_add_answer("No match?");

    converse
    {
        if (response == "Liar! Prepare to die!")
        {
            say("@No me not kill her! ");
            gflags[KARMA_TROLL_KILL] = true;
            karma = 5000;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No match?")
        {
            say("@Me could not stop blobs! I smack blob and two more show up! Me could not stop them.@");
            KarmaTroll3();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void KarmaTroll1()
{
    UI_push_answers();
    UI_add_answer("You killed her! Prepare to die!");
    UI_add_answer("Tried to save?");
    
    converse
    {
        if (response == "You killed her! Prepare to die!")
        {
            say("@No me not kill her!@");
            gflags[KARMA_TROLL_KILL] = true;
            karma = 5000;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Tried to save?")
        {
            say("@Me tried saver her but mez wuz no match.@");
            KarmaTroll2();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void KarmaTroll object#(0x4d2)()
{
var bark = "You be human";
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
				UI_item_say(item, "zug zug");
			else if (n == 2)
				UI_item_say(item, "Glooduk");
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
        call KarmaTroll, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Where is the child");
		UI_add_answer("Bye");

	say("@No hurt me!");


converse
{

    if(response == "Bye")
    {
        say("@Buh Bye.@");
        break;
    }
    else if (response == "Name")
    {
        say("@Me nots have name.@");
        UI_remove_answer("Name");
    }
    else if (response == "Job")
    {
        say("@Mes just tries to live here in peace.@");
        UI_remove_answer("Job");
    }
    else if (response == "Where is the child")
    {
        say("@Child is dead. Me tried to save her.@");
        KarmaTroll1();
        if(gflags[KARMA_TROLL_KILL])
        {
            AttackAvatar();
            break;
        }
        UI_remove_answer("Where is the child");

    }



}
UI_remove_npc_face(item);
}
}
