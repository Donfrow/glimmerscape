/*

Hildar the farmer outside the walls

*/

void Hildar object#(0x525) ()
	{

var bark = "How can I help you?";
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
				UI_item_say(item, "Work work work");
			else if (n == 2)
				UI_item_say(item, "Watch out for bandits");
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
        call Hildar, TALK;
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
	say("@Greetings once more.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to my farm.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	
if(gflags[KILL_PLAINSRIDER_HECTAR] || gflags[KILL_PLAINSRIDER])
{
	if(UI_is_dead(-500))
	{
	}
	else
	{
		add(["The Plains Rider"]);
	}
}

		converse
		{
	if (response == "Bye")
			{
			say("So long");
			
			break;
			}
		else if (response == "Name")
			{
			say("@My name is Hildar.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I tend one of the many farms outside the protective walls of Dewtopia with my wife Mildred.@");
			UI_remove_answer("Job");
			UI_add_answer("Protective walls");
			}
		else if (response == "Protective walls")
			{
			say("@There is a small farm and pen for animals within the walls of Dewtopia, but those are for Lord Dew.@");
			say("@Outside the walls is where much of the food comes from. It is a wonder we do not get more protection.@");
			UI_remove_answer("Protective walls");
			UI_add_answer("Protection");
			}
		else if (response == "Protection")
			{
			say("@The walls protect the inner city from goblins and bandits. We receive minimal protection out here from the city guards.@");
			say("@Occasionally a trainee will come out and try to protect us, but they are too inexperienced to be much use. Currently one by the name Rufus comes around.@");
			say("@We supply the city with much yet receive so little. It is a wonder the bandits and goblins have not killed more of us. Luckily, the beasts from the catacombs have not bothered us yet.@");
			UI_remove_answer("Protection");
			UI_add_answer("Goblins");
			UI_add_answer("Bandits");
			UI_add_answer("Rufus");
			UI_add_answer("Catacombs");
			}
		else if (response == "Goblins")
			{
			say("@Foul creatures. They tend to focus more on the city walls though they do occasionally attack one of the farms.@");
			UI_remove_answer("Goblins");
			}
		else if (response == "Bandits")
			{
			say("@Those Plains Bandits are worse than the goblins. At least the goblins are not very intelligent.@");
			say("@The bandits however use wit and cunning and are much more difficult to fight.@");
			say("@Why, I have heard rumors that one has managed to infiltrate Castle Dew.@");
			UI_remove_answer("Bandits");
			UI_add_answer("Rumors");
			}
		else if (response == "Rumors")
			{
			say("@Noone dare speak of this inside the wall, but out here we are able to be much more open.@");
			say("@One of the female bandits, Camille or Camilla or some such have supposedly gained employment within Castle Dew.@");
			say("@She is said to be a savage one which possess wit, charm, and a deadly strike in the back with a dagger.@");
			say("@It is said she will slay you even if offer no resistance while being robbed. Twould be a shame if she was in the city.@");
			say("@Being a lowly farmer I are not allowed within the castle to confirm this for myself. It is probably better that way.@");
			UI_remove_answer("Rumors");
			gflags[RUMORS] = true; 
			}
		else if (response == "Rufus")
			{
			say("@He is a small man with a giant ego. He thinks he can single handedly rid Dewtopia of all its enemies.@");
			say("@In truth, he does not do much for us at all. We often refer to him as Rufus the Small which seems to infuriate him.@");
			UI_remove_answer("Rufus");
			gflags[RUFUS] = true;
			}
		else if (response == "Catacombs")
		{
			say("@Just north of my field there is an entrance to is a fast underground series of tunnels which span beneath all of Dewtopia, or so I have heard.@");
			say("@I have never personally ventured there for fear of the beasts which dwell within, but I have seen the occasional adventurer enter them, never to return.@");
			UI_add_answer("Beasts");
		}
		else if (response == "Beasts")
		{
			say("@I am not certain while dwells within but the stories I heard growing up is that it is the home of a tribe of trolls. Frankly, I do not wish to ever confirm it with my own eyes.@");
			UI_remove_answer("Beasts");
			UI_add_answer("Trolls");
		}
		else if (response == "Trolls")
		{
			say("@I have never seen one personally but I heard they are rather stalky creatures with a taste for blood.@");
			UI_remove_answer("Trolls");
		}
		else if (response == "The Plains Rider")
		{
			say("Hilder rubs his chin. @I have heard of him. Some sort of disgraced knight of some sort. He does not come around these parts often. We must be too close to the city walls.@");
			say("@Not that helps keep the goblins and bandits at bay.@");
			UI_remove_answer("The Plains Rider");
		}
		}
	UI_remove_npc_face(item);
	}
	}
