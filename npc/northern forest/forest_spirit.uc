/*
Forest spirit in Northern Forest
*/

void Make_Powder()
{
UI_push_answers();
converse(["Item one", "Item two", "Item three", "Nevermind"])
{
	case "Item one" (remove):
	say("@Pinewood dust is needed for the powder. I need pinewood dust. Find this with those who make their living from the forest.@");
	
	case "Item two" (remove):
	say("@Silverleaf dust is needed. You must bring me silverleaf dust. Find this with those who make their living from the forest.@");
	
	case "Item three" (remove):
	say("@A Container, a jar, in which to place the powder within is also needed. The alchemists of your kind usually have such a thing.@");
	
	case "Nevermind" (remove):
	say("The creature blinks.");
	UI_clear_answers();
	UI_pop_answers();
	break;
}

}

void Slay_Bedimwood()
{
UI_push_answers();
converse(["I will help", "Solve your own problems"])
{
	case "I will help" (remove):
	say("@Save us all you will but you must weaken the dark one known as Bedimwood in order to succeed.@");
	gflags[SLAY_BEDIMWOOD] = true;
	remove(["Solve your own problems"]);
	add(["Weaken", "Bedimwood"]);
	
	case "Weaken" (remove):
	say("@The life of the forest is stronger than the magic of the dark one. You must bring me three items so that I can create a dust for you.@");
	Make_Powder();
	
	case "Bedimwood" (remove):
	say("@The dark one grows stronger as he takes the life of the forest for his own power.@");
	
	case "Solve your own problems" (remove):
	say("The creature looks at you straight in the eye. @Doomed we all are then.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
}
}

void forest_spirit object#(0x5dc) ()

{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Harm me not";
var bark_intro = "Hail";

	if (event == 0)
	{
		if (UI_get_schedule_type(item) == SLEEP)
		{
			UI_item_say(item, "Zzzz");
			return;
		}
		else if (UI_get_schedule_type(item) == IN_COMBAT)
		{
		}
		else
		{
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "teewanawonga");
			else if (n == 2)
				UI_item_say(item, "chindawinda");
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
        call forest_spirit, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

say("An odd looking creature blinks at you.");
add(["Name", "Job", "Bye"]);


//IF you have all the items needed for the dust and are on the quest

var silverleaf_dust = UI_count_objects(PARTY, WOOD_DUST, ANY, 1);
var pinewood_dust = UI_count_objects(PARTY, WOOD_DUST, ANY, 0);
var jar = UI_count_objects(PARTY, 749, ANY, 31);

if(gflags[SLAY_BEDIMWOOD]  && silverleaf_dust > 0 && pinewood_dust > 0 && jar > 0)
{
	if(gflags[MADE_FOREST_POWDER])
	{
		//Prevent you from making more dust
	}
	else
	{
		add(["Dust ingredients"]);
	}
}

converse([])
{
	case "Bye" (remove):
	say("The creature cocks its head to the side and blinks at you.");
	break;
	
	case "Name" (remove):
	say("A puzzled look appears on the creatures face. @I do not understand your concept of name.@");
	
	case "Job" (remove):
	say("An expression of confusion appears on the creatures face. @I am part of the forest.@");
	add(["Forest"]);
	
	case "Forest" (remove):
	say("It jumps around. @The forest. The forest is the life energy. I am part of the life energy.@");
	if(UI_is_dead(-475)) // Lord Bedimwood
	{
		say("Suddenly the creature shivers but it quickly stops. @The energy slowly returns with the dark one slain.@");
	}
	else
	{
		say("Suddenly the creature starts to shiver. @Life energy drains because of the dark one. The dark one drains the energy.@");
	}
	add(["Life energy", "Dark one"]);

	case "Life energy" (remove):
	if(UI_is_dead(-475)) // Lord Bedimwood
	{
		say("@The energy of the forest is slowly returning. Long time it will take to return the life to what it once was but the healing process has begun.@");
	}
	else
	{
		say("@The energy of the forest is slowly draining. The healing process cannot begin while the dark one yet lives.@");
	}
	add(["Healing process"]);
	
	if(UI_is_dead(-475)) // Lord Bedimwood
	{
		say("@No longer is the energy drained through the acts of the dark one. You have helped to save the forest.@");
	}
	else
	{
		if(gflags[SLAY_BEDIMWOOD])
		{
			if(gflags[MADE_FOREST_POWDER])
			{
				say("@You must use the dust on Bedimwood. End his dark magic.@");
			}
			else
			{
				say("@You must slay the dark one before the forest is destroyed. Do not forget the three items needed.@");
				Make_Powder();
			}
		}
		else
		{
			say("@As long as the dark one lives the healing process cannot begin. Help us to slay the dark one and heal the forest?@");
			Slay_Bedimwood();
		}
	}
	
	case "Healing process" (remove):
	if(UI_is_dead(-475))
	{
		say("@With the dark one no more the healing process can begin. Long time before the healing process will be complete.@");
	}
	else
	{
		say("@Healing process will begin when the dark one Bedimwood no longer causes damage to the forest. Until this happens healing cannot begin.@");
	}
	
	case "Dark one" (remove):
	if(UI_is_dead(-475))
	{
		say("@The dark one Bedimwood is no more. You have started the healing of the forest.@");
	}
	else
	{
		say("The creature shivers. @The dark one is known as Bedimwood. Corrupting the forest he is. Soon all the forest will be no more.@");
	}

	case "Dust ingredients" (remove):
	say("As you hand the requested items to the the creature it claps. @With these ingredients a dust can be made to weaken the dark ones power so that you have time to bring him to an end.@");
	say("The creature takes your items, murmering a chant which you cannot understand before handing you a jar of dust. @Take this and use it on the one Bedimwood.@");
	say("Suddenly the spirit looks at you with big eyes. @If you see any others of my kind who have been corrupted use the dust on them for it should cure them of the corruption.@");
	
	// Set flags and remove the ingredients
	gflags[MADE_FOREST_POWDER] = true;
	UI_remove_party_items(1, WOOD_DUST, ANY, 0);
	UI_remove_party_items(1, WOOD_DUST, ANY, 1);
	UI_remove_party_items(1, 749, ANY, 31);
	
	// Add the forest powder
	UI_add_party_items(1, DUST_OF_THE_FOREST, ANY, ANY);
	
}// End converse
}
else if (event == DEATH)
{
	script item
	{
		say "Why...";
	}

}


}

