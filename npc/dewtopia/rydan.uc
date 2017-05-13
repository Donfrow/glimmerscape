/*

Rydan the outed Bandit leader in the caves

*/




void RydanPowerStructure()
{
UI_push_answers();
converse(["Hierarchy", "Nevermind"])
{
	case "Nevermind" (remove):
	say("@But of course...@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Hierarchy" (remove):
	say("@I was not in fact the overall leader of the bandits, merely the leader of the Plains Bandits. The organization actually has three factions, all of which report to a central authority.@");
	add(["Factions", "Central authority"]);
	
	case "Factions" (remove):
	say("@You already know one of the factions and that is the Plains Bandits. What you may not be aware of is that bandit factions are now located as far north as Brentonia and as far east as DeathScorn.@");
	add(["Northern Bandits", "Eastern Bandits"]);
	
	case "Northern Bandits" (remove):
	say("@The Northern Bandits are just as ruthless as the Plains Bandits. Weary travellers who believe they have finally passed the danger of the plains often find themselves ambushed by the Northern Bandits.@");
	say("You almost think he grins behind his bandana. @Only fools would think they are safe from bandits.@");
	
	case "Eastern Bandits" (remove):
	say("@The Eastern Bandits are a relatively new bandit faction and it is the first attempt at the bandits to spread out across the mainland.@");
	say("@I have not heard much regarding the Eastern Bandits and rumour has it they may have run into some complications.@");
	add(["Complications"]);
	
	case "Complications" (remove):
	say("@I do not know what complications they may have encountered.@");
	
	case "Central authority" (remove):
	say("@Right down to the main point with you. As I mentione I was merely a leader of a faction. There is actually a main authority which operates out of a mountain fortress on the western mainland.@");
	gflags[BANDIT_STRUCTURE1] = true;
	add(["Mountain fortress"]);
	
	case "Mountain fortress" (remove):
	say("@I cannot tell you much as I was only there once and this visit was very brief. What I can tell you is that treasure taken from those throughout the land can be found there.@");
	say("@Of course only a fool would attempt to gain access to it.@");
	add(["Treasure", "Access"]);
	
	case "Treasure" (remove):
	say("His eyes light up. @More treasure than one could ever dream of. Each faction pays a tribute to the top leadership and this is where it ends up.@");
	say("@You have no idea how much of my hard plundered loot I had to give up to that place...@");
	
	case "Access" (remove):
	say("@Only a fool would attempt to gain access to this place but if you must know I shall induldge you.@");
	say("@Three keys are needed to access the mountain, one carried by the bandit leader of each faction.@");
	add(["Keys"]);
	
	case "Keys" (remove):
	say("@These are no ordinary keys. Alone each key is useless for all three must be combined to form a single key which unlocks the iron entrance of to the mountains.@");
	say("He narrows his eyes. @And the only time these keys are in one place is when each faction is paying tribute.@");
	add(["Obtain keys"]);
	
	case "Obtain keys" (remove):
	say("@If you wish to obtain the keys you will need to hunt down the leader of each faction. You should have already found one of them on Geth's lifeless body.@");
	say("@Once you possess all three keys combine them together to form a single key that will grant you access to the mountain.@");
	say("@Personally I would think you to be a fool to attempt this but if you were to somehow succeed in overtaking the mountain you would possess untold treasures.");
	
}
}

void RydanSlayGeth()
{
UI_push_answers();
converse(["I will slay Geth", "Say nothing"])
{
	case "Say nothing" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "I will slay Geth" (remove):
	say("@Wonderful, return to me with his head and in return I shall provide you with the information you desire.@");
	gflags[RYDAN_INFO] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;	
}
}

void Rydan object#(0x529) ()
	{
	
var geth_head = UI_count_objects(PARTY, HEADS, ANY, 0);

if (event == DOUBLECLICK)
{

var bark_intro = "Hail";
var bark = "What do you want";

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
        call Rydan, TALK;
    }
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
	say("@What do you want?@");
	UI_remove_answer("Name");
	}
else
	{
	say("@I dare say you are in for a challenge if you are another here to claim the bounty on my head.@");
	UI_set_item_flag(item, MET, true);
	}

if (UI_is_dead(-283) == true) 
	{
		if(gflags[RYDAN_INFO])
		{
			UI_add_answer("Information");
		}
		if(gflags[CAMILLE_CAUGHT])
		{
		UI_remove_answer("Information");
		}
	}
	
if (gflags[BANDIT_STRUCTURE])
	{
        UI_add_answer("Plains Bandits organizational structure");
	}
	// End of opening IF
	

		converse
		{
		
	if (response == "Bye")
			{
                say("@Careful...@");			
                break;
			}
		else if (response == "Name")
			{
                say("@Not that my name means anything anymore, but I am Rydan.@");
                UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
                say("@You make me laugh! I have no job! With a bounty on my head I dare not leave these caves unless I must!@");
                UI_remove_answer("Job");
                UI_add_answer("Bounty");
			}
		else if (response == "Bounty")
			{
                say("@I used to lead the Plains Bandits until that bastard Geth ousted me from power.@");
				say("@Although I managed to escape with my life I am forced to live like a common beggar as Geth put a large bounty on my head.@");
                say("@And if you think you can claim it you will soon find out just how mistaken you are.@");
                UI_remove_answer("Bounty");
                UI_add_answer("Geth");
                UI_add_answer("Plains Bandits");
			}
		else if (response == "Plains Bandits")
			{
                say("@A cunning and ruthless bunch we are... or should I say were. Without my leadership they will surely soften.@");
                say("He snarls. @But that no longer concerns me as those dogs wish me dead.@");
                UI_remove_answer("Plains Bandits");
			}
		else if (response == "Geth")
			{
                say("@He is strong willed and fierce but not as cunning as I. Unfortunately he was cunning enough to oust me from power and take control of the Plains Bandits.@");
                say("He snarls. @I would like nothing more than to see him dead yet I dare not venture outside of these caves.@");
                say("@In fact, I could tell you some information about a plan I had put in place before I was ousted if you would slay him and bring me his head.@");
                UI_remove_answer("Geth");
                UI_add_answer("Information");
			}
		else if (response == "Information")
			{
				if (geth_head == 1 || gflags[GOT_RYDAN_INFO]) 
				{
                    say("@As you has slain Geth and brought me his head I shall provide you with information.@");
                    say("@Before I was ousted I had a plan set in motion to setup a spy within the Royal Mint of Dewtopia.@");
                    say("@Camille, a particularly brutal bandit was to setup the royal cook and have her sent to the Sugar Caves so that she could become the royal cook.@");
                    say("@Once she was within the castle she was to provide information on the schedules and routine of those within the castle.@");
                    say("@Once this was setup a group of bandits was to rob Dewtopia of all its treasure which would cause chaos and disruption within the city.@");
                    say("@I have no idea how far along the plan has progressed since I have been forced to live in this cave.@");
                    say("He thinks for a moment. @If you were to reveal this information to the guards in Dewtopia surely this would damage the bandits in a unrecoverable way.@");
                    say("@But you will require some sort of proof...@");
                    say("@If Camille have already infiltrated the castle tell her that the dog barks at midnight.@");
                    say("@This will let her know she can trust you and should provide a message to return to Geth about those within the castle.@");
                    say("@You should be able to use this information to out her and ruin the plan.@");
                    say("@Oh, and you can do what you wish with the head.@");
                    UI_remove_answer("Information");
                    gflags[DOG_BARK] = true;
					gflags[GOT_RYDAN_INFO] = true;
				}
				else
				{
                    say("@I had a cunning plan in place before I was ousted which Geth has claimed as his own.@");
                    UI_remove_answer("Information");
					if(gflags[RYDAN_INFO])
					{
						say("@And as I have mentioned, if you slay Geth for me I shall let you know of it all.@");
					}
					else
					{
						say("@If you agree to slay him I shall provide you with information which will ruin all of those mutinus dogs.@");
						RydanSlayGeth();
					}
                    UI_add_answer("I will slay Geth");
				}
			}

		else if (response == "Plains Bandits organizational structure")
			{
                say("@You wish to know of the structure of the plains bandits? As I am now marked for death by them, it concerns me not if I let you know their secrets.@");
				say("@In fact, it would pleasure me greatly to see them fall.@");
				RydanPowerStructure();

			}

		}
	}
	UI_remove_npc_face(item);
	}
