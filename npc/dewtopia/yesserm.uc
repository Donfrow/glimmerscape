/*

Yesserm - Historian and scholar for Dewtopia

*/

void Yesserm_Notable_Locs()
{
UI_push_answers();
	
				UI_add_answer("Southern Most Mountains");
				UI_add_answer("South-West Mountains");
				UI_add_answer("Sugar Caves");
				UI_add_answer("Change Subject");	

				converse
					{
					
					if (response == "Southern Most Mountains")
						{
							say("@Noone has explored much of the southern most mountains due to ancient tales about a liche which supposedly inhabits the area. Which is sad, as the lore is quite fascinating.@");
							say("@However, with the goblin and bandit threats constantly loaming, it is not a priority for those capable to venture there to debunk these fables.@");
							UI_remove_answer("Southern Most Mountains");
						}


					else if (response == "Sugar Caves")
						{
							say("@A mountain range just outside Dewtopia are known as the Sugar Caves. Only Dewtopian Knights may venture in and out of them freely.@");
							UI_remove_answer("South-East Mountains");
						}
						else if (response == "South-West Mountains")
						{
							say("@Those mountains are directly west of the Sugar Caves. They used to have a high concentration of minerals in them but are now empty and abandoned.@");

							UI_remove_answer("South-West Mountains");
						}
					else if (response == "Change Subject")
						{
							say("@If you desire knowledge of other areas throughout the land, you should consult the library.@");
							UI_clear_answers();
							UI_pop_answers();
							break;
						}
					}
}


void Yesserm object#(0x52e) ()
	{

var scroll = UI_count_objects(PARTY, 707, 51, -359);
var banditscroll = UI_count_objects(PARTY, 797, 53, -359);
var bot_log = UI_count_objects(PARTY, GOOD_SCROLL, 59, ANY);
var bark = "Ah, another mind in search of knowledge";
var bark_intro = "Hail sage";

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{		// Sleeping.
			UI_item_say(item, "Zzzz...");
			
			return;
			}
		var n = UI_get_random(2);// 1-2.
		if (n == 1)
			UI_item_say(item, "Intriguing");
		else if (n == 2)
			UI_item_say(item, "Fascinating!");
		return;
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
        call Yesserm, TALK;
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
	say("@I see your mind continues to seek knowledge.@");
	
	UI_remove_answer("Name");
	}
else
	{
	say("@Ah, another mind which seeks knowledge.@");
	UI_set_item_flag(item, MET, true);
	}


if (gflags[CAMILLE_CAUGHT])
	{
	UI_add_answer("Camille");
	}

if (gflags[BANDIT_STRUCTURE1])
	{
	UI_remove_answer("Explain");
	UI_remove_answer("Camille");
	UI_add_answer("Bandit Power Structure");
	}
if(scroll > 0 && UI_get_item_flag(item, MET))
	{
	UI_add_answer("Goblin Scroll");
	}

if(gflags[GOBLIN_SCROLL])
	{
	UI_add_answer("Deciphered Scroll");
	}

// Liche/Graethe quest line

if(gflags[FIND_GRAETHE])
	{
	UI_add_answer("Graethe's Disappearance");
	}
if (gflags[FOUND_GRAETHE])
	{
	UI_remove_answer("Graethe's Disappearance");
	UI_add_answer("The Liche");
	}
if (gflags[LICHE])
	{
	UI_remove_answer("The Liche");
	}
if (gflags[READ_LICHE_SCROLL] && gflags[TALK_TO_YESSERM_ABOUT_ORB])
	{
	UI_add_answer("Orb of Transfiguration");
	}




if (gflags[BANDIT_SCROLL])
	{
	UI_add_answer("Bandit Scroll");
	}
if (gflags[BANDIT_SCROLL1])
	{
	UI_remove_answer("Bandit Scroll");
	}



// Breakout prison bot logs

if (gflags[TALK_TO_YESSERM] && bot_log >0)
	{
	UI_add_answer("Bot Log");
	}




	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Continue to seek knowledge.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Yesserm the Scholar.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the official scholar for Lord Dew as well as the historian of Dewtopia and the nearby lands.@");
			UI_remove_answer("Job");
			UI_add_answer("Scholar");
			UI_add_answer("Historian");
			UI_add_answer("Nearby Lands");
			}
		else if (response == "Scholar")
			{
			say("@One must always seek knowledge to better oneself. I seek to earn all languages of these lands, be it goblin, yeti or military code.@");
			UI_remove_answer("Scholar");
			UI_add_answer("Goblin");
			UI_add_answer("Yeti");
			UI_add_answer("Military Code");

			}
		else if (response == "Goblin")
			{
			say("@A fascinating but savage race. They continue to try and pillage Dewtopia of its wealth.@");
			say("@They have a fascinating written language in that only the smarter goblins are able to read and write it.@");
			say("@If you do come across any form of goblin writings I would be in your debt.@");
			UI_remove_answer("Goblin");
			}
		else if (response == "Yeti")
			{
			say("@They are large fur covered creatures which live in the northern mountainous regious, closer to Brentonia.@");
			say("@They occasionally venture down from the icy lands though we rarely see them this far south. Sadly I know not much about them or their culture.@");
			UI_remove_answer("Yeti");
			}
		else if (response == "Military Code")
			{
			say("@Many of the armies of the region possess their own style of writing which is decoded by their own troops.@");
			say("@A great military advantage is had by an army if they possess the ability to decode their enemies message, or their allies.@");
			say("@Lord Dew has commissioned me to decode all the surrounding armies military codes. It is a difficult yet fascinating venture.@");
			UI_remove_answer("Military Code");
			}
		else if (response == "Historian")
			{
			say("@I take it upon myself to record the history of these lands when I uncover new information.@");
			say("@My current compelation of this lands is in my house which you can view if you should desire. I do love to spread the wealth of knowledge.@");
			UI_remove_answer("Historian");
			}
		else if (response == "Nearby Lands")
			{
			say("@Before the threats outside the walls increased I gathered information about nearby notable land marks. If you desire information about any of these you may ask me.@");
			say("@Now I rarely venture outside the city walls so my latest information I have is second hand from those who do.@");
			say("@In fact, I am attempting to gather information about the menance known as the Plains Bandits.@");
			UI_remove_answer("Nearby Lands");
			UI_add_answer("Plains Bandits");
			UI_add_answer("Notable Locations");
			}
		else if (response == "Plains Bandits")
			{
			say("@They are a group of men and women which rob those who journey outside the protective walls of cities.@");
			say("@They are an interesting group which are elusive and shadowy when attempting to gather information about them.@");
			say("@They seem to have a central leader, though it is my belief that this leader is actually a sub-leader of an even greater organization.@");
			if(inParty(162))
			{
                say("@I see that Tseramed is with you. He had been a contact that I have not heard from in some time. What happened to you?@");
                UI_show_npc_face1(281,0);
                say("@I had been uncovered by the bandits but luckily I was set free by our friend here.@");
                UI_remove_npc_face1();
                say("@Well it is good to see you are alright. I began to fear for you.@");
            }
            else
            {
			say("@I had a contact within the Northern Bandits, but I have not heard from him in some time. I do hope he is safe.@");
            }
			UI_remove_answer("Plains Bandits");
			


			}
		else if (response == "Camille")
			{
			say("@I have heard how you uncovered a plot by the bandits to infiltrate Castle Dew. It is truely fascinating and offers me much insight into their inner workings.@");
			say("@If you could explain to me how you did uncover the plot it would be most informative.@");
			UI_remove_answer("Camille");
			UI_add_answer("Explain");
			}
		else if (response == "Explain")
			{
			say("@You say you had learned of a codeword from an ousted leader of the bandits? Fascinating.@");
			say("@If you couldst return to this fellow and obtain information about the power structure of the Plains Bandits I would be in your doubt.@");
			UI_remove_answer("Explain");
			gflags[BANDIT_STRUCTURE] = true;
			}
		else if (response == "Bandit Power Structure")
			{
			say("@So my theory about the Plains Bandits merely being a subsection of an even greater organization is correct!@");
			say("@It is amazing that such a large organization could exist in these lands shadows.@");
			say("@If you couldst learn more about this perhaps you could even bring down the entire organization and free the lands of that menace!@");
			UI_remove_answer("Bandit Power Structure");
			}
		else if (response == "Goblin Scroll")
			{
			say("@You have brought me a goblin scroll to see? Wonderful ! Tis very rare for one to come across such an artifact.@");
			say("@I shall begin to decipher it at once. Return to me later and I shall let you know the contents.@");
			UI_remove_party_items(1, 707, 51, -359); // removes the scroll
			gflags[GOBLIN_SCROLL] = true;
			UI_remove_answer("Goblin Scroll");
			}
		else if (response == "Deciphered Scroll")
			{
			say("@I have deciphered the scroll somewhat. It appears as if the goblins are not nearly as dumb as we previously thought.@");
			say("@It appears this Gruplinort was actually one of the slower of the intelligent goblins. They seem to have sent him to the front lines in order to trick us about their intelligence level.@");
			say("@This  concern me greatly. The goblins were never this cunning in the past. Something must have happened recently to give them this ability.@");
			say("@I fear the answer will lie only in their city. If we are to discover why, you must venture there, which will be no easy task.@");
			say("@I will inform Hectar about this development immediately.@");
			UI_remove_answer("Deciphered Scroll");
			gflags[GOBLIN_INTELLIGENCE] = true;
			}
		else if (response == "Notable Locations")
			{
			say("@Which locations would you like to know about?@");
			Yesserm_Notable_Locs();
			UI_remove_answer("Notable Locations");				

			}

		else if (response == "Graethe's Disappearance")
			{
			say("@You claim that Knight Graethe disappeared after venturing south? Very strange. Perhaps there is more to the tales of the liche than I first believed.@");
			UI_remove_answer("Graethe's Disappearance");
			UI_add_answer("Liche");
			}
		else if (response == "Liche")
			{
			say("@Tales have been passed down from generation to generation about a terrible undead creature which supposedly inhabits the mountain.@");
			say("@I cannot provide you with much more information about the subject except that it supposedly takes villagers to feast on every so often.@");
			say("@There is a jester which lives nearby the mountains. I suggest you seek him out and enquire about the liche, for he would know the most about it.@");
			say("Yesserm ponders for a moment. @You will need some sort of vessel to reach where the jester lives.@");
			say("@I know the local member of the Nautical Guild has a skimmer in the harbour. Perhaps you can speak with him to gain use of this vessel.@");
			UI_remove_answer("Liche");
			gflags[JESTER] = true;
			}
		else if (response == "The Liche")
			{
			say("@The tales of the liche were true? How interesting! You must tell me all about it.@");
			
			UI_remove_answer("The Liche");
			UI_add_answer("Tell Tale");
			}
		else if (response == "Tell Tale")
			{
			say("@Amazing, simply amazing. I cannot believe that such a creature lived for so long, and was working with the goblins! I shall write this in my notes immediately.@");
			gflags[LICHE] = true;
			UI_remove_answer("Tell Tale");
			}
		else if (response == "Bandit Scroll")
			{
			say("@You claim to have a scroll of the corpse of a bandit? This could be the break that we have been looking for. Please, hand it over.@");
			UI_remove_answer("Bandit Scroll");
			UI_add_answer("Give Scroll");
			}
		else if (response == "Give Scroll")
			{
				if (banditscroll > 0)
				{
				say("@It appears to be empty on the surface, but what it actually contains is much more useful. I have managed to decipher it. Take this, it should prove most useful on your quest.@");
				UI_remove_party_items(1, 797, 53, -359); // removes the scroll
				UI_add_party_items(1, 797, 54, -359);
				UI_remove_answer("Give Scroll");
				gflags[BANDIT_SCROLL1] = true;
				}
				else
				{
				say("@I need the scroll in order to examine it!@");
				UI_remove_answer("Give Scroll");
				}
			}	


		else if (response == "Bot Log")
			{
			say("@You were wise to come to me after speaking with Dyson about these logs.@");
			say("@Although I do not understand the programming of these completely the log is fairly clear.@");
			say("@It appears that Dyson himself programmed the bot to shut down at a certain time and reactivate shortly after.@");
			say("@However, it appears that at some point either before or during the breakout the prison bot was damaged severly which caused the programming to not revert as it should have.@");
			say("@Eventually it activated again with its most basic programming, in this case to provide food and protection to the prisoners of the Sugar Caves.@");
			say("@The damage to its programming remained however. Since it was no longer in the Sugar Caves and it took upon itself to provide food and protection to those that found it.@");
			say("@It appears that it provided food in the form of human meat which it gained from foes which it felt were a threat to those it protected. I will not explain more for it is quite disgusting.@");
			say("@Regardless, you must take this information I have told you to Hector. It proves that Dyson was the inside contact for the prison break.@");
			gflags[DYSON_GUILTY] = true;
			UI_remove_party_items(bot_log); // removes the log
			UI_remove_answer("Bot Log");
			}




		else if (response == "Orb of Transfiguration") // Read the Liches scroll and talked to Hectar
			{
			say("@Yes, I have heard of the Orb of Transfiguration. Legend has it that it is one of five minor orbs that make up the Orb of Infinity.@");
			UI_remove_answer("Orb of Transfiguration");
			UI_add_answer("Orb of Infinity");
			UI_add_answer("Minor Orbs");
			}
		else if (response == "Orb of Infinity")
			{
			say("@The Orb of Infinity is said to be a powerful magical artifact capable of rendering its holder supreme power, even the ability to bend space and time itself.@");
			say("@I know that two of the individual orbs exist but I had thought them lost to the ages, never again to be touched by mortal hands.@");
			say("@I am unsure if the other orbs exist, and if so, if they are able to be combined to create the Orb of Infinity or if that is merely an old legend.@");
			say("@If you wish to know more, perhaps you should visit the library. There was a book written about the artifact called 'The Orb of Infinity'.@");
			say("@If you learn anything useful I suggest you take this information to Hectar.@");
			UI_remove_answer("Orb of Infinity");
			gflags[SPAWN_ORB_BOOK] = true;
			}
		else if (response == "Minor Orbs")
			{
			say("@The Orb of Infinity is supposedly made up of five seperate minor orbs. One of these being the Orb of Transfiguration which you asked me about.@");
			say("@I only know of evidence to support the existence of two of these minor orbs, the Orb of Transfiguration which you have mentioned, and the Orb of Persuasion.@");
			say("@You can learn more about this if you visit the library and search for the book entitled 'The Orb of Infinity'.@");
			gflags[SPAWN_ORB_BOOK] = true;
			UI_remove_answer("Minor Orbs");
			}



		}
	UI_remove_npc_face(item);
    }
}




















