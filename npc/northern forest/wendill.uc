/*

Wendill at The Logger's Stump

*/


void Play_Lute_For_Wendill()
{
UI_push_answers();
converse(["I will play for you", "Say nothing"])
{
	case "I will play for you" (remove):
	say("Wendills eyes brighten. @I never expected you to be one who plays the lute! I am so thrilled that you will help me. I have had it planned out for so long.@");
	say("@Each night between six and midnight Joanne eats alone in her house by the Loggers Stump. If you were to play outside her home at this time surely she will come out to see what is going on.@");
	say("@From here you you can give her this bouquet of flowers with a special card I have written. Please let me know how it goes after you have played.@");
	say("@Thank you again!@");
	gflags[PLAY_FOR_WENDILL] = true;
	UI_add_party_items(1, 1478, ANY, ANY); // Bouqet of flowers
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Say nothing" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
}
}


void Sell_Silverleaf(silverleaf_logs)
{
		var amount = UI_input_numeric_value(0, silverleaf_logs, 1, silverleaf_logs);
		if(amount == 0)
		{
			say("@A shame. Do return if you wish to sell them at a later time.@");
		}
		else if (amount >0)
		{
			say("@Excellent! For your Silverleaf logs I will give you ", silverleaf_logs*amount, " gold coins. A pleasure doing business with you.@");
			UI_remove_party_items(amount, SILVERLEAF_LOG, ANY, ANY);
			UI_add_party_items(50*silverleaf_logs, SHAPE_GOLD, ANY, ANY);		
		}
}

void Wendill object#(0x559) ()
	{

var bark = "Hello";
var bark_intro = "Hail";

var silverleaf_logs = UI_count_objects(PARTY, SILVERLEAF_LOG, ANY, ANY);

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
				UI_item_say(item, "Beware of the beasts of the forest");
			else if (n == 2)
				UI_item_say(item, "We could use some rain");
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
        call Wendill, TALK;
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
	say("@You are lucky you were not a bandit or you would already be on the ground.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@If I discover you are a bandit trying to swindle me you will soon meet the end of my axe.@");
	UI_set_item_flag(item, MET, true);
	}

if(gflags[SELL_LOGS])
{
	if(silverleaf_logs >0)
	{
		UI_add_answer("Sell Silverleaf");
	}
}

if(gflags[TELL_WENDILL])
{
	add(["Joanne"]);
}

		converse
		{
	if (response == "Bye")
			{
			say("@Slay a bandit.@");
			break;
			}
		else if (response == "Job")
			{
			say("@I am a lumberjack and on occasional help my parents at The Logger's Stump.@");
			UI_remove_answer("Job");
			UI_add_answer("Parents");
			UI_add_answer("The Logger's Stump");
			}
		else if (response == "Name")
			{
			say("@My parents gave me the name Wendill.@");
			UI_remove_answer("Name");
			}
		else if (response == "The Logger's Stump")
			{
			say("@The Logger's Stump is an inn located here in the Northern Forest. When staying there you can rest assured you will get a delicious meal and warm bed.@");
			if(gflags[NORTHERN_BANDITS_DEAD])
			{
				say("@Hopefully now with the bandits slain business will pick up for the inn.@");
			}
			else
			{
				say("@Though with the bandit activity as of late not many visitors have been showing up due to fear of travelling.@");
			}
			UI_remove_answer("The Logger's Stump");
			UI_add_answer("Bandits");
			}
		else if (response == "Bandits")
			{
			if(gflags[NORTHERN_BANDITS_DEAD])
			{
				say("@They were a cruel group of men who would rob the weak and defenseless. Thankfully you have put an end to their thuggery.@");
			}
			else
			{
				say("@Just as the great plains have trouble with the Plains Bandits, we have to deal with the Northern Bandits.@");
			}
			
			UI_remove_answer("Bandits");
			}
		else if (response == "Parents")
			{
			say("@Apparantly their lifelong dream was to run an inn so together my father Burtan and my mother Wendy work tirelessly at the inn.@");
			say("@I tend to help them out as needed but it is not my ambitions to run a business. I would much rather stay as a lumberjack.@");
			say("@Though my mother does not think I will ever win the heart of Joanne with such a job.@");
			UI_remove_answer("Parents");
			UI_add_answer("Burtan");
			UI_add_answer("Wendy");
			UI_add_answer("Lumberjack");
			UI_add_answer("Joanne");
			}
		else if (response == "Burtan")
			{
			say("@It was his idea to call the The Logger's Stump. I do not believe at first my mother cared for the name but after awhile she came to accept it.@");
			say("@I think it fits, given its location.@");
			UI_remove_answer("Burtan");
			}
		else if (response == "Wendy")
			{
			say("@She helps run the inn with my father but she tends to cook and clean more than deal with administrative duties. She makes some of the finest food in this forest.@");
			say("Wendill leans in and winks at you. @But do not tell her I said that.@");
			UI_remove_answer("Wendy");
			}
		else if (response == "Lumberjack")
		{
			say("Wendill chuckles. @You know, a wood cutter, a man who cuts down trees and sells their corpses.@");
			say("@Seriously though, it is tough work but it is worth it when you get a bag of gold coins for your labours.@");
			if(gflags[LECHUCK_DEAD])
			{
				say("@And with the Nautical Guild sailing again business should pick up soon. If this is the case I will need to hire some part time help soon.@");
				UI_add_answer("Part time help");
			}
			else
			{
				say("@That is when the Nautical Guild is sailing. Currently it is a very poor way of making a living as their is not much to sell the wood to.@");
			}
			UI_remove_answer("Lumberjack");
		}
		else if (response == "Part time help")
		{
			say("@With the Nautical Guild sailing demand for wood is sure to sky rocket. This being the case I am certain that I cannot handle the load all by myself.@");
			say("@At this time I can only afford to pay someone for wood and not hire them outright. If you are interested I will buy any silverleaf logs from you for 20 gold coins.@");
			UI_remove_answer("Part time help");
			UI_add_answer("Silverleaf logs");
			gflags[SELL_LOGS] = true;
		}
		else if (response == "Silverleaf logs")
		{
			say("@Silverleaf is a hard wood which is difficult to cut, but it is excellent for many things from tables to walls. You can tell a Silverleaf tree but their distinctve white trunk and blue leaves.@");
			say("@As I mentioned, if you bring me Silverleaf logs I will pay 20 gold coins per piece.@");
			UI_remove_answer("Silverleaf logs");
		}
		else if (response == "Joanne")
		{
			if(gflags[PLAY_FOR_WENDILL])
			{
				say("@Wendill swoons. @Joanne is so beautiful. She is so wonderful. I am so happy you have agreed to play your lute for me.@");
				say("@Do not forget to play for her between six and midnight and to give her the bouquet of flowers. Thank you again!@");
			}
			else if (gflags[PLAYED_FOR_WENDILL])
			{
				gflags[TELL_WENDILL] = false;
				if(gflags[PLAYED_TERRIBLE])
				{
					say("Wendill glares at you. @When you offered to serenade Joanne for it I naturally assumed you could actually play the lute.@");
					say("@I suspect I could have played better than you! Why would you even make such an offer to me if you could not even play?@");
					say("@Do not answer that. I do not even care. Despite your horrible music Joanne has taken pity on me and is willing to give me a chance.@");
					say("@I just hope she will not always have a deep seeded disappointment in me for this attempt at courtship.@");
					if(gflags[PLAYED_TERRIBLE_KARMA])
					{
					}
					else
					{
						karma = karma - 100;
						KarmaBadSprites();
						UI_set_npc_prop(AVATAR, EXPERIENCE, 150);
						gflags[PLAYED_TERRIBLE_KARMA] = true;
					}
				}
				else if (gflags[PLAYED_MEDIOCRE])
				{
					say("@Wendill sighs at you. @When you offered to serenade Joanne for me I naturally assumed you had some skill with the lute. Why would you offer such a thing when you possess so little skill?@");
					say("@Do not answer that. I do not even care. Despite your mediocre performance Joanne has taken pity on me and is willing to give me a chance.@");
					say("@I just hope she will not always have a deep seeded disappointment in me for this attempt at courtship.@");
					if(gflags[PLAYED_MEDIOCRE_KARMA])
					{
					}
					else
					{
						karma = karma + 50;
						KarmaGoodSprites();
						UI_set_npc_prop(AVATAR, EXPERIENCE, 150);
						gflags[PLAYED_MEDIOCRE_KARMA] = true;
					}
					
				}
				else if (gflags[PLAYED_GOOD])
				{
					say("@Wendill smiles at you. @While I am thankful you agreed to serenade Joanne for me I had thought you would have been some sort of master of the lute.@");
					say("@However, that was my own poor assumptions and I do thank you for playing better than I ever could have.@");
					say("@Joanne was still impressed despite your mistakes in the song and I am thankful that you have opened the door to courtship for me. Thank you again.@");
					if(gflags[PLAYED_GOOD_KARMA])
					{
					}
					else
					{
						karma = karma + 150;
						KarmaGoodSprites();
						UI_set_npc_prop(AVATAR, EXPERIENCE, 150);
						gflags[PLAYED_GOOD_KARMA] = true;
					}
				}
				else if (gflags[PLAYED_GREAT])
				{
					say("A big grin appears over Wendills face. @Joanne loved the performance so much! She could not believe I managed to get such a master of the lute to play for her!@");
					say("@I am so thankful that you have helped me serenade her! I simply cannot thank you enough! I do not know why a player such as yourself would use their musical skills for me but I am so happy.@");
					say("@Thank you again for all you have done. I am sure this will lead the way to a wonderful life with Joanne.@");
					if(gflags[PLAYED_GREAT_KARMA])
					{
					}
					else
					{
						karma = karma + 350;
						KarmaGoodSprites();
						UI_set_npc_prop(AVATAR, EXPERIENCE, 250);
						gflags[PLAYED_MEDIOCRE_KARMA] = true;
					}
				}
				//SET FLAGS HERE FOR HOW YOU PLAYED
			}
			else
			{
				say("Wendill swoons. @Joanne is a young lady who lives in the area. I have had a crush on her for many years but I do not feel I am yet ready to approach her.@");
				UI_add_answer("Approach");
			}
			UI_remove_answer("Joanne");
		}
		else if (response == "Approach")
		{
			say("Blood rushes to Wendill's face as he turns beet red. @Joanne is such a wonderful and refined woman that I feel I must profess my love for her in a special way.@");
			say("@I have been wracking my mind for months trying to figure out how to do this and I have finally figured it out. I am going to learn how to play the lute!@");
			UI_remove_answer("Approach");
			UI_add_answer("Lute");
		}
		else if (response == "Lute")
		{
			say("@I do not feel I will ever be good enough to saranad her with a lovely song but I am too poor to pay a professional to so on my behalf.@");
			say("@I once approached Florendo of Dewtopia about having him be my private tutor but his prices were outrageous and not something I could afford.@");
			say("@Therefore I have no choice but to learn to play it myself. I am self teaching myself through a book. It is a difficult process and I am still quite bad at it.@");
			say("@I just hope that by the time I do become good enough to play for her someone else will not have already swept her off her feet.@");
			UI_remove_answer("Lute");
			if(gflags[PLAY_FOR_WENDILL])
			{
			}
			else
			{
				Play_Lute_For_Wendill();
			}
			UI_add_answer("Florendo");
		}
		else if (response == "Florendo")
		{
			say("@He is a great bard who performs in Dewtopia. Many from around the lands travel to see his performances.@");
			UI_remove_answer("Florendo");
		}
		else if (response == "Sell Silverleaf")
		{
			say("@I see you have brought me some Silverleaf logs! As I mentioned, I will give you 50 gold per log. How many would you like to sell?@");
			Sell_Silverleaf(silverleaf_logs);
			UI_remove_answer("Sell Silverleaf");
		}

		}
	UI_remove_npc_face(item);
	}
}
