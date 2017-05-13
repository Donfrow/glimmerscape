//Glenn the prisoner in the past

void GlennLetter()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if (response == "Yes")
        {
            say("The man appears skeptical, but happy. @Thank you. You should be able to find her in the underground.@");
            UI_add_party_items(1, GOOD_SCROLL, 88 ,ANY);
            gflags[PAST_SCROLL] = true;
            karma = karma + 250;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("The man appears disappointed, but relieved at the same time. @Very well. You would probably get lost anyway with how intelligent you appear to be.@");
            gflags[PAST_SCROLL] = true;
            karma = karma - 250;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Glenn object#(0x475) ()
	{

	
var bark = "Are you mad?!";
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
				UI_item_say(item, "Woe is me");
			else if (n == 2)
				UI_item_say(item, "I longe for death");
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
        call Glenn, TALK;
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
		say("The man peers at you through the bars. @Still have not had the mind to run I see.");
		UI_remove_answer("Name");
	}
else
	{

	say("The man seems almost frightened to see you. @What are you doing in here? Run while you still can!@");
	UI_add_answer("Run");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("The man seems glad to see you go. @That is right, flee while you still can!@");			
			break;
			}
		else if (response == "Name")
			{
			say("A puzzled look crosses the mans face. @You break into the MageLord's study, and then you choose to have sparkling discussions with his prisoner? Now I know you are truely mad.@");
			UI_remove_answer("Name");
			UI_add_answer("What is your name!");
			}
			else if (response == "What is your name!")
			{
                say("A smirk crosses the mans face. @I suppose since you have chosen to break in here and speak with me I owe it to tell you my name. Glenn, at your service.@");
                UI_remove_answer("What is your name!");
            }
        else if (response == "Run")
        {
            say("@Get out of here before you are caught you fool!@");
            UI_remove_answer("Run");
        }
		else if (response == "Job")
			{
			say("A chuckle escapes the cell. @I am to be torturered, beaten and whatever else the MageLord chooses to do with me.@");
			UI_remove_answer("Job");
			UI_add_answer("Why?");
            }
        else if (response == "Why?")
        {
            say("A frown quickly appears. @You are telling me that you broke into the MageLord's castle, risking torture and beatings and you do not even know what is going on in the kingdom?@");
            say("@You are certainly as stealthy as a rogue, but sadly you seem to be as intelligent as a troll.@");
            UI_remove_answer("Why?");
            UI_add_answer("Why are you here?");
        }
		else if (response == "Why are you here?")
		{
            say("The man eyes you, unsure of what to think and then lets out a snort. @I suppose I should be thankful you are visiting me inbetween my beatings and torture and not waste the gift.@");
			say("@My only crime is that I dared to speak about defiance of the MageLord in the open. That is why I am here.@");
            UI_remove_answer("Why are you here?");
            UI_add_answer("Defiance");
        }
        else if (response == "Defiance")
        {
            say("A puzzled look crosses the man. @You certainly are simple for someone possessing the skill to break in here. Surely you have noticed the unrest that the MageLord's relentless experiments have caused?@");
			say("@It is only a short time until we are strong enough to overthrow his incompetant rule and restore greatness to the empire.@");
            say("@Sadly, I do not think I will survive long enough to see that happen.@");
            if (gflags[PAST_SCROLL])
            {
				say("@Hopefully Erinon will receive the scroll in time. At least my time here will have then served a purpose.@");
            }
            else
            {
                say("The man suddenly grins at you. @Since the chances of my survival are small perhaps though could take a scroll to Erinon? I wrote it some time ago but never expected the chance to actually get it out of here.@");
				say("@Would you take it to her for me?@");
                GlennLetter();
            }
			if(gflags[RECEIVED_GLENN_SCROLL])
			{
				UI_add_answer("Erinon will leave");
			}
            UI_remove_answer("Defiance");
            UI_add_answer("Experiments");
        }
        else if (response == "Experiments")
        {
            say("The man sighs. @Akakothen's minions are certainly working well at surpressing the true nature of his reign. He has caused the death of many of us with his insane experiments.@");
			say("@The latest of which has caused hundreds of deaths while forcing us to work with the metal adamantium.@");
            UI_remove_answer("Experiments");
            UI_add_answer("Adamantium");
            UI_add_answer("Latest experiment");
        }
        else if (response == "Adamantium")
        {
            say("The man rolls his eyes. @You are truely a strange fellow. Adamantium is the strongest metal known to us. It is nearly impossible to forge with and so dangerous many people die when working with it.@");
            UI_remove_answer("Adamantium");
        }
        else if (response == "Latest experiment")
        {
            say("A light chuckle escapes the cell. @If his experiment did not cause so many deaths it would be laughable. He believes he has the means to travel through the very fabric of time itself.@");
			say("@The MageLord is brilliant, but lately he has simply gone mad.@");
            UI_remove_answer("Latest experiment");
            UI_add_answer("I am from the future!");
            UI_add_answer("Mad");
        }
        else if (response == "I am from the future!")
        {
            say("Laughter comes from the cell. @My friend, you may be skilled at breaking into places but you certainly are dim witted.@");
            UI_remove_answer("I am from the future!");
        }
        else if (response == "Mad")
        {
            say("The man lets out a deep sigh. @With the growing unrest Akakothen has abandoned his experiments with time travel. Now the fool is seeking some sort of ultimate power.@");
			say("@The madness will bring an end to the kingdom if he is not stopped!@");
            UI_remove_answer("Mad");
            UI_add_answer("Ultimate power");
        }
        else if (response == "Ultimate power")
        {
            say("@The man thinks he can create some sort of artifact of supreme power which is capable of his fulfilling his wildest dreams. His fall from greatness is almost sad.@");
            UI_remove_answer("Ultimate power");
            UI_add_answer("Fall");
            UI_add_answer("Artifact");
        }
        else if (response == "Fall")
        {
            say("The prisoner looks irked. @Have you not been listening to what I have been saying? If the MageLord is allowed to keep up what he is doing the empire will surely fall!@");
            UI_remove_answer("Fall");
        }
        else if (response == "Artifact")
        {
            say("@I do not know much about it other than that Akakothen has been working on it since the unrest became more widespread.@");
			say("@If you truely wish to learn more about it he keeps a journal about his experiments somewhere.@");
            UI_remove_answer("Artifact");
            UI_add_answer("Journal");
        }
        else if (response == "Journal")
        {
            say("@With the amount of experiments he has done I would not be surprised if he had several. And do not ask me where they are if you intend to find them as my world consists only of this cell.@");
            UI_remove_answer("Journal");
        }
		else if (response == "Erinon will leave")
		{
			say("Glenn glares at you as you tell him that Erinon will leave on her mission, but that she will survive. @I ask for your help and you taunt me in such a way! I beg of you, just get the letter to her!@");
			UI_remove_answer("Erinon will leave");
		}
        
            }
		
	UI_remove_npc_face(item);
}	
	}

