/*

Rufus the small - wannabe big shot in Dewtopia

*/

void Rufus object#(0x52d) ()
	{

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{		// Sleeping.
			UI_item_say(item, "Zzzz...");
			
			return;
			}
		var n = UI_get_random(2);// 1-2.
		if (inParty(-301))
		{
        }
        else
        {
		if (n == 1)
			UI_item_say(item, "I am mighty!");
		else if (n == 2)
			UI_item_say(item, "I am not small!");
		return;
        }
		}

	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (UI_get_item_flag(item, MET)) 
	{
	say("@Well met fellow warrior!@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Halt - What do you wish of me?@");
	UI_set_item_flag(item, MET, true);
	}

if(gflags[RUFUS])
	{
	UI_add_answer("Rufus the Small");
	}
if (gflags[RUFUS_JOIN])
{
    UI_add_answer("Join");
        if (inParty(-301))
        {
        UI_add_answer("Leave");
        UI_remove_answer("Join");
        }
}

if (inParty(-301))
{

		converse
		{
    if (response == "Job")
    {
        say("@To aid you in your adventures of course!@");
        UI_remove_answer("Job");
    }
    else if (response == "Bye")
    {
        say("@Onward!@");
        break;
    }
    else if (response == "Leave")
    {
        say("@Your tasks will surely suffer without me. But it is your choice and I will not beg to stay.@");
        UI_remove_answer("Leave");
        UI_remove_from_party(-301);
    }
	       }
}

else
{
    converse
    {

		
	if (response == "Bye")
			{
			say("@Remember the day you met Rufus the Mighty!@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Rufus the Mighty!@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am training to be the greatest knight that Dewtopia has ever seen!@");
			UI_remove_answer("Job");
			UI_add_answer("Training");
			UI_add_answer("Greatest knight");
			}
		else if (response == "Training")
			{
			say("@I am under the tutalige of Hectar, one of the strongest knights in Dewtopia.@");
			say("@One day I will even be greater than he in the field of battle.@");
			UI_remove_answer("Training");
			UI_add_answer("Hectar");
			}
		else if (response == "Hectar")
			{
			say("@He is the Head Guard and trainer of Dewtopia. He is a fine warrior and an excellent teacher.@");
			UI_remove_answer("Hectar");
			}
		else if (response == "Greatest knight")
			{
			say("@I am merely a trainee now but soon I will not only be the greatest knight in Dewtopia, but the greatest knight of all the lands!@");
			say("@You should remember this day so that you can say you knew me before I was famous.@");
			UI_remove_answer("Greatest knight");
			}
		else if (response == "Rufus the Small")
			{
			say("@You have heard people call me by that name? Some folks delude themselves of my future greatness and my small stature.@");
			say("@Those who dare call me that are lucky that I even bother to protect them from the Bandits and Goblins that raid them so often!@");
			UI_remove_answer("Rufus the Small");
			UI_add_answer("Goblins");
			UI_add_answer("Bandits");
			}
		else if (response == "Goblins")
			{
			say("@I occasionally protect those outside the walls from the green skinned menace. They are so daft that they continue to attack Dewtopia despite my presence.@");
			UI_remove_answer("Goblins");
			}
		else if (response == "Bandits")
			{
			say("@They are so fearful when I am around that they lurk in the shadows and will not show themselves!@");
			say("@It is a shame for my blade could use some of their blood to colour it.@");
			UI_remove_answer("Bandits");
			}
        else if (response == "Join")
        {
            say("@It is about time Hectar set a task worthy of my might! Lead on!@");
            UI_add_to_party(-301);
            UI_remove_answer("Join");
        }
    }
		}
	UI_remove_npc_face(item);
	}
