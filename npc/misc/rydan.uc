/*

Rydan the outed Bandit leader in the caves

*/

void Rydan object#(0x529) ()
	{
var head = UI_count_objects(PARTY, 799, 5, 5);

if (event == DOUBLECLICK)
{

var bark_intro = "What do you want";
var bark = "Hail";

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

if (UI_is_dead(GETH) == true) 
	{
        UI_add_answer("Information");
	
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
                say("Not that my name means anything anymore, but I am Rydan.");
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
                say("@I used to lead the Plains Bandits until that bastard Geth ousted me from power. Although I managed to escape with my life I am forced to live like a common beggar as Geth put a large bounty on my head.@");
                say("@And if you think you can claim it you will soon find out just how mistaken you are.");
                UI_remove_answer("Bounty");
                UI_add_answer("Geth");
                UI_add_answer("Plains Bandits");
			}
		else if (response == "Plains Bandits")
			{
                say("@A cunning and ruthless bunch we are... or should I say were. Without my leadership they will surely fall soon.@");
                say("@But that no longer concerns me as those dogs wish me dead.@");
                UI_remove_answer("Plains Bandits");
			}
		else if (response == "Geth")
			{
                say("@He is a strong willed and fierce, but not as cunning as I. He did oust me from power and take control of the bandits.@");
                say("@I would like nothing more than to see him dead, however I dare not venture out of these caves.@");
                say("@In fact, I could tell you some information about a plan I had put in place before I was ousted if you would slay him and bring me his head.@");
                UI_remove_answer("Geth");
                UI_add_answer("Information");
			}
		else if (response == "Information")
			{
				if (head == 1) 
				{
                    say("@As you has slain Geth and brought me his head I shall provide you with information.@");
                    say("@Before I was ousted I had a plan set in motion to setup a spy within the Royal Mint of Dewtopia.@");
                    say("@Camille, a particularly brutal bandit was to setup the royal cook and have her sent to the Sugar Caves so that she could become the royal cook.@");
                    say("@Once she was within the castle she was to provide information on the schedules and routine of those within the castle.@");
                    say("@Once this was setup a group of bandits was to rob Dewtopia of all its treasure which would cause chaos and disruption within the city.@");
                    say("@I have no idea how far along the plan have become since I have been forced to live in this cave however.@");
                    say("@If you were to reveal this information to the guards in Dewtopia surely this would damage the bandits in a unrecoverable way.@");
                    say("@But you will require some sort of proof...@");
                    say("@If Camille have already infiltrated the castle tell her that the dog barks at midnight.@");
                    say("@This will let her know she can trust you and should provide a message to return to Geth about those within the castle.@");
                    say("@You should be able to use this information to out her and ruin the plan.@");
                    say("@Oh, and you can do what you wish with the head.@");
                    UI_remove_answer("Information");
                    gflags[DOG_BARK] = true;
				}
				else
				{
                    say("I had a cunning plan in place before I was ousted which Geth have claimed as his own.");
                    say("If you agree to slay him I shall provide you with useful information which will ruin all of those mutinus dogs.");
                    UI_remove_answer("Information");
                    UI_add_answer("I will slay Geth");
				}
			}
		else if (response == "I will slay Geth")
			{
                say("Wonderful, return to me with his head and in return I shall provide you with the information you desire.");
                UI_remove_answer("I will slay Geth");
			}
		else if (response == "Plains Bandits organizational structure")
			{
                say("You doth wish to know of the structure of the plains bandits? As I am now marked for death by them, it concerns me not if I let you know their secrets.");
                say("It is true that I was not the overall leader, merely the leader of the Plains Bandits. The main organization has sent bandits as far north as Brentopia. They are known as the Northern Bandits.");
                say("The bandit headquarters is located somewhere by the mountains to the far west. It is there that the main leadership is stationed.");
                say("If you are foolish enough to attempt to overtake it, you will need several keys from Bandit Leaders throughout these lands in order to gain access to it.");
            	say("The only the keys are all in one place is when the treasure from the various sections is brought together.");
                say("This have passed already, so if you wish to gain access you will have to hunt down the keys yourself. You should already have gained one when you slayed Geth. Now you will need two more.");
                say("If you somehow succeed in overtaking this location, you will be richer than you could possible hope for.");
                UI_remove_answer("Plains Bandits organizational structure");
                UI_add_answer("Other Two Keys");
                gflags[BANDIT_STRUCTURE1] = true;
			}
		else if (response == "Other Two Keys")
			{
                say("The leader of the Northern Bandits possesses one of the keys. The other should be possessed by the Bandits to the far east.");
                UI_remove_answer("Other Two Keys");
			}
        }


		}
	UI_remove_npc_face(item);
	}
