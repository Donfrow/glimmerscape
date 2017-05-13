/*
End game Woman by water
*/

void Sand_Purpose()
{
UI_push_answers();

converse(["Yes", "No"])
{

	case "Yes" (remove):
	say("The woman shakes her head slightly. @Each grain of sand was fated to be here to show you what their purpose was.@");
	say("@Yet that is not the only purpose. For now the purpose of each grain is to forever be on the ground, seperated from each other, and forgotten.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "No" (remove):
	say("The woman shakes her head slightly. @Each grain of sand was fated to be here to show you what their purpose was.@");
	say("@Yet that is not the only purpose. For now the purpose of each grain is to forever be on the ground, seperated from each other, and forgotten.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}
}
void Pebble_Wave()
{
UI_push_answers();

converse(["How so?", "Pebble", "Nevermind"])
{

	case "Nevermind" (remove):
	say("@As you wish.@");
	UI_clear_answers();
	UI_pop_answers();
	break;

	case "How so?" (remove):
	say("@As a pebble lands in the water does it not create a ripple? Do you think this ripple merely disappears, never having any true significance?@");
	say("The woman raises her hand before you can speak. @No, everything is intertwined.@");
	say("@That ripple which you created continued on for many years, manifesting a small part of it in the massive waves and storms of the ocean.@");
	say("@Yet this entire time it was not without purpose. As it travelled the waves it sought to bring to realization its true purpose. Striving to fulfill its destiny.@");
	add(["Destiny", "Intertwined"]);
	
	case "Destiny" (remove):
	say("A beautiful smile appears. @It is this ripple that guided waters, eventually driving the storm which struck your ship, anchoring you in Cotton Cove.@");
	say("@At that time its destiny was fulfilled.@");
	
	case "Intertwined" (remove):
	say("@Everything is connected. As you exhale your breath you could destroy an entire kingdom from disease. But that is not to say that is the sole cause.@");
	add(["Sole cause"]);
	
	case "Sole cause" (remove):
	say("@Rarely is there a sole cause for any outcome which occurs. The cause of an event is commonly a series of smaller, seemingly insignificant occurrences. You merely need to see the connections.@");
	say("@Yet it is not for one such as you to see the connections, but that does not mean the connections do not exist. One simply must have the vision.@");
	add(["Vision"]);
	
	case "Vision" (remove):
	say("The woman motions to her eyes. @Do you think this lack of sight prevents me from seeing the affinities? No, it is that which allows me see them.@");
	add(["Allow you to see"]);
	
	case "Allow you to see" (remove):
	say("@I lack sight in order to truely see.@");
	
	case "Pebble" (remove):
	say("@A small rock, a grain of sand. Size matters not for the purpose something is to serve.@");
	
}
}

void Fate_Woman object#(0x592) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Do the waves push you to me like a leaf?";
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
				UI_item_say(item, "The tides of infinity wave");
			else if (n == 2)
				UI_item_say(item, "The ripples wave through all");
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
        call Fate_Woman, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The woman stares at you despite her blindess. @The waves have pushed you back to me.@");
	
}
else
{
	say("A beautiful blind woman stands before you, seemingly staring directly at you. @You have followed the waves to that which was.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("@Fate is beckoning you.@");
	break;
	
	case "Name" (remove):
	say("@As the waves in the oceans go by a name and the ripples in a puddle call out to be heard I am Nameless.@");
	
	case "Job" (remove):
	say("The woman seems to stare at you despite obvious blindness while answering nonchalantly. @Would you ask the waves as they flow if they have a job? Do the sands on the beach serve a purpose?@");
	add(["Waves", "Sands", "Purpose", "Blind"]);
	
	case "Waves" (remove):
	say("Her arm elegantly motions to the water. @Do the waves ever aspire to be something more or do they merely flow as they must?@");
	add(["Aspire"]);
	
	case "Aspire" (remove):
	say("@Do you aspire to be like the waves? Do you aspire to flow as the current deems so?@");
	say("You feel as if a cold, yet loving stare looks deep within you. @You are as the waves flow, merely serving your purpose as the current guides you.@");
	add(["Current"]);
	
	case "Current" (remove):
	say("@Does the current possess direction, or does it merely flow where it must?@");
	
	case "Sands" (remove):
	say("A smooth arm reaches and picks up sand only to let it flow through her fingers. @As I drop each grain of sand has its main purpose been fulfilled?@");
	Sand_Purpose();
	
	case "Purpose" (remove):
	say("@Everything which ever occurs has a purpose despite how tiny that purpose may seemingly be.@");
	say("The woman pauses. @Do you remember the loan pebble you skipped into the ocean as a child? You do not for you did it many times. But the pebble I speak of served great importance for your life.@");
	Pebble_Wave();
	
	case "Blind" (remove):
	say("@One need not have sight to see that even the smallest actions have an affect on that which has occurred or will occurr. One simply sees it, much like the Sextant.@");
	add(["Has occurred", "Sextant"]);
	
	case "Has occurred" (remove):
	say("@Do you not see how you used the orbs of Focus and Chaos to be able to the very orbs you used to create them? It is such a way that everything is connected.@");

	case "Sextant" (remove):
	say("@A sextant allows a ship on the ocean to navigate. But that is not to say that is all a sextant can do. The Sextant of Fate allows for more than mere coordinates.@");
	add(["Sextant of Fate"]);
	
	case "Sextant of Fate" (remove):
	say("@The Sextant of Fate is a tool which allows what must be seen to be seen when it needs to be seen.@");
	
}

}
}
