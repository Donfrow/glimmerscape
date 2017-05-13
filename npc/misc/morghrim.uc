/*
Morghrim, old man in caves north of deathsquall mountain
*/


void Morghrim object#(0x49f) ()
	{
	
var bark = "What do you want?";
var bark_intro = "Hail old man";

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
        UI_item_say(item, "Such a horrible life");
        else if (n == 2)
        UI_item_say(item, "Why will it not end");
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
        call Morghrim, TALK;
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

if (gflags[NICE_MORGHRIM])   // set in the else portion
{

if (UI_get_item_flag(item, MET))
	{
		say("The man greets you with what you think is a smile, but cannot be certain. @Hello again.@");
		UI_remove_answer("Name");

	}
else
	{

		say("The old man looks at you again. @I am sorry for my earlier behaviour. I have not thought of the orb in some time.@");
		UI_set_item_flag(item, MET, true);
	}

    converse
    {
        if (response == "Bye")
        {
            say("The man waves you off in what you think is a friendly gesture.");
            break;
        }
        else if (response == "Name")
        {
            say("It seems as if the man has not spoken in such a way in some time. @You may call me Morghrim.@");
        }
        else if (response == "Job")
        {
            say("Staring at his feet, the man begins to speak. @I have not had a job in some time. Ever since the Orb of Souls ruined my life, I have tried to stay clear of others. It hurts too much to be near others.@");
            UI_remove_answer("Job");
            UI_add_answer("Orb of Souls");
            UI_add_answer("Hurts");
        }
        else if (response == "Hurts")
        {
            say("What you think is some sort of laugh comes from the man as you ask the question. @Not so much in a literal sense, but in an emotional way.@");
			say("@It is very difficult to forge relationships when I know all those around me will die as I live on.@");
            say("The man thinks for a moment. @You remind me of someone I encountered a very long time ago though.@");
            UI_remove_answer("Hurts");
            UI_add_answer("Live on");
            UI_add_answer("Remind");
        }
        else if (response == "Live on")
        {
            say("The old man seems sad as he speaks. @I cannot seem to die, no matter what I do. My wounds are healed, eventually, if I am injured, and I do not need to eat, though hunger still pains me.@");
			say("@I must witness all those I become close with leave this world while I am forced to live on.@");
            UI_remove_answer("Live on");
        }
        else if (response == "Remind")
        {
			say("@An intruder I encountered long ago in the long destroyed MageLord's castle looked very much like you. It could not possibly have been you though.@");
			UI_remove_answer("Remind");
        }
        else if (response == "Orb of Souls")
        {
            say("A an angry, yet withered expression appears on the mans face. @Tis that cursed orb that made me what I am today. I was an assistant to MageLord Akakothen when he created the blasted thing.@");
            say("@But you did speak to me of the orb, so you must know of it. Why do you seek me out?@");
            UI_remove_answer("Orb of Souls");
            UI_add_answer("Made you");
            UI_add_answer("MageLord Akakothen");
            UI_add_answer("Help with orb");
        }
        else if (response == "Made you")
        {
            say("@Surely as you choose to approach me you know of my origins? I am an Ophidian. The last of the Ophidians. An Ophidian which cannot die.@");
            say("The man pauses, and continues on. @I served MageLord Akakothen. I thought myself to be on top of the world working with such a skilled mage. But it was not to be.@");
			say("@He merely used my soul to power his accursed creation.@");
            say("@It was then that I was created as you see me now, a man, unable to die, despite his best efforts. The orb did use my soul, destroying it forever, to become the object of power it is.@");
			say("@Without such a sacrifice it would be nowhere near as powerful as it is.@");
            UI_remove_answer("Made you");
        }
        else if (response == "MageLord Akakothen")
        {
            say("The mans face contorts in a moment of anger. @Such a skilled mage I thought! Indeed, he was, but only at the price of his subjects!@");
			say("@I thought I was lucky to spend time working under him, but now, I have nothing but time as I am doomed to live forever.@");
            UI_remove_answer("MageLord Akakothen");
        }
        else if (response == "Help with orb")
        {
            say("The man looks enraged, yet calm at the same time. @You seek a way to repower to Orb of Souls? Alas, this cannot be done without a grave cost... such as a soul.@");
            UI_remove_answer("Help with orb");
            UI_add_answer("Soul");
        }
        else if (response == "Soul")
        {
            say("The man almost begins sobbing. @My soul is what it took to power the orb originally. Had I known the cost I would not have done so.@");
			say("@The pain of such an existence you cannot truely know until you live through it.@");
            say("@I know not why I will help you with this... maybe I long to have another suffer as I have. I know that is shameful but centuries of losing all you care for can twist a mans soul... or lack of one.@");
            UI_remove_answer("Soul");
            UI_add_answer("Help");
        }
        else if (response == "Help")
        {
            say("You begin to realize the pain the man has suffered having lost all those he ever cared for. @You will need another soul. A willing soul.@");
            UI_remove_answer("Help");
            UI_add_answer("Willing soul");
        }
        else if (response == "Willing soul")
        {
            say("@I do not know where you will find a soul willing to endure this torment as I have secluded myself for so very long. You must seek one who is vain and seeking to live forever.@");
			say("@If Akakothen is any example, I imagine other royalty could be as vain to want such a thing.@");
            gflags[FIND_ORB_SACRIFICE] = true;
            UI_remove_answer("Willing soul");
			UI_add_answer("But who will do this?");
            UI_add_answer("Then what?");
        }
		else if (response == "But who will do this?")
		{
			say("@I cannot say for certain who would be so vain but I would suggest you try a location that may has royalty. I know three places which fit this description, Brentonia, Dewtopia, and Solusek Island.@");
			UI_remove_answer("But who will do this?");
		}
		
        else if (response == "Then what?")
        {
            say("A smirk goes across the mans face. @Why, then you must simply use the Orb of the fellow, and chant the incantation.@");
            UI_remove_answer("Then what?");
            UI_add_answer("Incantation");
        }
        else if (response == "Incantation")
        {
            say("The man begins to laugh. @Tis quite simple really. Miyahe miyaho miyaha miyahaha.@");
            say("@Oh, and there is one more thing I would ask of you if you manage to restore the orb?@");
            UI_remove_answer("Incantation");
            UI_add_answer("One more thing");
        }
        else if (response == "One more thing")
        {
            say("The old mans eyes light up for a moment. @Would you please use the Orb of Souls on the corpse of my wife? I must beg her forgiveness for the wrongs which I dealt her while she still lived.@");
            say("@I understand I was rude to you when we first met and I beg your forgiveness for my behaviour. It has been so long since I have spoken to anyone.@");
			say("@If you would do this favour for me you are truely a kind soul.@");
			UI_remove_answer("One more thing");
        }

    }

} // end for nice morghrim
else
{

if (UI_get_item_flag(item, MET))
	{
		say("The old man pays little attention to you as you approach.");
		UI_remove_answer("Name");
	 if (gflags[FIND_MORGHRIM])
        {
            UI_add_answer("Orb of Souls");
        }

	}
else
	{

		say("The old man looks at you with a disgusted look. @Do not pester me.@");
		UI_set_item_flag(item, MET, true);
	}
	

// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("The old man mumbles as you leave. @You will not be missed.@");
            break;
        }
        else if (response == "Name")
        {
            say("The old man gives you a dirty look. @Morghrim.@");
            UI_remove_answer("Name");
            if (gflags[FIND_MORGHRIM])
            {
                UI_add_answer("Orb of Souls");
            }
        }
        else if (response == "Job")
        {
            say("The man lets out a light chuckle. @I have no job, my life is to suffer. Now leave me to my suffering.@");
            break;
        }
        else if (response == "Orb of Souls")
        {
            say("The old man looks startled and quickly breaks away from you.");
            gflags[NICE_MORGHRIM] = true;
			gflags[MET_MORGHRIM] = true;
      		UI_set_item_flag(item, MET, false);
            break;
        }

} // end for not nice

UI_remove_npc_face(item);

}

	
}// end for TALK if
} // end for entire function

