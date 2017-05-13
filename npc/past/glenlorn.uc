// Glenlorn in the cave in the past

void Glenlorn object#(0x50b) ()
{

var bark = "It is you";
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
				UI_item_say(item, "Soon the time will come");
			else if (n == 2)
				UI_item_say(item, "Tis only a matter of time");
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
        call Glenlorn, TALK;
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
        UI_add_answer("Where am I?");

if (UI_get_item_flag(item, MET))
	{
		say("The man once again greets you. @Still fulling your destiny I see.@");
		UI_remove_answer("Name");
	}
else
	{
    	say("A shaggy greyed man looks at you. @It is... it is you.@");
        UI_add_answer("Me?");
        UI_add_answer("What happened to my Orb of Focus?");
        UI_set_item_flag(item, MET, true);
	}

    converse
    {

        if (response == "Bye")
        {
            say("The man smiles at you. @Yes, yes. Go about your destiny.@");			
            break;
        }
		else if (response == "Name")
        {
			say("The man quickly pipes up. @Of course. I know you but you do not know me. I am Glenlorn, Avatar.@");
			UI_remove_answer("Name");
			UI_add_answer("Avatar");
        }
        else if (response == "Avatar")
        {
            say("@I have forseen that the one who appears in the cavern shall be the one known as the Avatar.@");
            UI_remove_answer("Avatar");
        }
        else if (response == "Me?")
        {
            say("A boastful laugh fills the cavern. @Aye, of course it is you. I have been waiting a long time for you I will have you know.@");
            UI_remove_answer("Me?");
            UI_add_answer("Waiting");
        }
        else if (response == "Waiting")
        {
            say("The man winces. @Most thought me mad but I knew you would come. There are only two others who have been awaiting for your arrival along side me.@");
            UI_remove_answer("Waiting");
            UI_add_answer("Two others");
        }
        else if (response == "Two others")
        {
            say("A grimace appears on the mans face. @The only others who will listen to my visions wait for you for their own ends. Beware of them yet also know that you will require them.@");
            UI_remove_answer("Two others");
        }
        else if (response == "Where am I?")
        {
            say("A smirk crosses the mans face. @Why, you are here of course.@");
            UI_remove_answer("Where am I?");
            UI_add_answer("Where is here?");
        }
        else if (response == "Where is here?")
        {
            say("The man chuckles. @You never left where you were. Merely when.@");
            UI_remove_answer("Where is here?");
            UI_add_answer("When");
        }
        else if (response == "When")
        {
            say("An odd look crosses the man face. @I thought that you would have figured it out by now. Akakothen was correct in his theory with the orb. Or should I say, he will be correct in his theory.@");
            UI_remove_answer("When");
            UI_add_answer("Just who are you?");
        }
        else if (response == "Just who are you?")
        {
            say("The man sighs. @Are you really this slow? Did you not speak with the gypsy? Did you not get told that the seer would help you? Why must destiny be so cruel? Enough with your foolish questions.@");
            UI_remove_answer("Just who are you?");
        }
        else if (response == "Job")
        {
            say("The man lowers his voice. @I am the Seer.@");
            UI_remove_answer("Job");
            UI_add_answer("Seer");
        }
        else if (response == "Seer")
        {
            say("The shaggy hair of the man moves as he nods his head. @Tis true. I am the Seer that you have read about... or will read. I am here to help you, for destiny has made it so.@");
            UI_remove_answer("Seer");
            UI_add_answer("Help");
            UI_add_answer("Destiny");
        }
        else if (response == "Destiny")
        {
            say("A sigh escapes from the mans mouth before he speaks. @It is destiny guiding your actions. An unseen force... everything you do is beyond your control.@");
			say("@It is almost as if some cruel, unseen puppet master is guiding your every action.@");
            UI_remove_answer("Destiny");
        }
        else if (response == "Help")
        {
            say("The man looks you straight in the eyes. @You will need Wisdoms Eye to create the ripple to complete your destiny in much the same way you used the lense to get here.@ The man pauses.");
            say("@Yes yes, I know. You do not possess the orb. Interesting how destiny works is it not? You must create the very object that you used to get here in the first place to get you home.@");
            UI_remove_answer("Help");
            UI_add_answer("Say what?");
            UI_add_answer("Orb");
        }
        else if (response == "Say what?")
        {
            say("The man seems to look deep within you. @Yes, I know. Tis difficult to comprehend. Do not ask me how it works for I only have been given the ability to see it, not to understand it.@");
            UI_remove_answer("Say what?");
        }
        else if (response == "Orb")
        {
            say("@Everything your need for this portion of your quest lies within reach. Closer than you may think. You cannot miss him.@");
            UI_remove_answer("Orb");
            UI_add_answer("Why not just tell me?");
        }
        else if (response =="Why not just tell me?")
        {
            say("You cannot quite make out the expression on the mans face. @It is very difficult to explain. I know exactly what you must do yet I have forseen that you do not learn it from me.@");
            say("@As much as I want to tell you I simply cannot. Tis very confusing.@");
            UI_remove_answer("Why not just tell me?");
        }
        else if (response == "What happened to my Orb of Focus?")
        {
            say("The old man grins. @While I am do not want to say that the Orb of Focus has a mind of its own I will say that the Orb cannot go with you in the events which have brought you here.@");
            UI_remove_answer("What happened to my Orb of Focus?");
            UI_add_answer("Huh?");
        }
        else if (response == "Huh?")
        {
            say("A chuckle escapes the man. @This entire situation is difficult to understand, let alone explain to you. The Orb of Focus is bound to the its fate much as you are. It simply could not go with you.@");
			say("@That is the best which I can explain it.@");
            UI_remove_answer("Huh?");
        }


    }	
	UI_remove_npc_face(item);
}
}
