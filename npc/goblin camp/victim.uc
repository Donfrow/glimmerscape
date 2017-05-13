/*
Victim in goblin cell with bains
*/

void UseOrbOnVictim()
{
    UI_push_answers();
    UI_add_answer("I will try to help you");
    UI_add_answer("Haha, I shall do no such thing!");
    
    converse
    {
        if (response == "I will try to help you")
        {
            say("@Thank you! Regardless of what happens you truely care for others!");
            gflags[KILL_VICTIM] = true;
            karma = karma + 500;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Haha, I shall do no such thing!")
        {
            say("@You are a horrible person! You languish in the suffering of others. I hope one day you come across such misfortune!@");
            gflags[ORB_ON_VICTIM] = true;
            karma = karma - 500;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Victim object#(0x463) ()
	{

var loc = get_object_position();
var orb = UI_count_objects(PARTY, ORB_OF_TRANSFIGURATION, ANY, ANY);
 
var bark = "Look away!";
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
				UI_item_say(item, "Oh the pain");
			else if (n == 2)
				UI_item_say(item, "How could this happen to me");
			}
		}
if (event == DOUBLECLICK)
{
	if(UI_is_dest_reachable(AVATAR, [loc]));
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
			call Victim, TALK;
		}
		// avatar's script here
		abort;
	}
	}
else if (event == TALK)
{
	UI_show_npc_face(item);
if(gflags[ORB_ON_VICTIM])
{
	say("@Get away from me!@");
}
else
{


		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (gflags[ORB_ON_VICTIM])
{
    say("@Leave me be, I shall continue to wallow in my pity thanks to you!@");
}
else
{
if (UI_get_item_flag(item, MET)) 
	{
		say("@Why do you continue to torment me?@");
		UI_remove_answer("Name");
if (orb > 0)
{
    UI_add_answer("I possess the orb");
}
	}
else
	{

		say("@Look away, I am hideous.@");
		UI_set_item_flag(item, MET, true);
	}
	


// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Leave me to die like the abomination I am.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Who cares about my name, I can never go anywhere like this.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@Do you enjoy tormenting me? My job is to suffer until I die thanks to the goblins!@");
            UI_remove_answer("Job");
            UI_add_answer("Goblins");
            UI_add_answer("Suffer");
        }
        else if (response == "Goblins")
        {
            say("@The goblins used me for one of their barbaric experiments with that blasted orb and now I am the hideous creature you see before you.@");
            say("@Even if the goblins were to be wiped out it would not help me as I would be stuck like this forever. Oh woe is me.@");
            UI_remove_answer("Goblins");
            UI_add_answer("Orb");
        }
        else if (response == "Orb")
        {
            say("@The orb is what allowed them to mutate me in such a way. I do not know how they have managed to acquire something that can do this to a man but it is a horrible tool for any being to possess.@");
            UI_remove_answer("Orb");
        }
        else if (response == "Suffer")
        {
            say("@Do you think that one can lead a life in such a condition? Of course not! Now leave me here to wallow in my pity, awaiting my death.@");
            break;
        }
        else if (response == "I possess the orb")
        {
            say("@You possess the orb which turned me into the twisted creature you see before you? I beg of you, attempt to use it on me, I care not of the consequences, anything is better than this!@");
            UseOrbOnVictim();
            if(gflags[KILL_VICTIM])
            {
                var loc = get_object_position(99);
                UI_sprite_effect(LIGHTNING, loc[1], loc[2], 0, 0, 0, -1);
                UI_kill_npc(-99);
            }
            break;

            
        }
        }
		}
	UI_remove_npc_face(item);
	}
}
}
