/*
Joth, guy in Kintore
*/

void Joth_Wife_Convo()
{
UI_push_answers();

converse(["Lie", "Tell the truth"])
{
	case "Lie" (remove):
	say("Sensing the feelings the man is suffering with you make up a story on how you found her body before the dark monks could defile it.");
	say("@I am so thankful that she did not suffer. I am so glad that her body was not used in their twisted rituals. I must go recover it now so she can have a proper buriel.@");
	remove(["Tell the truth"]);
	add(["Body is gone"]);
	
	case "Body is gone" (remove):
	say("You quickly make up a story about how the body was lost in a great fire as you fought the Dark Monks.");
	say("@At least she will never have the chance to be mutilated. I thank you so much.@");
	karma = karma + 250;
	gflags[JOTH_LIE] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Tell the truth" (remove):
	say("You begin to tell Joth the truth about how is wife became a Dark Monk, partaking in their sadistic practices and desires. It is apparant the man is in pain as his eyes water.");
	say("@This cannot be. My poor wife. I cannot belive this. My heart, it is dead. I cannot speak of anything anymore. Leave me be.@");
	gflags[JOTH_TRUTH] = true;
	karma = karma - 200;
	UI_clear_answers();
	UI_pop_answers();
	break;
}

}


void Joth object#(0x432) ()
	{

	
var bark = "Greetings";
var bark_intro = "Hail";

if(gflags[JOTH_TRUTH])
{
	bark = "Go away";
}

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
				UI_item_say(item, "Such is life");
			else if (n == 2)
				UI_item_say(item, "I miss my wife");
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
        call Joth, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

UI_show_npc_face(item);
	
if(gflags[JOTH_TRUTH])
{
	say("@Please, leave me to my sorrows.@");
}
else
{



		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");
		LookForDarkMonk();

if(gflags[LEARNED_OF_JOTH_WIFE])
{
	UI_add_answer("Wife's fate");
}
		
if (UI_get_item_flag(item, MET)) 
	{
		say("@How are things fairing for you today?@");
		UI_remove_answer("Name");
	}
else
	{

	say("@Welcome to Kintore.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag





		converse
		{

	if (response == "Bye")
			{
			say("@Safe travels.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@You may call me Joth.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@My only job at the time is to take care of my son and seek vengence on the Dark Monks.@");
			UI_remove_answer("Job");
			UI_add_answer("Son");
			UI_add_answer("Vengence");
			UI_add_answer("Dark Monks");
			}
		else if (response == "Son")
			{
			say("@He is but a wee babe right now but that does not prevent him from being my pride and joy.@");
			say("@I only hope he will grow up well even without his mother.@");
			UI_remove_answer("Son");
			UI_add_answer("Mother");
			}

		else if (response == "Mother")
			{
			if(gflags[JOTH_LIE])
			{
				say("@I am so happy that you have told me that Ashela did not suffer. I cannot thank you enough.@");
			}
			else
			{
				say("@Ashela, my sons mother, my poor wife, is no longer with us. She was kidnapped by the Dark Monks and used for their horrible rituals some time ago.@");
				gflags[JOTH_WIFE] = true;
			}
			UI_remove_answer("Mother");
			}
		else if (response == "Vengence")
			{
			say("@The Dark Monks took my wife one night long ago and used her in a sacrifice with their dark magic.@");
			say("@Now I train with Gala, one day I will be strong enough to take my vengence on those who took my wife.");
			say("@If only Gala had been in charge at the time they took my wife, perhaps then she would yet live.@");
			say("@Regardless of what could have been, my wife is forever gone and I will have vengence, be it this life or the next.@");
			UI_remove_answer("Vengence");
			UI_add_answer("Gala");
			}
		else if (response == "Gala")
			{
			say("@She is the new mayor of Kintore. She protects us from the Dark Monks and any other trouble that may come our way.@");
			say("@She is much better than the old buffoon that she replaced.@");
			UI_remove_answer("Gala");
			UI_add_answer("Old Buffoon");
			}
		else if (response == "Old Buffoon")
			{
			say("@We do not speak much of him anymore, suffice to say it is his fault the Dark Monks even have a sanctuary on this island.@");
			say("@If Gala had been in charge she would have run those Dark Monks off the first day they arrived instead of coddling and trying to understand them.@");
			UI_remove_answer("Old Buffoon");
			}
		else if (response == "Dark Monks")
		{
			say("@Horrible people who revel is death and despair who set up a sanctuary on the east side of the island.@");
			say("@Hopefully one day we will manage to run them off.@");
			UI_remove_answer("Dark Monks");
		}
		else if (response == "Seen any ex-dark monks lately?")
			{
			say("@If I did, they would not still be living.@");
			UI_remove_answer("Seen any ex-dark monks lately?");

			}
		else if (response == "Wife's fate")
		{
			say("Joth looks at you as you mention the fate of his wife and begins to plead with you. @Please let me know what happened to my wife!@");
			say("@Please tell me her death was painless. Please tell me they did not defile her body. I must know that she did not suffer.@");
			Joth_Wife_Convo();
			if(	gflags[JOTH_TRUTH])
			{
				break;
			}
			UI_remove_answer("Wife's fate");
		}

		
		
		}
	UI_remove_npc_face(item);
	}
	}
	}

