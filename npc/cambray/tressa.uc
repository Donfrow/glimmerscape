//Tressa, great great granddaughter of Zarkane the mage in Cambray

void Tressa object#(0x56e) ()
	{
	
var bark = "Hello";
var bark_intro = "Hail";
	
	if (event == 0)
		{
		if(gflags[HYDRA_HYSTERIA])
		{
		}
		else
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
				UI_item_say(item, "A fine day for sailing");
			else if (n == 2)
				UI_item_say(item, "The skies are clear");
			}
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
        call Tressa, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

UI_show_npc_face(item);



if(gflags[ANGRY_TRESSA])  // spoke to tressa about controlling hydra
{
    if (gflags[NICE_TRESSA])
    {
        say("Tressa stares at you. @I know I should believe that you are a kind soul, but I cannot quite yet fully convince myself.@");
    }
    else
    {
    say("@Begone!@");
    }
}
else
{
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");

if(gflags[ZARKANE_DAUGHTER])
{
    UI_add_answer("Zarkane's daughter");

}



if (UI_get_item_flag(item, MET)) 
	{
		say("@Always a pleasure to see you.@");
		UI_remove_answer("Name");

	}
else
	{
	say("A beautiful woman looks at you. @Welcome to Cambray.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("Tressa sees you off with a cheery wave.");			
			break;
			}
		else if (response == "Name")
			{
			say("@You may call me Tressa Milton.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@I run the dock here in Cambray.@");
            UI_remove_answer("Job");
            UI_add_answer("Dock");
            UI_add_answer("Cambray");
        }
        else if (response == "Dock")
        {
            say("@My family has run the dock house for many generations. It is not a terribly exciting life but it has its moments.@");
            say("@Sadly, I also sometimes see the death and destruction brought about by the pirates.@");
            UI_remove_answer("Dock");
            UI_add_answer("Pirates");
        }
        else if (response == "Pirates")
        {
            if(gflags[LECHUCK_DEAD])
            {
                say("@The pirates were becoming quite the force to be reckoned with until their leader LeChuck was slain. Luckily the Nautical Guild found someone brave enough to slay him.@");
                say("@Hopefully tourism begins to pick up again now that sailing is safe.@");
                UI_add_answer("I killed LeChuck");
            }
            else
            {
                say("Tressa winces. @The pirates are usually rather uncoordinated but as of late they have been quite vicious and well composed.@");
                say("@It is so bad that even the Nautical Guild has refused to sail. It certainly puts a hamper on tourism to this fine island.@");
            }
            UI_remove_answer("Pirates");
            UI_add_answer("Nautical Guild");
        }
        else if (response == "I killed LeChuck")
        {
            say("Tressa gasps. @Amazing. I would never have thought you would be one to possess such abilities.@");
            UI_remove_answer("I killed LeChuck");
        }
        else if (response == "Nautical Guild")
        {
            say("@The Nautical Guild is a group which nearly all sailors and shippers join. There are many benefits to joining.@");
            UI_remove_answer("Nautical Guild");
			UI_add_answer("Benefits");
        }
		else if (response == "Benefits")
		{
			say("Tressa furrows her brow. @Do you not know these already? After all you a member.@");
			UI_remove_answer("Benefits");
			UI_add_answer("Member");
		}
		else if (response == "Member")
		{
			say("@I am aware that you were recently granted membership into the guild. You would be surprised at how quickly word manages to spread when a new member joins. @");
			UI_remove_answer("Member");
		}
        else if (response == "Cambray")
        {
            say("@Cambray is a fine island with several mountain ranges, as well as the location where Lady Elena's tomb resides.@");
            UI_remove_answer("Cambray");
            UI_add_answer("Lady Elena");
        }
        else if (response == "Lady Elena")
        {
            say("@Lady Elena was a brave warrior who put an end to an age of terror and fear. Olivia could tell you more about it.@");
            UI_remove_answer("Lady Elena");
			UI_add_answer("Olivia");
        }
		else if (response == "Olivia")
		{
			say("@Olivia is the caretaker of the shrine and tomb. She also the most knowledgable one on the island about Lady Tressa.@");
			UI_remove_answer("Olivia");
		}
        else if (response == "Zarkane's daughter")
        {
            say("Tressa appears shocked to be asked about such a thing. @Most people have the decency to not bring that up with me.@");
            say("@Apparantly you are not one of them.@");
            
            if(gflags[FIND_BLOODLINE])
            {
                UI_add_answer("Zarkane's hydra");
            }
            else
            {
                break;
            }
            UI_remove_answer("Zarkane's daughter");
        }
        else if (response == "Zarkane's hydra")
        {
            say("@I do not know how you have learned of the beast but I am aware of its existence.@");
            UI_remove_answer("Zarkane's hydra");
            UI_add_answer("Aware");
            UI_add_answer("Control hydra");
        }
        else if (response == "Aware")
        {
            say("An awkward silence exists for a short moment. @My mother spoke of the beast to me, and her mother spoke of the beast to her, and so on, all the way up to my great great grandmother Marabella, Zarkane's daughter.@");
            UI_remove_answer("Aware");
        }
        else if (response == "Control hydra")
        {
            say("Tressa looks furious. @How dare you even speak to me about such things! Mother always taught me to stay clear of the beast but now I am afraid I have no choice thanks to the likes of you.@");
            say("@Speak to me no more.@");
            gflags[ANGRY_TRESSA] = true;
            break;
            UI_remove_answer("Control hydra");
        }

        } // end converse bracket
}
}		
	UI_remove_npc_face(item);	
	}

