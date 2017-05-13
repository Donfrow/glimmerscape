/*
Halinish the head bandit
*/


void Halinish object#(0x4a6) ()
	{

var bark = "Who are you!?";
var bark_intro = "Halt!";

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
				UI_item_say(item, "A blight is upon the lands and I am that blight");
			else if (n == 2)
				UI_item_say(item, "Excellent work");
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
        call Halinish, TALK;
    }
    // avatar's script here
    abort;
}

else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@How are you still alive?");
	}
else
	{

	say("@Who are you? No matter, it is time for you to be slain.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag






		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Enjoy what is left of your life.@");
            AttackAvatar();			
			UI_set_schedule_type(-164, IN_COMBAT);
			UI_set_opponent(-164, PARTY);
			UI_set_alignment(-164, HOSTILE);
			break;
			}
		else if (response == "Name")
			{
			say("@Ha! Noone would know of me except those closest to me. I shall let you know I am Halinish, as I prefer to have my victims know who they will be slain by.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the leader of the Desporia bandits. How you have gotten so deep in my headquarters I do not know. Fear not for you will not have to make the trip back out.@");
			say("@As you will be dead.@");
			UI_remove_answer("Job");
			UI_add_answer("Desporia bandits");
			}
		else if (response == "Desporia bandits")
		{
            say("@The Northern Bandits, the Plains Bandits, and the Eastern Bandits. Did you think to them to be seperate entities? No, of course not. They are all controlled from here, by me!@");
            UI_remove_answer("Desporia bandits");
            UI_add_answer("Controlled");
        }
        else if (response == "Controlled")
        {
            say("@Such a syndicate could not last without the disciplined control which I provide. Without me, noone would quiver in their boots, but with me we are feared throughout the lands.@");
            UI_remove_answer("Controlled");
            UI_add_answer("I will slay you!");
        }
        else if (response =="I will slay you!")
        {
            say("@I very much doubt that, but we shall see!@");
            AttackAvatar();
			UI_set_schedule_type(-164, IN_COMBAT);
			UI_set_opponent(-164, PARTY);
			UI_set_alignment(-164, HOSTILE);
            break;
        }



		}
	UI_remove_npc_face(item);
	}
}
