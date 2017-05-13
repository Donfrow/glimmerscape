/*
 Florendo the Stage Actor north of Castle Dew
*/

void Learn_Lute_Yay_Nay()
{
UI_push_answers();
converse(["Yes", "No"])
{
	case "Yes" (remove):
	if(chargeGold(100))
	{
		gflags[LEARNING_LUTE] = true;
		if(gflags[LUTE_LEVEL_1])
		{
			say("Florendo looks you up and down. @Firstly, your posture is simply horrible. You cannot have your back the way it is. You must be free. Try this simple song.@");
			say("As you try to string the song Florendo has presented to you he clearly cringes. @You certainly have the spirit but you are quite terrible. Perhaps we need to go to something simpler.@");
			say("Florendo provides you with another sheet of music and instructs you to play. As you play Florendo continues to cringe but slowly eases up.");
			say("@I see I started you off far too difficult but you are slowly getting the better. Unfortunately for you that is the end of this lesson. Return to me when you are ready for another one.@");
			gflags[LUTE_LEVEL_1] = false;
			gflags[LUTE_LEVEL_2] = true;
		}
		else if (gflags[LUTE_LEVEL_2])
		{
			say("Florendo hands you a familiar sheet of music. @This is the song I started you wish last time. Try it again and let me see how you do.@");
			say("As you play the song Florendo has a look of disgust but of contempt. @You are still quite bad, but at least you are improving. Try this song.@");
			say("Florendo hands you another song and you begin to play. @Ah yes. I see what your problem is. You move your fingers together too much. Let them flow.@");
			say("As you continue to practice Florendo seems impressed but cuts you off. @You are improving but your time is up. Do return later.@");
			gflags[LUTE_LEVEL_2] = false;
			gflags[LUTE_LEVEL_3] = true;			
		}
		else if (gflags[LUTE_LEVEL_3])
		{
			say("Florendo nods at you and makes motions with his hands. @This is how your hands must flow. Let the music guide you. Try this song.@");
			say("As you play the music Florendo smiles, but as you miss a note his face cringes and he begins to yell at you. @Do you not listen to what I say? Let the music guide you! Now you may continue.@");
			say("You continue to play the lute and Florendo smiles. @You are a good student. You are actually listening to your teacher. You have improved greatly. Return when you are ready for your next lesson.@");
			gflags[LUTE_LEVEL_3] = false;
			gflags[LUTE_LEVEL_4] = true;
		}
		else if (gflags[LUTE_LEVEL_4])
		{
			say("Florendo hands you another sheet of music. @I do hope you have been practicing. It is now time to get you playing the more complicated songs. Now please begin.@");
			say("As you play Florendo nods but still has short, momentary cringes. @You are becoming quite the lute player but you are still not letting the music guide you.@");
			say("Florendo takes hold of your hand and helps you as you strum the lute. @Do you see how your fingers flow freely with the music? That is what you must master. Return to me later after you have practiced.@");
			gflags[LUTE_LEVEL_4] = false;
			gflags[LUTE_LEVEL_5] = true;
		}
		else if (gflags[LUTE_LEVEL_5])
		{
			say("Florendo nods at you as he hands you more sheet music. @You are becoming quite the lute player, but I am not sure you have mastered it yet. Let us try this song.@");
			say("As you play the loot you let the music guide the motion of your fingers and body. @You are doing excellent. It seems you have finally figured out how to let the music speak to you.@");
			say("Florendo grins widely as you play without any errors. @You have mastered the art of the lute. You have taken what I have taught you to heart and there is nothing more I can teach you.@");
			say("@Now go out unto the world and share the gift of song. And in your ensuing fame do not forget your excellent teacher Florendo the Magnificiant!@");
			gflags[LUTE_LEVEL_5] = false;
			gflags[LUTE_LEVEL_6] = true;
		}
		UI_clear_answers();
		UI_pop_answers();
		break;	
	}
	else
	{
		say("@You cannot afford my lessons!@");
		UI_clear_answers();
		UI_pop_answers();
		break;
	}
	
	case "No" (remove):
	say("@I did not think you would be a very good student anyway.@");
	UI_clear_answers();
	UI_pop_answers();
	break;	
}

}

void Florendo object#(0x4f7) ()
{
if (event == 0)
		{
		if (UI_get_schedule_type(item) == 28)
			{		// Preaching.
				var n = UI_get_random(3);// 1-3.
				if (n == 1)
				
					UI_item_say(item, "All the world's a stage");
				else if (n == 2)
					UI_item_say(item, "Boom!");
				else if (n == 3)
					UI_item_say(item, "There was a hook on the door!");
				return;
				}
		else if (UI_get_schedule_type(item) == 14)
				{
				UI_item_say(item, "Zzzz");
				return;
				}
		else
		
		var n = UI_get_random(3);// 1-3.
		if (n == 1)
			UI_item_say(item, "Noone understands me");
		else if (n == 2)
			UI_item_say(item, "Life is tough being me");
		else if (n == 3)
			UI_item_say(item, "I am the greatest artist ever");
			return;
		}

	if (event != 1)
		return;

	UI_show_npc_face(item);
	if (UI_get_schedule_type(item) == 28)
		{
		say("@Yevin and Klevin fought a mighty battle. Yevin was getting the upper hand...@");
		say("@Then, with a mighty gust of wind, Yevin was pushed into the chasm!@");
		say("@Klevin took the opportunity to get the upper hand over his foe.@");
		say("@And he lopped the head directly off with a mighty swing!@");
		say("@Yevin did not have the opportunity to let loose a curse and this gave Klevin great confidence.@");
		say("@And he didst remove the skin from Yevin skull, and kept it on his table@");
		say("@He lived many a year with the skull of his mortal enemy... yet the confidence of Klevin upset the ghost of Yevin.@");
		say("@And then the ghost of Yevin did make a pact with The Great Evil for what was left of his tormented soul.@");
		say("@And this pact doth allowed him to rise from his skull on Klevin's table one night...@");
		say("@Klevin woke from the ruckus in his room, and he met with a great stare from the ghost of Yevin.@");
		say("@The dread gaze of Yevin didst horribly mutate Klevin's appearance, permantly disfiguring him and dooming him...@");
		say("@To give the same fate to all those who did see him... but where did he go after that?@");
		say("@Why, to Dewtopia to tell his tale, and curse all of those so he was not alone! You are all now cursed! Buhaha!@");
		}

	else
	{
	if (UI_get_item_flag(item, 28)) 
		{
		say("@It must be an honour for you to be in the presence of my greatness once more.@");
		}
	else
		{
		say("Lovely, another adoring fan has come to seek me out.@");
		UI_set_item_flag(item, 28, true);
		}
// End MET Flag
		
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if(gflags[LEARNING_LUTE])
{
	if(gflags[LUTE_LEVEL_6])
	{
	}
	else
	{
		UI_add_answer("Lute lesson");
	}
}
		
		converse
		{
	if (response == "Bye")
			{
			say("@Spread the word of Florendo, actor, bard, masterpiece in the flesh.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Why, I am Florendo, Actor Extrodinaire, along with teller of tales and lore.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("The man looks shocked. @I am an actor of epic proportions. I am a bard of epic tales and lore. Citizens from this fine world travel great lengths to see me perform here in Dewtopia.@");
			UI_remove_answer("Job");
			UI_add_answer("Actor");
			UI_add_answer("Bard");
			UI_add_answer("Tales and lore");
			}
		else if (response == "Actor")
			{
			say("@I act out the greatest stories ever told and amaze all who see my fine shows. I do not even need a supporting cast as my greatness has no need for it.@");
			UI_remove_answer("Actor");
			}
		else if (response == "Tales and lore")
			{
			say("@These lands hold many tales and lore and naturally someone must tell them. That person might as well be me as I am so great at doing so, and noone compares.@");
			UI_remove_answer("Tales and lore");
			UI_add_answer("You really are full of yourself");
			}
		else if (response == "You really are full of yourself")
			{
			say("@You are simply jealous of my greatness, many people are. But it is alright. It is understandable when one is in the presence of one as great as I.@");
			UI_remove_answer("You really are full of yourself");
			}
		else if (response == "Bard")
		{
			say("@I am so much more than a simple bard. My tales are truely epic, they captivate my audience in a way no other bard can, or ever well.@");
			say("@In fact, not only am I an excellent orator but my skills on the lute are also unsurpassed.@");
			UI_remove_answer("Bard");
			UI_add_answer("Lute");
		}
		else if (response == "Lute")
		{
			say("@My epic tales are often accompanied by my playing of the lute. They add such elegance to an already excellent show.@");
			say("@In fact, I am so excellent on the lute that many beg me to teach them how to play.@");
			UI_remove_answer("Lute");
			UI_add_answer("I wish to play the lute");
		}
		else if (response == "I wish to play the lute")
		{
			if(gflags[LEARNING_LUTE])
			{
				if(gflags[LUTE_LEVEL_6])
				{
					say("@You have already mastered the lute.@");
				}
				else
				{
					say("@Yes, you have already made that clear in past conversations. Would you like to pay another 100 gold for another lesson?@");
					Learn_Lute_Yay_Nay();
				}
			}
			else
			{
				say("Florendo chuckles. @If you wish to learn to play the lute you have come to a most excellent teacher. But I am not certain you could afford it as I charge 100 gold per lesson.@");
				say("@But perhaps you are not as poor as your clothes make you look. Do you wish for me to teach you the lute?@");
				gflags[LUTE_LEVEL_1] = true;
				Learn_Lute_Yay_Nay();
			}
			UI_remove_answer("I wish to play the lute");
		}
		else if (response == "Lute lesson")
		{
			say("@I hope you have practiced since our last lesson. Are you willing to pay another 100 gold coins for another session?@");
			Learn_Lute_Yay_Nay();
			UI_remove_answer("Lute lesson");
		}
		}
}
	UI_remove_npc_face(item);
}
