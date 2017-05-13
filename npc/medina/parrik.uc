/*
Parrik the mayor of Medina
*/

void KillGuild()
{
    UI_push_answers();
    UI_add_answer("Yes, of course!");
    UI_add_answer("No");
    
    converse
    {
        if (response == "Yes, of course!")
        {
            say("@Perhaps hope is not lost for all those who join the Nautical Guild...@");
            say("@If you were to kill Vannel it will help to put that organization into shambles. Do so and I shall reward you handsomely.@");
            gflags[KILL_VANNEL] = true;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("@No, no of course you would not understand as a member of that accursed guild. But surely you will let my plan be known... and I cannot allow that to happen.@");
			gflags[PARRIK_ATTACK] = true;
            AttackAvatar();
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Parrik object#(0x4bd) ()
	{

var bark = "What can I do for you?";
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
				UI_item_say(item, "Interesting");
			else if (n == 2)
				UI_item_say(item, "I hate the sea and everything in it");
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
        call Parrik, TALK;
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
		say("@What brings you back?");
		UI_remove_answer("Name");
	}
else
	{

		say("@I do hope that you have made an appointment. I am a busy man.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if (gflags[BAD_MAYOR]);
{
    if (gflags[KILL_VANNEL]) // If you agree to kill nautical guild leader
    {
        if (gflags[KILL_VANNEL] && UI_is_dead(-142))
        {
            UI_add_answer("Vannel is slain");
        }
    }
    else
    {
    UI_add_answer("Traitor!");
    }
}

		converse
		{
        if (response == "Bye")
        {
            say("@Thank you. I may now end this conversation and get back to work.@");
            break;
        }
        else if (response == "Name")
        {
            say("@As you do not know I am Parrik it is clear that you art not a native of this island.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@The questions of outsiders amuses me. I am the mayor of Medina.@");
            UI_remove_answer("Job");
            UI_add_answer("Mayor");
            UI_add_answer("Medina");
        }
        else if (response == "Mayor")
        {
            say("@Yes, mayor. You know, I run the city in a political sense ensuring that things are running smoothly. At times it amazes me the simplicity of some of this lands inhabitants.@");
            UI_remove_answer("Mayor");
        }
        else if (response == "Medina")
        {
            say("@Medina is essentially a town of sailors since it is the Nautical Guilds headquarters.@");
			say("@It has been rather busy lately as the lack of sailing has left sailors wandering around town trying to pass the time until they can get back to sea.@");
            say("@It is also close to the home of a colony of ratmen within the mountain range.@");
            UI_remove_answer("Medina");
            UI_add_answer("Nautical Guild");
            UI_add_answer("Sailors");
            UI_add_answer("Ratmen");
        }
        else if (response == "Nautical Guild")
        {
            say("@Although I have better things to do than chat with you I will indulge you with this. The Nautical Guild is the coalition of sailors which controls the shipping and trade routes by sea.@");
            UI_remove_answer("Nautical Guild");
        }
        else if (response == "Sailors")
        {
            if (gflags[LECHUCK_DEAD])
            {
                say("@With the boycott of sailing no longer in place by the Nautical Guild the sailors can once again take to the seas. It has been far too long since they have been wandering Medina and I will not be sad to see them set sail again.@");
            }
            else
            {
            say("@With the Nautical Guilds refusal to sail the sailors have nothing better to do but wander the city. It is very bothersom as bored men and women tend to cause trouble.@");
			say("@Being the mayor complaints about their exploits to pass the time eventually end up on my desk. I cannot wait for this foolish boycott to be over.@");
            say("@Hopefully with the boycott over the sailors will quickly get back into the sea and take all the garbage they leave with them.@");
            }
            UI_remove_answer("Sailors");
        }
        else if (response == "Ratmen")
        {
            say("@Disgusting and filthy creatures the ratmen are. I would put an order out to exterminate the lot of them but the Nautical Guild is against it.@");
            UI_remove_answer("Ratmen");
            UI_add_answer("Against it");
        }
        else if (response == "Against it")
        {
            say("@They are of the belief that since the ratmen do not bother us we should leave them be in their mountain.@");
			say("@If you ask me it is only a matter of time until they bring their filth and disease to the town, having been attracted by the garbage the sailors leave around.@");
            UI_remove_answer("Against it");
        }
        else if (response == "Traitor!")
        {
            if (gflags[LECHUCK_DEAD])
            {
                say("@With LeChuck's untimely passing it was only a matter of time until some 'hero' would discover the plot... but you would understand if you ran the city! I could reward you well if you would... aid me. Do you agree?");
                KillGuild();
            }
            else
            {
            say("@What! How did you find out about this? If you ran this town you too would understand why the Nautical Guild needs to be ousted! But perhaps you do understand.@");
			say("@Do you understand why the Nautical Guild must be destroyed?@");
            KillGuild();
				if(gflags[PARRIK_ATTACK])
				{
					break;
				}
            }
            UI_remove_answer("Traitor!");
        }
        else if (response == "Vannel is slain")
        {
            say("@Very good... you have helped greatly. But you were foolish to have trusted me. If I was willing to sell out the town to LeChuck why would I not do the same to you? No matter, you hast been most useful.@");
            karma = karma-500;
            AttackAvatar();
            break;
        }


		}
	UI_remove_npc_face(item);
	}
}
