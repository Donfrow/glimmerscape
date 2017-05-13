/*
The Lord of Flame in the southern mountains
*/

void Retrieve_Ice_Dragon_Blood()
{
UI_push_answers();

converse(["Yes", "No"])
{
	case "Yes" (remove):
	say("@This is most wonderful! Return to me with a bucket of blood from an ice dragon and I may reward you after I have completed my experiment.@");
	gflags[RETRIEVE_BLOOD] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("You can see the intensity of the flames in the mans eyes. @You are not worthy to aid me anyway.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}


}


void Lord_of_Flame object#(0x583) ()
	{

var bark = "Who is this that speaks to me?";
var bark_intro = "Hail";

var dragon_blood = UI_count_objects(PARTY, 810, 9, 2);

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
				UI_item_say(item, "Fire is lifeblood");
			else if (n == 2)
				UI_item_say(item, "Embrace the fire");
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
        call Lord_of_Flame, TALK;
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
		say("The fire burns brightly in the mans eyes. @I see you have returned.@");
		UI_remove_answer("Name");

	}
else
	{

		say("A man stands before you with fire in his eyes. @It has been sometime since someone has dared to enter my home.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if(gflags[RETRIEVE_BLOOD] && dragon_blood > 0)
{
	UI_add_answer("Ice dragon blood");
}

    converse
    {
        if (response == "Bye")
        {
            say("@Yes, you must be on your way.@");
            break;
        }
        else if (response == "Name")
        {
            say("@You stand before the Lord of Flame.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@Ha! What a simple question. My job is to harness the power of fire.@");
            UI_remove_answer("Job");
            UI_add_answer("Simple question");
            UI_add_answer("Harness");
            UI_add_answer("Power of fire");
        }
        else if (response == "Simple question")
        {
			say("@Indeed a simple question. What else could the Lord of Flame do?@");
			UI_remove_answer("Simple question");
        }
        else if (response == "Harness")
        {
			say("@Fire is the greatest force in the lands, even greater than death. Only fire can bring and take life of its own accord. That power must be harnessed.@");
			UI_remove_answer("Harness");
        }
        else if (response == "Power of fire")
        {
			say("@What other force brings life to creatures merely through its own existance? Wind? Water?@");
			say("The man does not even wait for you to respond. @That is right! Nothing but the flames.@");
			UI_remove_answer("Power of fire");
			UI_add_answer("Life");
			UI_add_answer("Creatures");
			UI_add_answer("Wind");
			UI_add_answer("Water");
			UI_add_answer("Ice");
        }
        else if (response == "Life")
        {
			say("@Fire breathes life into one of the greatest creatures in the world.@");
			UI_remove_answer("Life");
			UI_add_answer("Greatest creature");
        }
        else if (response == "Greatest creature")
        {
			say("The man grins. @The phoenix is the greatest creature to exist, born of the ashes. Living of the ashes. Immortal while by surrounded by flames.@");
			say("@Only through the phoenix shall I truely understand the flames.@");
			UI_remove_answer("Greatest creature");
			UI_add_answer("Phoenix");
        }
        else if (response == "Phoenix")
        {
			say("@One lives in the molten depths which you are in. One day when my experiment is closer to perfection I shall recover an egg from the creature.@");
			UI_remove_answer("Phoenix");
			UI_add_answer("Egg");
        }
        else if (response == "Egg")
        {
			say("@The egg of a phoenix grows off the surrounding flames. This greatness must be studied!@");
			UI_remove_answer("Egg");
        }
        else if (response == "Creatures")
        {
			say("@No doubt you encountered some of the fire elementals getting to my lair. If you have not surely you have encountered my servant.@");
			UI_remove_answer("Creatures");
			UI_add_answer("Fire elemental");
			UI_add_answer("Servant");
        }
        else if (response == "Fire elemental")
        {
			say("@Creatures with no innate intelligence that grow from the flames. Simple creatures to harness when one unders the power of fire such as myself.@");
			say("@They also make lovely decorations when one learns how to harness the fire that burns through their very bodies.@");
			UI_remove_answer("Fire elemental");
			UI_add_answer("Decorations");
        }
        else if (response == "Decorations")
        {
			say("The man grins. @The statues that adorn my lovely home are real fire elementals, frozen in a moment of time, perpetually burning through my understanding of fire.@");
			UI_remove_answer("Decorations");
			UI_add_answer("Frozen");
			UI_add_answer("Perpetually burning");
        }
        else if (response == "Frozen")
        {
			say("@An odd choice of words I do suppose.@");
			UI_remove_answer("Frozen");
        }
		else if(response == "Perpetually burning")
		{
			if(gflags[RETRIEVED_BLOOD])
			{
				say("@Nothing can perpetually burn away from the lifeblood that is these caverns. Nothing except the torch I have constructed using the ice dragon blood you provided that is.@");
			}
			else
			{
				say("@Sadly nothing can perpetually burn away from the lifeblood that is these ever burning caverns. Though I have been looking at performing a certain experiment for some time...@");
				UI_add_answer("Experiment");
			}
			UI_remove_answer("Perpetually burning");
		}
		else if (response == "Experiment")
		{
			if(gflags[RETRIEVE_BLOOD])
			{
				say("@As I have already explained to you I need the blood of an ice dragon to continue my experiment. Return this to me and perhaps I shall reward you for your service.@");
			}
			else
			{
				say("@I have a theory on how to create a torch which will never extinguish, regardless of where one takes it. I am simply missing one component...@");
				UI_add_answer("Component");
			}
			UI_remove_answer("Experiment");
		}
		else if (response == "Component")
		{
			say("@Oddly enough the component I require is the blood of an ice dragon. Such a beast lives in the caverns of the Frigid Plains and I do not particularly want to travel to such a place.@");
			say("You see a smirk cross the mans face. @If you could retrieve a bucket of ice dragon blood for me I could complete my experiment... what do you say? Will you fetch me some ice dragon blood?@");
			Retrieve_Ice_Dragon_Blood();
			UI_remove_answer("Component");
		}
        else if (response == "Servant")
        {
			say("The mans eyes widen. @Indeed, a servant! Through my understanding of fire I have managed to domesticate one of the fire elementals which adorn these molten depths.@");
			say("@It was no easy task but my understanding of fire has made it possible. I have even taught it basic speech and understanding.@");
			UI_remove_answer("Servant");
			UI_add_answer("Speech");
        }
        else if (response == "Speech")
        {
			say("The man appears giddy. @It is rudimentary and undeveloped but it can communicate! Go speak with it and see!@");
			UI_remove_answer("Speech");
        }
		else if (response == "Wind")
		{
			say("@I will not deny that the wind is a strong force but it is incapable of creating life from it. Have you ever seen a creature of the wind?@");
			say("He lets out a boisterous laugh. @Of course not! The wind merely blows that which already exists. Yet, wind can help to feed a struggling fire by providing it oxygen.@");
			say("@It is quite an element but it is nothing compared to fire.@");
			UI_remove_answer("Wind");
		}
		else if (response == "Water")
		{
			say("It seems that the man lets out some sort of hiss. @A terrible element. Water is needed by many creatures for survival, myself included, but it is disastraous to fire when combined with it.@");
			say("@Yet fire, nay I should say heat, has some control over water as well. Remove the heat from water and it becomes ice, trapped in its motions until heat decides to again set it free.@");
			UI_remove_answer("Water");
			UI_add_answer("Ice");
		}
		else if (response == "Ice")
		{
			say("@Ice is so pathetic. Without precious heat water is nothing but ice. Still, this does not stop those of insane minds from studying it, worshipping it if you will.@");
			say("The man growls. @Such people are fools if you ask me but they are still dangerous. There is one particular woman who seeks to bring the reign of ice upon all the lands. She is known as The Ice Witch.@");
			say("He stares at you with his fire touched eyes. @Not that this concerns me down here, but it would be a terrible thing for the entire land to be like that of the frozen northlands.@");
			UI_remove_answer("Ice");
			UI_add_answer("Ice Witch");
			UI_add_answer("Frozen northlands");
		}
		else if (response == "Ice Witch")
		{
			say("He quickly snaps back as you question this. @A horrid woman. A woman bent on turning the entire lands into that of a frozen, water covered wasteland.@");
			say("@She loves all things cold, all things frozen. She revers the frozen giants in the great caverns of the northlands instead of the lovely fire elementals.@");
			say("The man becomes enraged. @We will speak no more of this horrid woman.@");
			UI_remove_answer("Ice Witch");
		}
		else if (response == "Frozen northlands")
		{
			say("@A terrible place is the northlands. The ground, the caves, everything covered in frozen water. No matter where you go you are surrounded by water in some form. It is a horrendous thought.@");
			say("@While I would prefer the entire area to be a dry, burning desert I realize this is unlikely to happen... yet. In fact, I would be content if the climate there were moderate. Anything to get rid of a land of water.@");
			UI_remove_answer("Frozen northlands");
		}
		
		else if (response == "Ice dragon blood")
		{
			say("As you present the blood to the Lord of Flame his eyes light up. @Excellent, excellent! Now to see if my theories are correct...@");
			say("He hurries over to one of his tables and begins handling different beakers and jars with incredible speed. After several minutes of creating bubbling concoctions he returns to you.");
			say("@Using all my magical knowledge I have created it, an object which will never cease burning. I present to you a torch, and not just any torch, but a torch will never extinguish.@");
			say("He ponders for a moment. @Of course, to be certain one would need to travel the lands with it to ensure it stays burning whereever it goes.@");
			say("The man reaches out to you and gives you the burning torch. @I give this to you to use in your travels. Should it ever extinguish return to me at once, for this means I have failed.@");
			UI_remove_party_items(1, 810, 9, 2);
			UI_add_party_items(1, EVERBURNING_TORCH, ANY, ANY);
			gflags[RETRIEVED_BLOOD] = true; // make it so he speaks differently and you can never do this quest again
			gflags[RETRIEVE_BLOOD] = false;
			UI_remove_answer("Ice dragon blood");
		}

		
}
	UI_remove_npc_face(item);
	}
}
