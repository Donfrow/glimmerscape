/*
Hector the guy at the broken shack north of town
*/

void Hector object#(0x4f6) ()
	{
var bark = "Why do you torment a poor old man?";
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
				UI_item_say(item, "Why did this happen to me?");
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
        call Hector, TALK;
    }
    // avatar's script here
    abort;
}

else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
	say("@Have you come to torment me some more?@");
	}
else
	{
	say("@Ohhh the pain.@");
	UI_set_item_flag(item, 28, true);
	}
if (gflags[GET_POWDER])	
{
UI_add_answer("Rivath sent me");
}
if (gflags[MAKE_POWDER])
{
UI_add_answer("Powder");
}

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{
	if (response == "Bye")
			{
			say("@Of course, who would want to spend time with an old fool...@");

			break;
			}
else if (response == "Name")
			{
			say("@You ask me my name? Why do you care!@");
			UI_remove_answer("Name");
			UI_add_answer("Care");
			}
		else if (response == "Care")
			{
			say("@My name does not matter but I am a fool!@");
			UI_remove_answer("Care");
			UI_add_answer("Give me your name old man!");
			UI_add_answer("Fool");
			}
		else if (response == "Give me your name old man!")
			{
			say("@Fine. This old fools name is Hector.@");
			UI_remove_answer("Give me your name old man!");
			}
else if (response == "Fool")
			{
			say("@I had a lovely wife, cottage, job...@");
			say("@Until the explosion.@");
			UI_remove_answer("Fool");
			UI_add_answer("Explosion");
			}
		else if (response == "Explosion")
			{
			say("@I did experiments with my wife, but one day something went wrong.@");
			say("@I mixed two reagents incorrectly, the resulting explosion ruined my home and killed my wife.@");
			say("@@Oh the fool I was, two drops ginseng, not three, two!!@");
			say("@Two I say ! Leave me be!@");
			break;
			}
		else if (response == "Job")
			{
			say("@Har har har! Job! Har har har!@");
			UI_remove_answer("Job");
			UI_add_answer("Har har har?");
			}
		else if (response == "Har har har?")
			{
			say("@Look at me! Does it look like I have a job? Are you daft?@");
			UI_remove_answer("Har har har?");
			UI_add_answer("Daft");
			}
		else if (response == "Daft")
			{
			say("@Of course you are daft to even ask such a question!@");
			say("@As you can see my daft friend my home is in shambles.@");
			UI_add_answer("Shambles");
			UI_remove_answer("Daft");
			}
		else if (response == "Shambles")
			{
			say("@The explosion did ruin my home, kill my wife and ruin my life.@");
			say("@And I am scarred forever more to remind me of my shame.@");
			say("@Speak to me no longer.@");
			break;
			}
		else if (response == "Rivath sent me")
			{
			say("@That intolerable fool! I lost everything trying to make his blasted powder and he has the nerve to still ask for it?!@");
			say("@It should be his charred remains I possess, not my poor wife.@");
			UI_remove_answer("Rivath sent me");
			UI_add_answer("He does not know");
			}
		else if (response == "He does not know")
			{
			say("@You claim he is too afraid to approach the city? What kind of fool do you take me for? It has been months since the accident!@");
			UI_remove_answer("He does not know");
			UI_add_answer("He has been hiding for months");
			}
		else if (response == "He has been hiding for months")
			{
			say("@Hmm...@");
			say("@If that is the case I suppose he would not know of my misfortune. But the situation does not change, my life is still ruined thanks to him.@");
			say("@I will not give him the powder he needs for whatever foolery he plans on doing.@");
			UI_remove_answer("He has been hiding for months");
			UI_add_answer("Free his brother");
			}
		else if (response == "Free his brother")
			{
			say("@He only wishes to free his brother from an unjust sentence within the Sugar Caves?@");
			say("@I would not believe you had I not seen too many people sent to toil for dubious reasons with my own eyes.@");
			say("@Very well. I will attempt to make another batch, you may not wish to be around when it happens, I do not wish to take a life other than my own.@");
			say("@Return to me shortly and if I still live I will have the powder for you.@");
			UI_remove_answer("Free his brother");
			gflags[GET_POWDER] = false;
			gflags[MAKE_POWDER] = true;
			}
		else if (response == "Powder")
			{
			say("@I was able to make the powder successfully without blowing anything up this time. I am almost disappointed everything did work, perhaps an accident would end my pain.@");
			say("@But enough of my pity. Surely you have people who care and love you, unlike me, who is alone. Take the blasted powder to Rivath and allow me to continue to wallow in my pity.@");
			UI_remove_answer("Powder");
			gflags[MAKE_POWDER] = false;
			gflags[HAVE_POWDER] = true;
			UI_add_party_items(1, 704, ANY, ANY);
			}
		}
	UI_remove_npc_face(item);
	}
	}
