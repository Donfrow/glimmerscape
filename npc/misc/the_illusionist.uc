/*
Illusionist in mad mage island caves
*/


void The_Illusionist object#(0x58b) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Do not trust your eyes";
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
				UI_item_say(item, "The world is not as it appears");
			else if (n == 2)
				UI_item_say(item, "Do not trust your senses");
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
        call The_Illusionist, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@Have you returned or do you merely think you have returned as that is what your eyes tell you?@");
	
}
else
{
	say("@Can you truely trust what you see before you?@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

if(gflags[GOT_WAND])
{
	add(["Passed the test"]);
}
	
converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
		say("The man waves his hand. @Do not trust what your senses tell you.@");
		break;
	
	case "Name" (remove):
		say("@Will you trust what you hear with your ears? Or am I merely projecting what you hear? It is for you to decide if I actually call myself The Illusionist.@");
	
	case "Job" (remove):
		if(female)
		{
			say("@My lovely looking lady, my job is to spend time testing if what we all see, touch, smell, hear and taste is truely what we experience.@");
			say("@And I must add you would be a lovely addition to my already stunning line up of charmeuses.@");
			add(["Addition", "Experience"]);
		}
		else
		{
			say("@My good sir, my job is to spend time testing if what we all see, touch, smell, hear and taste is truely what we experience.@");
			add("Experience");
		}
	
	case "Addition" (remove):
		say("@Your beauty is so stunning it could be no illusion. Not even I could make an illusion of such perfection.@");
	
	case "Experience" (remove):
		say("@Our senses deliver the world to us, but how much of the world do we actually experience? What we experience may not truely be what the world is.@");
		say("The man stares at you. @But you should know some of this already. The question is are you able to take this to the next level? Are you able to look at yourself and see that which is truely you?@");
		add(["Already", "Next level", "Look at myself"]);
		
	case "Already" (remove):
		say("The man grins. @Did you not pass through the cavern wall despite that your eyes told you it was solid? Did you not step onto the flames despite the intense warmth you felt?@");
		if(gflags[DID_NOT_CHEAT_TO_GET_HERE])
		{
			say("@By passing those small tests I know you are already onto the path of questioning everything you experience.@");
		}
		else
		{
			say("@Oh wait, you did not. You cheated to get here. Cheaters never win.@");
		}
		add("Questioning");
	
	case "Questioning" (remove):
		say("@It would seem you question what you hear more than your other senses. While this is a good start you must question all of your senses equally.@");
		add(["Equally"]);
	
	case "Equally" (remove):
		say("@Only by questioning all of your senses equally can you experience the truth of everything.@");
	
	case "Next level" (remove):
	if(gflags[GOT_WAND])
	{
		say("@You have already entered into the next level. You have passed the greater test and recovered the Rod of Infinite Thought.@");
	}
	else
	{
		say("@An even greater test is setup for those who wish to question their senses further.@");
	}
	add(["Greater test"]);
	
	case "Greater test" (remove):
	if(gflags[GOT_WAND])
	{
		say("@In order to complete the greater test one must open their senses and question all that they encounter. One must not trust anything.@");
		say("@But you already know this as you have already completed the test.@");
	}
	else
	{
		say("@The test is completely harmless, provided you have mastered the art of questioning your senses. If you have not it can be quite deadly.@");
		say("The man stares you in the eyes. @But for those who are masters of their senses it can be quite rewarding.@");
		add(["Deadly", "Reward", "Test"]);
	}
		
	case "Deadly" (remove):
		say("@The tests which you already passed while getting to my home were relatively harmless. They were merely meant to teach someone not to trust their senses at all times.@");
		say("@In the greater test should you be unable see when you need to question your senses at the appropriate times far greater suffering shall be brought upon you.@");
		add(["Suffering"]);
		
	case "Suffering" (remove):
		say("The man appears to almost be looking through you. @Know that I do not wish to hurt you out of some sort of sadistic desire, only out of a desire to have your mind fully opened.@");
	
	case "Reward" (remove):
		say("The man grins. @Many of those who come before me become blinded when I tell them of the reward and end up perishing in the test. Do not let your greed overcome what you have learned.@");
		add(["What is the reward?"]);
	
	case "What is the reward?" (remove):
		say("The man stares deep into your eyes. @The reward is my most powerful creation, the Rod of Infinite Thought.@");
		add(["Rod of Infinite Thought"]);
	
	case "Rod of Infinite Thought" (remove):
		say("@While the rod itself is bland and dull looking, the power it possesses is great, for it allows the wielder to replenish there mana to full, much like a potion... yet it is not consumed.@");
		say("The man smiles. @It is truely a wonderful reward for those who have opened their mind.@");
		add(["Consumed"]);
	
	case "Consumed" (remove):
		say("@While a mana potion will be consumed by the inbiber leaving nothing behind the Rod of Infinite Thought will forever replenish the wielders mana as long as he possesses it.@");
		say("@However constant usage will require a brief amount of time for it to regenerate its power. Despite this it is still far superior to any mana potion, in more ways than one.@");
		add(["Regenerate", "Mana potion"]);
		
	case "Regenerate" (remove):
		say("@Alas, I was never able to get more than three uses out of it before a recharge was required. After three uses one must wait three hours for it to function again.@");
		
	case "Mana potion" (remove):
		say("@While a mana potion may fully replenish the mana of a unskilled mage who possess little magical energy it is not the case with all mages.@");
		say("@It can often take three or more potions to fully replenish the mana of a skilled mage.@");
		say("@The Rod of Infinite Thought does not suffer from this particular drawback, as it replenishes the entire mana pool regardless of the the skill of the mage.@");
		say("@I am sure many skilled mages curse this particular failure of mana potions. I imagine it is quite cumbersome to carry a large quantity of potions while travelling.@");
		
	case "Test" (remove):
		say("@If you feel you are ready for the test merely walk through the portal. Before you enter know that you may find it difficult to exit, so do not take the choice to enter lightly.@");
	
	case "Look at myself" (remove):
		say("@Look at your inner desires. Look at what your senses tell you. Is what you think you know truely the reality of the world? These are questions you must ask yourself.@");
		
	case "Passed the test" (remove):
		say("@I see that you have managed to pass the test. You are the first to have succeeded among many who have failed. You have truely mastered control of your senses. I hope the rod aids you in your journeys.@");
}

}
}
