/*
Avret the necro on the old mad mage island
*/

void WhatYouSeek()
{
    UI_push_answers();
    UI_add_answer("Uhh");
    UI_add_answer("Umm");
    UI_add_answer("I think I left the toaster on");
    converse
    {
        if (response == "Uhh")
        {
            say("@I see your living mind clouds your judgment. Such a shame.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Umm")
        {
            say("@Your living mind wanders far too much that you cannot even focus!@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "I think I left the toaster on")
        {
            say("@Yes, yes, we all have left it on at one point or another. I completely understand.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Avret object#(0x423) ()
	{

 var book = UI_count_objects(PARTY, 642, 12, 28); // Book in the old necromage house in moonshade
 var ore = UI_count_objects(PARTY, 330, ANY, 3);
 var ore2 = UI_count_objects(PARTY, 330, ANY, 35); // stones used as the ore

 
var bark = "Hello";
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
				UI_item_say(item, "Curses!");
			else if (n == 2)
				UI_item_say(item, "curses and blasts and some such");
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
        call Avret, TALK;
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
		
if (book > 0 && gflags[TALK_TO_AVRET])
{
    UI_add_answer("Here is your book");
}

if (gflags[LENSE])
{
    UI_add_answer("Lense");
}
		
if (UI_get_item_flag(item, MET)) 
	{
		say("@It is a shame that you are still living. The deathly realm is such a fine place.@");
		UI_remove_answer("Name");

	}
else
	{

		say("@My my my, a living person! I have not seen a living person in some time.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag



if (gflags[READ_ZORPHOS_BOOK])
{
    UI_add_answer("I seek to speak with Death");
}
		converse
		{
        if (response == "Bye")
        {
            say("@Merely bye to me? You should try saying farewell to your mortal shackles.@");
            break;
        }
        else if (response == "Name")
        {
            say("@It is always a shame when one such as myself is not known. I am Avret.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@To seek enlightenment that is the end of the living. What is it you seek?@");
            UI_remove_answer("Job");
			if(gflags[AVRET_SEEK])
			{
			}
			else
			{
				WhatYouSeek();
			}
            if (gflags[TALK_TO_AVRET])
            {
				if(gflags[LENSE])
				{
				}
				else
				{
					UI_add_answer("I seek to focus");
				}
            }
			UI_add_answer("End");
			UI_add_answer("Living");
			
        }
		else if (response == "End")
		{
			say("@So many think that death is the end but to me I see it as the beginning. Could anything be nicer than death? I would think not!@");
			say("@Something so emotionally charged, something that one simply cannot avoid should not be something people to seek to fear or avoid.@");
			UI_remove_answer("End");
			
		}
		else if (response == "Living")
		{
			say("@Bah! The living are so boring and petty. So many living people fear the work I do yet they will ultimately end up being in the pool of specimens I experiment with.@");
			say("@Now how can that be logical? It is not! That is why the living are so boring and the dead are so intriguing.@");
			UI_remove_answer("Living");
		}
        else if (response == "I seek to focus")
        {
            say("@Ah yes, one must always seek to focus. But I will not aid you on your quest if you do not aid me.@");
            UI_remove_answer("I seek to focus");
            UI_add_answer("What do you want?");
        }
        else if (response == "What do you want?")
        {
            say("@You are already on your way to focusing by knowing to focus on what it is I want! You are not as daft as I first thought. Now to change your focus.@");
            say("@There is an old book, The Deathly Throws, which chronicals the exploits of its writer. I seek this book. Bring this book to me, and only then will I aid you.@");
            UI_remove_answer("What do you want?");
            UI_add_answer("Where is it?");
        }
        else if (response == "Where is it?")
        {
            say("@Your focusing is continuing to improve! How delightful... but I must not encourage you less you think you do not need me.@");
            say("@I believe the book to be some place on DeathScorn Island, most likely a deathly and gloomy place. I would search myself, but I am much to busy and important.@");
			say("@Now begone and return with the book.@");
            break;
        }
        else if (response == "Here is your book")
        {
            say("@Your focus has been most useful. Thank you for the book.@");
            UI_remove_party_items(1, 642, 12, 28); // Remove the book
            UI_remove_answer("Here is your book");
            UI_add_answer("Help with focus");
        }
        else if (response == "Help with focus")
        {
            say("@You have proven that you are able to focus on a task. Good for you.@");
            UI_remove_answer("Help with focus");
            UI_add_answer("Uh, that's not what I meant");
        }
        else if (response == "Uh, that's not what I meant")
        {
            say("@Oh I see your dilemma. Indeed, it is quite the pickle. I suppose that you could make a sort of focusing lense which could aid in your task.@");
            UI_remove_answer("Uh, that's not what I meant");
            UI_add_answer("Lense");
        }
        else if (response == "Lense")
        {
            say("@It is something that I learned was possible over the course of my studies. But you will need need to make it out of a strong material for your needs.@");
            say("@A suitable material can be found in the demon realm. One must pass through a magical gate to gain entrance to this realm and these gates are most difficult to open.@");
			say("@Luckily for you I have opened one during my studies that I have not yet been able to close. Take this key to gain entrance to my shed which houses the gateway.@");
            say("@As for the lense itself, you will need a very skilled artisan to construct it for you. That I can be of no help with but I would guess that you would require at least three pieces.@");
			say("@I have heard before the gnomes are rather skilled artisans, so perhaps if you could find a gnome it could help you.@");
            UI_add_party_items(1, 641, 202, 12); // Key to the shed
            UI_remove_answer("Lense");
			UI_add_answer("Gnome");
            gflags[LENSE] = true;

        }
		else if (response == "Gnome")
		{
			say("@I am a necromancer, not a zoologist. I do not know much of gnomes. I have heard some live near Solusek Island and Dante's Trading post, but that as much information as I can provide.@");
			UI_remove_answer("Gnome");
		}
        else if (response == "I seek to speak with Death")
        {
            say("@It is about time that you decided to seek the ultimate in knowledge. I merely have to slay you and you will be before death.@");
            UI_remove_answer("I seek to speak with Death");
            UI_add_answer("I wish to stay alive");
        }
        else if (response == "I wish to stay alive")
        {
            say("@So you seek to become a necromancer? It is wonderful to have another join the ranks. But alas, one cannot speak to death and still be living.@");
			say("@I suppose if you had read the book that I had you recover you would already know this.@");
            say("@But that is not to say that one cannot die and return to life.@");
            UI_remove_answer("I wish to stay alive");
            UI_add_answer("How so?");
        }
        else if (response == "How so?")
        {
            say("@After you provided me with the book I began working on a potion which should temporarily 'kill' the inebriator. But I have not tested it yet...@");
            UI_remove_answer("How so?");
            UI_add_answer("I will be your guinea pig!");
        }
        else if (response == "I will be your guinea pig!")
        {
            say("@Very well. Take this potion and drink it when you are ready to face death...@");
            UI_remove_answer("I will be your guinea pig!");
            UI_add_party_items(1, CONCOCTION, ANY, ANY);
            UI_add_answer("How do I return?");
        }
        else if (response == "How do I return?")
        {
            say("@Ah yes. With you not being ready to take the ultimate journey you will need a way back. My potion merely allows your to temporarily enter the state of death.@");
			say("@Something else will be required to return from it...@");
            say("@My guess is that since your body is not actually dead, Death itself should be able to return you to where you fell.@");
            UI_remove_answer("How do I return?");
        }
        

		}
		}
	UI_remove_npc_face(item);
	}

