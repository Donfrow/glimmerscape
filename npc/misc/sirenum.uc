//Sirenum the glutton's wench who you can free for a reward

void Sirenum object#(0x48a) ()
	{

	
var bark = "Hello";
var bark_intro = "Hail";
	
	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
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
        call Sirenum, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");

if (gflags[SIRENUM_FREE]) // Freed Sirenum after drugging Toban
{

UI_show_npc_face(632, 1);
	
if (UI_get_item_flag(item, MET))
	{
		say("@I cannot possibly thank you enough for freeing me from Toban.@");
		UI_remove_answer("Name");
	}
else
	{

	say("A beautiful woman peers at you. @Thank you for freeing my from Toban.@");
	UI_set_item_flag(item, MET, true);
	}

    converse
    {
        if(response == "Bye")
        {
            say("A pleasent smile waves you goodbye. @Goodbye and safe journies.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am Sirenum.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("A bright smile appears. @Now that I am no longer bound to Toban I can do what I desire and what I desire is to spend my days with Melose.@");
            UI_remove_answer("Job");
            UI_add_answer("Melose");
        }
        else if (response == "Melose")
        {
            say("The woman swoons. @He is not like any other man which I have ever met. Strong yet caring and gentle. I could lay in his arms for hours.@");
            UI_remove_answer("Melose");
        }
        
    }

}
else
{

if(gflags[FREE_SIRENUM])
{
    UI_add_answer("Drug Toban");
}

UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@What is it you desire?@");
		UI_remove_answer("Name");
	}
else
	{

	say("A beautiful yet worn woman peers at you. @Welcome to Toban's paradise.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("It almost seems as if the woman is staring through you. @Goodbye.@");			
			break;
			}
		else if (response == "Name")
			{
			say("@My name would be Sirenum.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@My sole purpose in life is to pleasure Toban or those he directs me to serve.@");
            UI_remove_answer("Job");
            UI_add_answer("Serve");
            UI_add_answer("Toban");
        }
        else if (response == "Serve")
        {
            say("A tear escapes one of the womans eyes. @While I fan and feed Toban I mainly pleasure him physically. A disgusting existance but I have no choice.@");
            UI_remove_answer("Serve");
            UI_add_answer("No choice");
        }
        else if (response == "No choice")
        {
            say("The woman nearly begins to weep. @My parents were a gypsy and they tried to swindle Toban when I was younger. Unfortunately Toban found out and used some sort of magic I have never before heard of to enslave me as punishment.@");
            UI_remove_answer("No choice");
            UI_add_answer("Ancient magic");
        }
        else if (response == "Ancient magic")
        {
            say("The woman frowns @I believe that Toban doth not possess the ability to create such a powerful spell and that he must have gotten it some other way. Regardless unless he chooses to free me of his own free will I shall be stuck pleasuring him and his lot, forever kept away from my true love.@");
            UI_remove_answer("Ancient magic");
            UI_add_answer("Free will");
            UI_add_answer("True love");
        }
        else if (response == "Free will")
        {
            say("@I only know this as others have tried to free my from his clutches using force but it has been unsuccessful.@");
            UI_remove_answer("Free will");
        }
        else if (response == "True love")
        {
            say("Sirenum's eyes brighten at the mention of true love but the brightness quickly fades. @While I may be bound to Toban the adventurer Melose doth possess my heart.@");
            UI_remove_answer("True love");
            UI_add_answer("Melose");
        }
        else if (response == "Melose")
        {
            say("@Originally Toban did use my body as payment to Melose for wine which he provides but it was clear from the first moment he embraced me that he was unlike any other man I have ever seen.@");
            say("@While I may be stuck as Toban's unwilling servant my love is mine and only mine to give.@");
            UI_remove_answer("Melose");
        }
        else if (response == "Toban")
        {
            say("The woman whispers to you. @He is a fat, disgusting, vile man. If there were any justice in the world he would have been eaten by goblins years ago.@");
            UI_remove_answer("Toban");
        }
        else if (response == "Drug Toban")
        {
            say("The woman looks astonished upon learning that you wish to help free her from Toban and quickly whispers to you. @If you can get Toban to drink something which has been laced with something surely you can trick him into releasing me!@");
            say("@Perhaps an apothocary could help you with this.@");
            UI_remove_answer("Drug Toban");
        }

        }
} // end else bracket
		
	UI_remove_npc_face(item);
}	
	}

