/*
Hectar the head guard
*/

void GranethConvo()
{
UI_push_answers();
converse(["What of him now?", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@Of course.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "What of him now?" (remove):
	say("@The Dewtopian Knights rarely expell a member and when we do we attempt to completely distance ourselves from them as not to bring dishonour.@");
	say("@In other words, I do not know what became of him. That is not to say we do not hear rumours...@");
	add(["Rumours"]);
	
	case "Rumours" (remove):
	say("Hectar shakes his head. @I heard that Graneth took it upon himself to become the 'protector' of those who reside in the plains, for a fee of course.@");
	add(["Protector", "Fee"]);
	
	case "Protector" (remove):
	say("@I use the term loosely. Apparantly the residents must purchase his protection. Those who choose not to pay tend to be beaten and robbed... by Graneth.@");
	say("@Rumour has it that he has even begun calling himself 'The Plains Rider' as if he were some sort of noble hero when in fact he is nothing more than a thug.@");
	say("He sighs. @Frankly I would be happy to hear that Graneth is no more.@");
	add(["No more"]);
	
	case "No more" (remove):
	say("Hectar eyes you coyly. @The Dewtopian Knights cannot officially sanction the execution of a knight, even an ex-knight.@");
	say("He lowers his voice. @That is not to say I would shed a tear if he were to fall. If you would like to 'meet' him perhaps you should ask those in the plains about him.@");
	say("@But I shall talk no more of this.@");
	UI_modify_schedule(-501, 4, LOITER, [1248, 2481]); // loiter by southern mountains destroyed inn
	gflags[KILL_PLAINSRIDER_HECTAR] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Fee" (remove):
	say("@You would have to ask those who reside in the plains about the fees.@");
	
}

}

void Liche_Lair_Search()
{
UI_push_answers();
converse(["Yes", "No"])
{
	case "No" (remove):
	say("@I suggest you search the liche's lair. There must be something we can learn about the goblins within it.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Yes" (remove):
	if(gflags[READ_LICHE_SCROLL])
	{
		say("You relate your findings from the liche's scroll. @The liche spoke of an orb? It is imperative you find out what you can about this orb.@");
		say("@I suggest you speak with Yesserm about it. If anyone in Dewtopia will have heard about this, it will have been him.@");
		gflags[TALK_TO_YESSERM_ABOUT_ORB] = true;			
	}
	else
	{
		say("@You claim to have learned something yet you have nothing to report. I suggest you search the liche's lair to see if you can find anything useful.@");
	}
	UI_clear_answers();
	UI_pop_answers();
	break;
}

}

void CamilleProof()
{

var scroll = UI_count_objects(AVATAR, 797, 50, -359);

UI_push_answers();
converse(["I have proof", "Nevermind"])
{

	case "Nevermind" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "I have proof" (remove):
	if(scroll > 0)
	{
		say("@The scroll you possess clearly proves that Camille is a bandit spy!@");
		say("@I will alert the guard immediately to have her removed from the castle. No doubt Lord Dew will forego a trial and send her directly to the Sugar Caves when he learns of this!@");
		gflags[CAMILLE_CAUGHT] = true;
		UI_remove_party_items(1, GOOD_SCROLL, 50, ANY);

		UI_move_object(-254, [1640, 2092, 0]); // Move Camille to the Sugar Caves
		UI_move_object(-292, [1784, 1878, 0]); // Move Sanala to the castle
					
		// Modify Sanala's schedule to be in the castle
					
		UI_modify_schedule(-292, 2, 18, [1784, 1878]);
		UI_modify_schedule(-292, 6, 23, [1793, 1869]);
		UI_modify_schedule(-292, 7, 14, [1817, 1881]);

		// Modify Camille's schedule to be in the Sugar Caves

		UI_modify_schedule(-254, 3, 8, [1640, 2092]);
		UI_modify_schedule(-254, 6, 8, [1640, 2092]);
		UI_modify_schedule(-254, 7, 14, [1643, 2047]);
	}			
	else
	{
		say("@You claim you have proof, yet you bring me nothing I can work with. You are trying my patience fellow knight.@");
	}
	UI_clear_answers();
	UI_pop_answers();
	break;
}
}

void BanditSlay()
{
UI_push_answers();
converse(["I will slay the bandits", "Say nothing"])
{
	case "I will slay the bandits" (remove):
	say("@If you are able to slay the bandits it would be most appreciated.@");
	gflags[SLAY_BANDITS] = true;
	
	//Set the bandit camp to evil
        UI_set_alignment(-283, HOSTILE);
        UI_set_schedule_type(-283, IN_COMBAT);
        UI_set_opponent(-283, AVATAR);

        UI_set_alignment(-288, 2);
        UI_set_alignment(-289, 2);
        UI_set_alignment(-290, 2);
        UI_set_alignment(-291, 2);
        UI_set_alignment(-286, 2);

        UI_set_opponent(-288, AVATAR);
        UI_set_opponent(-289, AVATAR);
        UI_set_opponent(-290, AVATAR);
        UI_set_opponent(-291, AVATAR);
        UI_set_opponent(-286, AVATAR);

        UI_set_schedule_type(-288, IN_COMBAT);
        UI_set_schedule_type(-289, IN_COMBAT);
        UI_set_schedule_type(-290, IN_COMBAT);
    	UI_set_schedule_type(-291, IN_COMBAT);
        UI_set_schedule_type(-286, IN_COMBAT);
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Say nothing" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;	
}
}

void Hectar_Goblins()
{
UI_push_answers();
converse(["Mage", "Jailmaster", "King", "Nevermind"])
{
	
	case "Nevermind" (remove):
	say("@Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Mage" (remove):
	say("@The intelligence we have managed to gather indicates that the goblins only have one master of sorcery and magic known as Jugral.@");
	say("@It is unlikely that the knowledge the liche provided to the goblins would have been mastered by any but him. It is this reason that it is imperative that he be slain.@");

	case "Jailmaster" (remove):
	say("Hectar scowls. @The few prisoners who manage to escape from the goblins all tell a tale of a vicious goblin who delights in torturing prisoners. We have learned that this goblin is called Murgle.@");
	say("@Any assault on the goblin base must slay this vile creature. Not only would this provide a massive morale boost to our troops but Murgle must pay for what he has done.@");
	
	case "King" (remove):
	say("@The very mention of their leader boils my blood. The goblin king is known as Glur, and it is he who is ultimately responsible for the goblin hordes.@");
	say("@Any attack in the goblin homeland will likely cause Glur to become extremely aggresive. It is for this reason he must be slain during your assault.@");
	say("@Should Glur fall in battle it is no doubt the goblins will be put into a state of chaos, fighting amongst themselves for leadership.@");
	say("@This delay should give us enough time to become strong enough to once and for all wipe out the goblin menace.@");
}
}

void Hectar_Train()
{
UI_push_answers();

party_members = UI_get_party_list();
party_members_count = UI_get_array_size(party_members);

var x = party_members_count;

while(x > 1)
{
var name = UI_get_npc_name(party_members[x]);
add(name);
x = x-1;

}

converse(["Myself","Noone"])
{

	case "Noone" (remove):
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Myself" (remove):
	if(gflags[KNIGHT])
	{
		if(UI_get_npc_prop(AVATAR, TRAINING) < 1)
		{
			say("@You are a skilled knight but you lack the skills needed for training at this time.@");
		}
		else
		{
			var currentDex = UI_get_npc_prop(AVATAR, DEXTERITY);
			var currentCombat = UI_get_npc_prop(AVATAR, COMBAT);
			
			if(currentDex == 30 && currentCombat == 30)
			{
				say("@You are already an excellent study. There is nothing more I can teach.@");
			}
			else
			{
				say("Hectar tells you to swing and watches as you demonstrate you ability with a weapon. @Impressive, but you need to see your target before you swing.@");
				say("@Visualize your weapon striking the target even before you swing, it will help you anticipate any evasive action your opponent takes. Try again.@");
				say("As you swing again Hectar smiles. @This is why you are a knight of Dewtopia. You are quick study. Continue this and you will surely improve in skill.@");
				
				//AVATAR.say("Current dex is ", currentDex, " and current combat is ",currentCombat);
				
				var maxDex = (30-currentDex);
				if (maxDex > 2)
					maxDex = 2;
					
				var maxCombat = (30-currentCombat);
				if (maxCombat > 0)
					maxCombat = 1;
					
				//AVATAR.say("Increasing dex by ", maxDex, " and increasing combat by ", maxCombat);
				
				UI_set_npc_prop(AVATAR, DEXTERITY, maxDex);
				UI_set_npc_prop(AVATAR, COMBAT, maxCombat);
				UI_set_npc_prop(AVATAR, TRAINING, -1);
				
			}
		}
	}
	else
	{
		if(UI_get_npc_prop(AVATAR, TRAINING) >= 1)
		{
			var currentDex = UI_get_npc_prop(AVATAR, DEXTERITY);
			var currentCombat = UI_get_npc_prop(AVATAR, COMBAT);
			
			if(currentDex == 30 && currentCombat == 30)
			{
				say("@You are already an excellent study. There is nothing more I can teach.@");
			}
			else
			{
				if(chargeGold(100))
				{
					say("Hectar tells you to swing and watches as you demonstrate you ability with a weapon. @Impressive, but you need to see your target before you swing.@");
					say("@Visualize your weapon striking the target even before you swing, it will help you anticipate any evasive action your opponent takes. Try again.@");
					say("As you swing again Hectar smiles. @This is why you are a knight of Dewtopia. You are quick study. Continue this and you will surely improve in skill.@");
					
					//AVATAR.say("Current dex is ", currentDex, " and current combat is ",currentCombat);
					
					var maxDex = (30-currentDex);
					if (maxDex > 2)
						maxDex = 2;
						
					var maxCombat = (30-currentCombat);
					if (maxCombat > 0)
						maxCombat = 1;
						
					//AVATAR.say("Increasing dex by ", maxDex, " and increasing combat by ", maxCombat);
					
					UI_set_npc_prop(AVATAR, DEXTERITY, maxDex);
					UI_set_npc_prop(AVATAR, COMBAT, maxCombat);
					UI_set_npc_prop(AVATAR, TRAINING, -1);				
				}
				else
				{
					say("@You do not have enough coin to afford the training.@");
				}
			}

		}
		else
		{
			say("@No doubt you are skilled but you lack the ability needed to train with me. Return when you have increased in ability.@");
		}
	}


	case "Sentri" (remove):
	if(UI_get_npc_prop((-421), TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop((-421), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-421), COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@I cannot train Sentri, he is already as proficient as I and would not learn anything.@");
		}
		else
		{
			if(chargeGold(100))
			{
				say("Hectar looks Sentri up and down. @You look to me as if you are a man of the sea. Swing at me and let me see the skills which the sea has brought you.@");
				say("As Sentri swings Hectar smiles. @You have trained your body to swing as if you are on a boat. On dry land you must avoid compensating for the rocking of the waves. Try again.@");
				say("Sentri swings again and Hectar nods. @I see an improvement. Continue to keep this in mind while fighting and you will surely be a force to be reckoned with, be it on land or sea.@");
				16->show_npc_face1();
				say("@I see what you are saying. I shall try to avoid compensating for waves.@");
				var maxDex = (30-currentDex);
				if (maxDex > 2)
					maxDex = 2;
						
				var maxCombat = (30-currentCombat);
				if (maxCombat > 0)
					maxCombat = 1;
					
				//AVATAR.say("Increasing dex by ", maxDex, " and increasing combat by ", maxCombat);
					
				UI_set_npc_prop((-421), DEXTERITY, maxDex);
				UI_set_npc_prop((-421), COMBAT, maxCombat);
				UI_set_npc_prop((-421), TRAINING, -1);		
			}
			else
			{
				say("@You do not have enough coin to afford the training.@");
				
			}
		}
	}
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}

	
	case "Rufus" (remove):
	if(UI_get_npc_prop((-301), TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop((-301), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-301), COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@I cannot train Rufus, despite his small stature he is already as proficient as I and would not learn anything.@");
			(-301)->show_npc_face1(45);
			say("@That is right, I am mighty!@");
		}
		else
		{
			if(chargeGold(100))
			{
				say("Hectar looks at Rufus. @It is good to see your small size has not been a boon to you in the field of battle.@");
				(-301)->show_npc_face1(45);
				say("@I am not small!@");
				UI_show_npc_face(150);
				say("Hectar laughs. @You can use your size to your advantage Rufus. Take a swing and let me see.@");
				say("As Rufus swings Hectar nods. @You possess a great deal of strength for your size but you are too eager to prove yourself.@");
				say("@You must swing to slay your enemy, not to prove to those around you that you are capable. Keep this in mind as you continue your travels and surely increase in skill.@");
				var maxDex = (30-currentDex);
				if (maxDex > 2)
					maxDex = 2;
						
				var maxCombat = (30-currentCombat);
				if (maxCombat > 0)
					maxCombat = 1;
					
				//AVATAR.say("Increasing dex by ", maxDex, " and increasing combat by ", maxCombat);
					
				UI_set_npc_prop((-301), DEXTERITY, maxDex);
				UI_set_npc_prop((-301), COMBAT, maxCombat);
				UI_set_npc_prop((-301), TRAINING, -1);		
			}
			else
			{
				say("@You do not have enough coin to afford the training.@");
				
			}
		}
	}
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}
	
	case "Rannick" (remove):
	if(UI_get_npc_prop((-6), TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop((-6), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-6), COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@I cannot train Rannick, he is already as proficient as I and would not learn anything.@");
		}
		else
		{
			if(chargeGold(100))
			{
				say("Hectar looks at Rannick. @You seem quite battle hearty. Let me see what you have learned since you left for the goblin caves.@");
				say("As Rannick swing Hectar laughs. @You have become too used to fighting the goblins that you have forgotten how to strike a smaller target. You must remember now all foes will be large.@");
				say("Rannick swings again, this time Hectar smiles. @You were always a quick study Rannick. Keep practicing what I have said and you will continue to increase in skill.@");
				var maxDex = (30-currentDex);
				if (maxDex > 2)
					maxDex = 2;
						
				var maxCombat = (30-currentCombat);
				if (maxCombat > 0)
					maxCombat = 1;
					
				//AVATAR.say("Increasing dex by ", maxDex, " and increasing combat by ", maxCombat);
					
				UI_set_npc_prop((-6), DEXTERITY, maxDex);
				UI_set_npc_prop((-6), COMBAT, maxCombat);
				UI_set_npc_prop((-6), TRAINING, -1);		
			}
			else
			{
				say("@You do not have enough coin to afford the training.@");
				
			}
		}
	}
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}
	
	case "Julia" (remove):
	if(UI_get_npc_prop((-151), TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop((-151), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-151), COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@I cannot train Julia, she is already as proficient as I and would not learn anything.@");
		}
		else
		{
			if(chargeGold(100))
			{
				say("Hectar smiles at Julia. @It is always a pleasure to train female warrior. Let me see how you strike.@");
				say("As Julia swings Hectar moves beside her. @You must let your arms move freely, do not be so rigid and tense. Let me help you as you swing.@");
				say("Julia swings, this time with Hectar holding her arms. @Do you see how much more control you have when you are not so tense? Continue to relax and you will continue to increase in skill.@");
				var maxDex = (30-currentDex);
				if (maxDex > 2)
					maxDex = 2;
						
				var maxCombat = (30-currentCombat);
				if (maxCombat > 0)
					maxCombat = 1;
					
				//AVATAR.say("Increasing dex by ", maxDex, " and increasing combat by ", maxCombat);
					
				UI_set_npc_prop((-151), DEXTERITY, maxDex);
				UI_set_npc_prop((-151), COMBAT, maxCombat);
				UI_set_npc_prop((-151), TRAINING, -1);		
			}
			else
			{
				say("@You do not have enough coin to afford the training.@");
				
			}
		}
	}
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}

	
	case "Tseramed" (remove):
	if(UI_get_npc_prop((-162), TRAINING) >= 1)
	{
		var currentDex = UI_get_npc_prop((-162), DEXTERITY);
		var currentCombat = UI_get_npc_prop((-162), COMBAT);
		
		if(currentDex == 30 && currentCombat == 30)
		{
			say("@I cannot train Julia, she is already as proficient as I and would not learn anything.@");
		}
		else
		{
			if(chargeGold(100))
			{
				say("Hectar looks at Tseramed. @You look like you are quick on your feet. But let me see how you strike with your weapon.@");
				say("Tseramed makes a swing while Hectar looks on. @You are skillful but it seems like you are unsure where you want your blade to travel. See where you wish it to lands. Try again.@");
				say("Tseramed makes another swing. @That was a much more guided swing. As you gain focus you will find it easier and easier for you to strike your target. Keep this up and you will see a big improvement.@");
				var maxDex = (30-currentDex);
				if (maxDex > 2)
					maxDex = 2;
						
				var maxCombat = (30-currentCombat);
				if (maxCombat > 0)
					maxCombat = 1;
					
				//AVATAR.say("Increasing dex by ", maxDex, " and increasing combat by ", maxCombat);
					
				UI_set_npc_prop((-162), DEXTERITY, maxDex);
				UI_set_npc_prop((-162), COMBAT, maxCombat);
				UI_set_npc_prop((-162), TRAINING, -1);		
			}
			else
			{
				say("@You do not have enough coin to afford the training.@");
				
			}
		}
	}
	else
	{
		say("@You possess skill but not enough for you to be worthy of my training. Return to me when you have increased in skill.@");
	}

	
	case "Skynet" (remove):
	say("@I cannot train a machine!@");
	
	case "Artemis" (remove):
	UI_show_npc_face(1);
	say("@I do not have time for this. Take me to the mining operation right this instant!@");
	
	case "Markus" (remove):
	say("Hectar appears to be boggled. @Are you not supposed to be taking this man to Brentonia?@");
	
	case "Bains" (remove):
	say("@Is this not a fugative from justice, here in the city? I think he might be... but he should not have been staying with you this long unless you somehow magically teleported!@");
	say("@Perhaps you should take him back to the entrance of the goblin caves, I believe he may decide to leave you on his own...@");
	
	case "Darnella" (remove):
	say("@You seem out of sorts. You do not want to be here, do you?@");
	528->show_npc_face1(0);
	say("@That's for sure! I am with this fellow for salvage operations only and wish to return to my business as soon as possible.@");
	
}

}


void Hectar_Rivath_Plot()
{
UI_push_answers();

converse(["Mention Virath", "Say nothing"])
{

	case "Mention Virath" (remove):
	say("@It would not surprise me if is false imprisonment for this fellows brother. There is much bandit paranoia as of late. I will have it investigated when I can.@");
	karma = karma + 100;
	KarmaGoodSprites();
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "Say nothing" (remove):
	karma = karma - 100;
	KarmaBadSprites();
	UI_clear_answers();
	UI_pop_answers();
	break;	
}

}

void Slay_Gruplinort()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    
    converse
    {
        if (response == "Yes")
        {
            say("@Excellent. I look forward to your triumphant return.@");
            gflags[SLAY_GRUPLINORT] = true;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("@Very well. I suppose I will have to wait until some troops are available to do this job.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Hectar object#(0x4ff) ()
{

var n = UI_get_random(2);
var scroll = UI_count_objects(AVATAR, 797, 50, -359);
var banditscroll = UI_count_objects(AVATAR, 797, 53, -359);

var gob1 = UI_is_dead(-355); // Goblin mage
var gob2 = UI_is_dead(-354); // Goblin torturer
var gob3 = UI_is_dead(-353); // Goblin king
var orb = UI_count_objects(PARTY, ORB_OF_TRANSFIGURATION, ANY, ANY); // Orb of transfiguration

var grup_head = UI_count_objects(PARTY, HEADS, ANY, 1);
var geth_head = UI_count_objects(PARTY, HEADS, ANY, 0);

if (event == 0)
    {
        if (UI_get_schedule_type(item) == DESK_WORK)
        {

			if (n == 1)
			{
				UI_item_say(item, "The new recruits need work");
            }
			else if (n == 2)
			{
				UI_item_say(item, "Nice");
            }
			return;
        }
		else if (UI_get_schedule_type(item) == SLEEP)
		{
			UI_item_say(item, "Zzzz");
			return;
        }
		else
        {			
			if (n == 1)
			{
				UI_item_say(item, "He looks promising");
            }
			else if (n == 2)
			{
				UI_item_say(item, "Hail Lord Dew!");
			}
        }
    }


var bark = "Greetings.";
var bark_intro = "Hail,";

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
        call Hectar, TALK;
    }
    abort;
}

else if (event == TALK)
{

UI_show_npc_face(item);

if(UI_get_item_flag(item, MET))
{
	if(gflags[GETH_AND_GRUP_DEAD])
	{
		say("@Welcome back noble warrior.@");
	}
	else
	{
		say("@A pleasure to see you again.@");
	}
	add(["Job", "Bye"]);
}
else
{
	say("A battleworn man looks at you. @I do not believe I have seen you before. Welcome to Dewtopia.@");
	add(["Name", "Job", "Bye"]);
	UI_set_item_flag(item, MET);
}


//IF STATEMENTS TO ADD CONVERSATION DEPENDING IF NPC AND FLAGS ARE SET

if(UI_is_dead(-282)) // Gruplinort is dead
{
	if(gflags[SLAY_GRUPLINORT])
	{
	add("Gruplinort is slain");
		if(gflags[GRUPLINORT_SLAIN])
		{
			remove("Gruplinort is slain");
		}
	}
}

if(gflags[KILL_BRUNT])
{
	add("Royal mint robbery");
}

if(UI_is_dead(-283))
{
	if(gflags[SLAY_BANDITS])
	{
		add("Geth is slain");
		remove("Royal mint robbery"); // Remove this as the threat is gone is Geth is dead
		if(gflags[GETH_SLAIN])
		{
			remove("Geth is slain");
		}
	}
}

if(gflags[KILL_SLAY_QUEST_DIALOG])
{
	remove("Gruplinort is slain", "Geth is slain");
}

if(gflags[RUMORS]) // Bandit spy quest
{
	add("Bandit spy");
	if(gflags[RUMORS1])
	{
		if(gflags[PROOF_OF_CAMILLE])
		{
			add("Camille is a bandit");
			remove("Bandit spy");
			if(gflags[CAMILLE_CAUGHT])
			{
				remove("Camille is a bandit");
				add("Camille's fate");
			}
		}
	}
}

if(gflags[KNIGHT]) //MAIN TASK STATEMENTS FOR GOBLIN ASSAULT
{
	add("Tasks");
	if(gflags[GOBLIN_BASE])
	{
		remove("Tasks");
	}
}

if(gflags[GET_POWDER])
{
	add("Rivath's plot");
	if(gflags[TOLD_HECTAR])
	{
		if(gflags[KNIGHT])
		{
			remove("Rivath's plot");
		}
	}
}

if(gflags[READ_BOOK]) // Line leading up to goblin base assault - Must be a knight to readh READ_SCROLL flag
{
	add("Mulgrath's diary");
	remove(["Tasks"]);
	if(gflags[READ_SCROLL])
	{
		add("Graethe found");
		remove(["Tasks", "Mulgrath's diary"]);
		if(gflags[GOBLIN_BASE])
		{
			add("Goblin intelligence");
			remove("Graethe found");
		}
	}
}

if(banditscroll > 0)
{
	add("Bandit scroll");
	if(gflags[BANDIT_SCROLL])
	{
		remove("Bandit scroll");
	}
}

if(gflags[BANDIT_STRUCTURE1] && gflags[KNIGHT])
{
	add("Bandit headquarters");
}

if(gflags[GOBLIN_INTELLIGENCE])
{
	add("New goblin threat");
	if(gflags[GOBLINS_DEFEATED])
	{
		remove("New goblin threat");
	}
}

if(gflags[READ_ORB_BOOK])
{
	add("Orb of Transfiguration");
	remove(["New goblin threat", "Graethe found", "Goblin intelligence"]);
	
	if(gob1 && gob2 && gob3 && orb >0) //Retrieved orb and defeated goblins
	{
		remove(["Orb of Transfiguration", "Goblin intelligence"]);
		add("Goblins defeated");
		if(gflags[GOBLINS_DEFEATED])
		{
			add(["Goblin situation"]);
			remove(["Orb of Transfiguration", "Goblins defeated"]);
		}
	}
}

if(gflags[READ_JAIL_BREAK_BOOK])
{
	add("Sugar Caves breakout");
}

if(gflags[READ_LOG]) // Read botlog from the nearby island
{
	add("Bot log");
	if(gflags[DYSON_GUILTY])
	{
		add("Dyson aided in the breakout");
		remove(["Bot log", "Sugar Caves breakout"]);
		if(gflags[DYSON_ESCAPE]) // After hitting the usecode egg and realizing Dyson has fled
		{
			remove("Dyson aided in the breakout");
			if(gflags[KILL_DYSON_TEXT])
			{
			}
			else
			{
				add("Dyson has fled");
			}

			//ADD A FLAG TO REMOVE THE DYSON HAS FLED AFTER YOU SPEAK TO HIM ABOUT IT
		}
	}
}

converse([])
{

	case "Bye" (remove):
	say("@Slay a goblin!@");
	break;
	
	case "Name" (remove):
	say("He eyes you up. @I am Hectar.@");

	case "Job" (remove):
	say("@I am captain of the guard in Dewtopia. Although as of late I spend more time at my desk issuing orders to the recruits and troops than actual combat or training.@");
	add(["Desk", "Train"]);
	
	case "Desk" (remove):
	say("@At one time I would lead ambushes and raids on the goblins which threaten the city but lately my talents are better used in training, recruitment and other non-combat duties.@");
	say("He sighs. @It has been especially frustrating for me with the increase in bandit activity. I wish I could cut them down with my cold steel but these duties prevent it.@");
	add(["Recruitment", "Trainees", "Bandit activity"]);
	
	case "Recruitment" (remove):
	if(gflags[KNIGHT])
	{
	}
	else
	{
		if(gflags[SLAY_GRUPLINORT])
		{
			say("@As I mentioned earlier Dewtopia is facing an increasing threat and as such it is my duty to recruit the best and brightest to aid in its defense.@");
			if(gflags[GRUPLINORT_SLAIN])
			{
				say("He thinks for a moment. @As you have proven yourself quite skilled if you were to complete one last duty to show your loyalty to Dewtopia I would grant you knighthood.@");
				say("@There is a bandit outpost just north of the city. If you were to slay these scoundrals and bring me their leaders head I would be more than happy to make you a knight.@");
			}
			else
			{
				say("He nods at you. @Do not forget that I will consider making you a member of the guard if you return to me with Gruplinort's head.@");
			}
		}
		else
		{
			say("@Dewtopia is in a time of upheaval. There are increasing numbers of those hostile to Dewotpia and its citizens.@");
			say("@In such tough times it is my duty to recruit the best and brightest to aid in its defense.@");
			say("He thinks for a moment. @You look like a strong adventurer.@");
			say("@There is a goblin encampment to the northwest of the city where a particularly cunning goblin by the name of Gruplinort has an encampment.@");
			say("@If you slay him and bring me his head I will consider making you a member of the guard. This will bring you much respect among the citizens of Dewtopia. What do you say?@");
			Slay_Gruplinort();		
		}
	}
	
	case "Trainees" (remove):
	say("@Lately it has fallen upon me to train those who wish to serve Dewtopia but are not quite ready to fully join the ranks. It is my duty to mold these recruits into skilled Dewtopian soldiers.@");
	say("@One day they will all be fine examples of Dewtopian skill though some can be too headstrong, especially Rufus.@");
	if(UI_is_dead(-500)) // The Plains Rider
	{
	}
	else
	{
		say("He shakes his head. @I simply hope he does not fall prey to the same affliction Graneth did.@");
		add(["Graneth"]);
	}
	add("Rufus");
	
	case "Graneth" (remove):
	say("@Graneth was a young trainee some time ago, before my time. While I never ran into him personally I was told he was quite skilled, but he was also quite head strong.@");
	say("@This skill, along with his attitude, made him believe that he was above everyone else. He constantly instigated fights with townsfolk and knights alike, failed to follow orders and even went missing several times.@");
	say("@Eventually he was dishonourably removed from the Dewtopian Knighthood and ejected from the city.@");
	GranethConvo();
	
	case "Rufus" (remove):
	say("@Rufus thinks he is the greatest gift to ever grace Dewtopia. Unfortunately for him he is quite small in stature. Some citizens even call him Rufus the Small which he hates with a passion.@");
	say("Hectar leands into you. @Personally, I think it is quite funny.@");
	gflags[RUFUS] = true;
	
	case "Bandit activity" (remove):
	say("@A group of rogues known as the Plains Bandits have been terrorizing travellers as a result of the current goblin situation.@");
	say("@They are quite the menance and some people even fear them more than goblins.@");
	if(gflags[GETH_SLAIN])
	{
		say("@Hopefully with Geth slain the bandits will rethink their boldness in regards to those travelling to and from Dewtopia.@");
	}
	else
	{
		say("@In fact one group lead by a bandit by the name of Geth has been so bold as to setup a small outpost in the woods just north of Dewtopia. He seems to have no fear of Dewtopian troops.@");
		say("He shakes his head. @I am sad to say that at this time he is right to have no fear.@");
		say("@If it were not for the goblin problem I would send some troops to dispatch them but I simply do not have the troops to spare.@");
		if(gflags[SLAY_BANDITS])
		{
		}
		else
		{
			BanditSlay();
		}
	}
	
	case "Gruplinort is slain" (remove):
	if(grup_head >0)
	{
		say("@This is wonderful news! You are truely a brave warrior. I just hope that it was not too messy removing the head from such a hidious beast.@");
		say("@I shall spread the word that Dewtopia is now safer from the goblin threat thanks to you.@");
		gflags[GRUPLINORT_SLAIN] = true;
		UI_remove_party_items(1, HEADS, ANY, 1);
		if(gflags[GETH_SLAIN] && gflags[GRUPLINORT_SLAIN])
		{
			say("Hectar smiles at you. @As you have slain two large foes of Dewtopia it is my honour to officially grant you knighthood of this city.@");
			say("@As a knight of Lord Dew you have the authority to arrest deviants and you can enter the Sugar Caves if you so wish.@");
			say("@Personally, I do not enjoy venturing to the caves but, as a knight, it is your choice. You may get a key from Jeroan.@");
			gflags[ENTER_SUGAR_CAVES] = true;
			gflags[GETH_AND_GRUP_DEAD] = true;
			gflags[KILL_SLAY_QUEST_DIALOG] = true;
			gflags[KNIGHT] = true;
			add("Tasks");
		}
		else
		{
			if(gflags[SLAY_BANDITS])
			{
				say("He looks down. @I am sorry if you feel I have lead you on but as I mentioned earlier their is some bandit activity which needs tending to.@");
				say("@If you slay them and bring me the head of their leader I will grant you full knighthood.@");
			}
			else
			{
				say("He looks down. @I am sorry if you feel I have lead you on but there is one more matter which needs tending to. There is a bandit outpost just north of the city that needs to be dealt with.@");
				say("@If you were to slay the bandits and bring me the head of their leader I will grant you full knighthood.@");
				BanditSlay();
			}
		}
	}
	else
	{
		say("@Do not take this the wrong way but the only way I can be certain that Gruplinort is in fact no longer a threat is if you bring me his head.@");
	}
	
	case "Geth is slain" (remove):
	if(geth_head > 0)
	{
		say("@This is excellent news. Hopefully the bandits will think twice next time they want to cause trouble for those Dewtopia offers its protection to. You may do with the head as you wish.@");
		gflags[GETH_SLAIN] = true;
		if(gflags[GETH_SLAIN] && gflags[GRUPLINORT_SLAIN])
		{
			say("Hectar smiles at you. @As you have slain two large foes of Dewtopia it is my honour to officially grant you knighthood of this city.@");
			say("@As a knight of Lord Dew you habve the authority to arrest deviants and you can enter the Sugar Caves if you so wish.@");
			say("@Personally, I do not enjoy venturing to the caves but, as a knight, it is your choice. You may get a key from Jeroan.@");
			gflags[ENTER_SUGAR_CAVES] = true;
			gflags[GETH_AND_GRUP_DEAD] = true;
			gflags[KILL_SLAY_QUEST_DIALOG] = true;
			gflags[KNIGHT] = true;
			add("Tasks");
		}
	}
	else
	{
		say("@Do not take offense but the only way I can be certain that the bandits have been slain is if you bring me the header of their leader.@");
	}
	
	case "Bandit spy" (remove):
	say("@You claim that there is a bandit spy within Castle Dew? If this is true it is most troubling.@");
	say("@However, not that I doubt your convictions you must have more than simple rumors from farmers and convicts before I can take you seriously I am afraid.@");
	UI_remove_answer("Bandit spy");
	gflags[RUMORS1] = true;
	
	case "Camille is a bandit" (remove):
	say("@You had Camille confess her affliation to the Plains Bandits? This is troubling news.@");
	if(gflags[KNIGHT])
	{
		say("@As much as I find it difficult to believe I find it even more difficult to believe a knight of Dewtopia would lie to me about such a thing.@");
		say("@However, if I am to continue with this investigation I will need some form of proof.@");
		add(["Proof"]);
	}
	else
	{
		say("@However, and please do not take offense to this, you have not yet proven yourself to be completely trustworthy. If you were a knight I would not be doubting you.@");
	}
	
	case "Proof" (remove):
	say("@I need something to substantiate your claim that Camille is infact a bandit.@");
	CamilleProof();
	
	case "Camille's fate" (remove):
	say("@Thanks to you Camille has been caught and indeed sent to toil in the Sugar Caves for the rest of her days.@");
	say("@Sanala have also been cleared and allowed to return to her job in the castle. I thank you for uncovering this plot.@");
	
	case "Royal mint robbery" (remove):
	say("@You claim there is an attempt to slay Brunt and rob the Royal Mint? You were wise to come to let me know of this.@");
	say("@As you already have knowledge of this plot and as I cannot spare troops to investigate it I am entrusting you to deal with this matter.@");
	say("@I have no doubt if you handle this matter properly it will aid you in becoming a knight.@");

	case "Tasks" (remove):
	say("@As you are a Knight of Dewtopia I can assign you tasks. At the moment I have a task which requires tending to posthaste.@");			
	say("@To the west of Dewtopia is a house which has been setup for a mage known as Mulgrath. He has been working for Dewtopia under guard of the knight Graethe.@");
	say("@However, Graethe has not sent in his report for some time. Go to this place and investigate why Graethe has not yet sent his report.@");
	
	case "Mulgrath's diary" (remove):
	if(gflags[FIND_GRAETHE])
	{
		say("@As I have already mentioned the contents of the diary concern me. You may wish to speak with Yesserm to learn about the southern mountain range before you travel there.@");
	}
	else
	{
		say("As you relate your findings to Hectar a look of concern appears on his face. @Mulgrath's home has been destroyed and he himself slain? This is disturbing news to hear.@");
		say("@Graethe was one of my finest warriors and if Graethe never showed up to protect him something serious must have happened to him.@");
		add(["Graethe"]);
	}
	
	case "Graethe" (remove):
	say("@Before he was to protect Mulgrath he mentioned that he was planning on exploring the southern mountain in the Dewtopian mountain ranges.@");
	if (gflags[KNIGHT])
	{
		say("@I will assign you to investigate why he did not report for duty. There must be a connection with the goblins.@");
		say("@I suggest you speak with Yesserm to learn any information about the area before you venture there.@");
		gflags[FIND_GRAETHE] = true;
	}
	else
	{
		say("@I shall have to send one of my knights to investigate this. I regret this as I will have to pull one of them off of Goblin and Bandit patrol.@");
	}	
	
	case "Graethe found" (remove):
	say("You relate to Hectar your findings from the liche's cave. @I cannot believe the tales of the liche are true and I am quite sad to learn that Graethe did not suvive his encounter with it.@");
	say("@We have lost a fine warrior this day.@");
	say("@Did you manage to learn anything from him before he died?@");
	add(["Goblin intelligence"]);
	
	case "Goblin intelligence" (remove):
	say("@The liche was in league with the goblins? This would explain their new found intelligence.@");
	if(gflags[TALK_TO_YESSERM_ABOUT_ORB])
	{
		say("@If you have not already, I strongly suggest you to Yesserm about this.@");
	}
	else
	{
		say("@Did you learn anything else?@");
		Liche_Lair_Search();
	}
	
	case "New goblin threat" (remove):
	say("@Yesserm has informed me of the findings from Gruplinort's camp. This is of grave concern to us.@");
	say("@As you have proven yourself to be strong and intelligent I am giving the task to you to discover the cause of the strange new goblin behaviour.@");
	
	case "Orb of Transfiguration" (remove):
	say("@It is quite disturbing if the goblins have come to possess such a powerful artifact. As you have proven yourself resourceful I am tasking you to raid their camp to retrieve it.@");
	say("@While in the camp I ask that you slay three specific goblins. If you can do this it will deal a crippling blow to the goblin threat.@");
	say("@Some time ago we caved in a portion of the goblin tunnels that lead to their encampment in an effort to lower their numbers.@");
	say("@I shall send word to clear this so that you can enter the encampment when you arrive at the caves.@");
	say("@I have placed a knight, Rannick, at the caves to guard it. Have him join you before you enter. You may also bring Rufus along with you should you desire.@");
	say("@Also, before you begin seek out this artifact you may wish to learn more about it. Perhaps you should seek out the author to get a better understanding of it.@");
	say("@It is your choice, but it is best to go into battle with knowledge of your enemies and their powers.@");
	gflags[RUFUS_JOIN] = true;
	gflags[RANNICK_JOIN] = true;
	gflags[GOBLIN_BASE] = true;
	UI_remove_from_area(202, 0, [0x26a, 0x60a], [0x285, 0x61d]);
	add(["Three goblins"]);
	
	case "Three goblins" (remove):
	say("@These are no ordinary goblins that I ask you to slay. These goblins possess greater cunning and wit than a regular goblin.@");
	say("Hectar looks at you. @I am asking that you slay their mage, jailmaster and king.@");
	Hectar_Goblins();

	case "Goblins defeated" (remove):
	say("@It is wonderful to hear that you have successfully raided the goblin encampment, but I hesitate to say that they are defeated. Those beasts multiply like rabbits.@");
	say("@Regardless, you have aided us greatly and proven yourself to be skillful and cunning. It is my honour to grant you the Shield of Valor.@");
	say("@As for the orb, as you are the one who acquired it from the goblins, it is yours to keep and do with as you please.@");
	if (inParty(-6) && inParty(-301))
	{
		say("@You may continue to have Rannick and Rufus accompany you. Dewtopia owes you a great deal of thanks and hopefully their assistance will aid you.@");
	}
	else if (inParty(-6))
	{
		say("@You may continue to have Rannick accompany you. I am certain that he will be of use to you and the city owes you a great deal of debt.@");
	}
	else if (inParty(-301))
	{
		say("@You may continue to have Rufus join you in your adventures. You have proven yourself to be strong and you would be a good teacher for him.@");
	}
	add("Shield of Valor");
	UI_add_party_items(1, 490, ANY, ANY);
	gflags[GOBLINS_DEFEATED] = true;

	case "Goblin situation" (remove):
	say("He sighs. @Despite the blow you dealt against the goblin threat I fear we will never truely rid ourselves of those green skinned thugs.@");
	say("@However with your successful raid on their camp I have a feeling the war is now in our favour. Now we must keep it that way.@");
	
	case "Shield of Valor" (remove):
	say("@The Shield of Valor was granted to me by Lord Dew after I had managed to save an entire village from a goblin raid long ago.@");
	say("@It should only be passed onto the most skilled of warriors and you have proven yourself to be exactly that. The shield is one of a kind, even stronger than a magical shield.@");
	say("@You had best take good care of it. All I ask is that when your fighting days are over that you pass it onto another skilled warrior.@");
	
	case "Bandit scroll" (remove):
	if (gflags[KNIGHT])
	{
		say("@You have a scroll from the corpse of a slain bandit, yet it appears to have nothing on it? You must take this to Yesserm right away.@");
		gflags[BANDIT_SCROLL] = true;
	}
	else
	{
		say("@If you were a knight I could trust that this scroll was actually from a bandit, but as of now I cannot.@");
	}
	
	case "Bandit headquarters" (remove):
	say("@You have learned much about the Plains Bandits. I do not doubt your conviction, but I cannot assign knights in search of keys based off information from such a dubious source.@");
	say("@You may be a knight of Dewtopia but you are not a citizen, so I cannot order you to not proceed with this venture. If you truely believe you can accomplish this, I bid you good luck.@");	
	
	//Sugar cave breakout text
	
	case "Sugar Caves breakout" (remove):
	if (gflags[KNIGHT])
	{
		if (gflags[DYSON_GUILTY1])
		{
			if (gflags[DYSON_ESCAPE])
			{
				say("@It is truely a shame that Dyson managed to escape before he could be apprehended. But, being the criminal he is, I suppose that I will allow you to ransack his lab. Hopefully you can find something useful.@");
			}
			else
			{
				say("@As we have discovered Dyson was a party to the escape all we need to do now is determine where Jesse and Bains are.@");
				gflags[TALK_TO_DYSON] = false;
			}
		}
		else if (gflags[KILLED_BAINS])
		{
			say("@It is good to hear that both Jesse and Bains do not continue to live. It is a shame that we could not place them back into the caves, but at least they are not running free.@");
		}
        else
        {	
			say("@Aye, it is true that we have had an escape from the Sugar Caves. We are attempting to keep it quiet so I am interested in how such a new knight has learned of it.@");
			say("@Unfortunately I have other pressing matters on my mind at the moment. If you come across the escapees during the course of your duties it is your duty as a knight to reprimand them.@");
			say("@If you do catch them learn who did aid them by any means necessary before you return them to the city...@");
			say("He leans into you. @We do not officially condone certain techniques to gather information within city limits.@");
		}
		// If you already have the provider logs

		if (gflags[DYSON_GUILTY])
		{
			gflags[TALK_TO_DYSON] = false;
		}
		if (gflags[TALK_TO_DYSON])
		{
			say("@As you have discovered the missing Prison Bot, please take the logs to Dyson for more information.@");
		}
		else
		{
			add(["Aid"]);
		}
		add("Aid");
		if (gflags[DYSON_GUILTY])
		{
			remove(["Aid"]);
		}

	}   // END BRACKET FOR THAT IF KNIGHT STATEMENT
	else
	{
		say("@I will not discuss such matters with you.@");
	}

	case "Aid" (remove):
	say("@Someone within the city and access to the Sugar Caves must have aided them in the escape.@");
	say("@If you cannot gain this information from them you must find out what happened to the Prison Bot that disappeared during the escape.@");
	say("@This bot provided for the prisoners and should have valuable information in its log file about how the escape took place.@");
	say("@Unfortunately it has disappeared since the escape and I have not the men to spare to search for it just as I do not have them to search for the escapees.@");
	
	case "Bot log" (remove):
	if (gflags[KNIGHT])
	{
		say("@This could be the break we were waiting for to discover who aided Jesse and Bains in their breakout.@");
		say("@Take this log to Dyson who has his shop near the west gate. He should be able to tell you what it contains as he programs the prison bots.@");
		gflags[TALK_TO_DYSON] = true;
		//gflags[TALK_TO_YESSERM] = true;
		remove(["Sugar Caves breakout"]);
	}
	else
	{
		say("@If you were a knight I would believe you, but at this time I have no reason to suspect this is not a forgery.@");
	}
	
	case "Dyson aided in the breakout" (remove):
	if (gflags[DYSON_GUILTY1])
	{
		say("@Yes, I am aware. You have already let me know this piece of information.@");
	}
	else
	{
		say("@This is disturbing news indeed. I shall have Dyson placed in the Sugar Caves for this treachary right away. Thank you for helping uncover this.@");
		say("@As you are the one who uncovered his plot I feel it is only fitting for you to be the one to bring him into custody.@");
		say("@You should do this right away before he realizes that we have uncovered his plot.@");
		gflags[DYSON_GUILTY1] = true;
			// Sets Dyson to go to the house in west forest to chill
		UI_move_object(-12, [289, 768, 0]); // Move Dyson
		UI_modify_schedule(-12, 0, SLEEP, [289, 768]);
		UI_modify_schedule(-12, 2, DESK_WORK, [289, 768]);
		UI_modify_schedule(-12, 4, DESK_WORK, [289, 768]);
		UI_modify_schedule(-12, 6, DESK_WORK, [289, 768]);
		UI_modify_schedule(-12, 7, EAT, [289, 768]);
		party_members = UI_get_party_list();
		party_members_count = UI_get_array_size(party_members);
		if (party_members_count == 1)
		{
			UI_set_npc_prop(AVATAR, EXPERIENCE, 1000);	
		}
		else
		{
			var x = party_members_count;
			while(x > 0)
			{
				
				UI_set_npc_prop(party_members[x], EXPERIENCE, 1000);

				x = x-1;
				
			}
		}
	}
	
	case "Dyson has fled" (remove):
	say("@That man is not only a brilliant technician but sly as a fox as well. Unfortunately I doubt we will ever see him again.@");
	say("@Not to say we will not be keeping an eye out for him but someone as smart as him will no doubt stay out of sight.@");
	say("@Hopefully we will one day be able to bring him to justice.@");
	gflags[KILL_DYSON_TEXT] = true;
	
	case "Rivath's plot" (remove):
	if(gflags[TOLD_HECTAR])
	{
		if(gflags[KNIGHT])
		{
			say("@You have already mentioned this to me. I will investigate it when I have the resources to spare.@");
		}
		else
		{
			say("@I have already told you, I will investigate it when I have the resources to spare.@");
		}
	}
	else
	{
		if(gflags[KNIGHT])
		{
			say("You relate the tale to Hectar about Rivath's plot. @We currently have far more important things to worry about than a fools insane plot.@");
		}
		else
		{
			say("You relate the tale to Hectar about Rivath's plot. @Thank you for the information, I will have it investigated when I have the resources to do so.@");
		}
		Hectar_Rivath_Plot();
		gflags[TOLD_HECTAR] = true;
	}
	
	case "Train" (remove):
	if(UI_get_schedule_type(-255) == DESK_WORK)
	{
		say("@I am an expert in the handling of weapons. You will find my lessons increase your ability to handle and use your weapon of choice.@");
		if(gflags[KNIGHT])
		{
			say("@As you are a knight of Dewtopia I can train you personally for free, however for others I charge 100 gold coins. Who wishes to train?@");
		}
		else
		{
			say("@As my time is very limited as of late I must insist on a fee of 100 gold coins. Who would like to train?@");
		}
		Hectar_Train();
	}
	else
	{
		say("@We can discuss this during my regular working hours.@");
	}	
	
} // End converse

} // End event == TALK



}

/*



/*

		else if (response == "Plains Bandit Base");
		{
			say("@While it is an interesting piece of news I must doubt its validity. Bandits such as these could not have such an organized structure.@");
			say("He sighs. @To be honest, it does intrigue me somewhat but I simple cannot afford to send troops to investigate such wild claims.@");
			UI_remove_answer("Plains Bandit Base");
		}
        
 
    }
	
}

}
*/

