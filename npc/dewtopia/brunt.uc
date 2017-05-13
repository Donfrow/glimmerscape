/*
Brunt the Mint Guard NPC # 250
*/


void Brunt_See_Sanala()
{
UI_push_answers();

converse(["Did you actually see her?", "Say nothing"])
{

	case "Say nothing" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Did you actually see her?" (remove):
	say("@I did need to actually see her. It was her mirror under the door so it must have been her.@");
	gflags[BRUNT_QUESTIONED] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Brunt object#(0x4fa) ()
{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Watch yourself";
var bark_intro = "Hail";

var potion = PARTY->count_objects(1332, ANY, ANY);

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
			UI_item_say(item, "I crush theives");
		else if (n == 2)
			UI_item_say(item, "I protect my liege");
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
        call Brunt, TALK;
    }
    // avatar's script here
    abort;
} // END DOUBLECLICK
else if (event == TALK)
{
item->show_npc_face();

if (item->get_item_flag(MET)) 
{
	say("Brunt stares at you, saying nothing.");
	add(["Job", "Bye"]);
}
else
{
	say("A man with a hint of madness stares at you.");
	item->set_item_flag(MET);
	add(["Name", "Job", "Bye"]);	
}

//IF STATEMENTS FOR QUEST ADDITIONS

//POTION QUEST
if(gflags[HAS_POTION] && potion > 0)
{
	add(["Potion"]);
}

//FREE SALANA
if (gflags[CAMILLE_ACCUSED])
{
UI_add_answer("Sanala");
}

if (gflags[KILL_BRUNT])
{
	if(-283->is_dead())
	{
	}
	else
	{
		UI_add_answer("Plot on your life");
	}
}

converse([])
{



	case "Bye" (remove):
	say("@You choose wisely.@");
	break;

	case "Name" (remove):
	say("The man looks at you intently, as if burning a hole into your head. @I am Brunt.@");

	case "Job" (remove):
	say("He stares at you and blinks. @I guard the Royal Mint from trouble makers.@");
	add(["Royal Mint", "Trouble makers"]);
	
	case "Royal Mint" (remove):
	say("He glares at you. @Do not even think about trying to break in here. If you try I will have no trouble striking you down.@");
	
	case "Trouble makers" (remove):
	say("@If anyone even thinks about robbing the mint they have not thought it through for they will have me to contend with.@");
	say("@Some scoundrals try to put some thought into it but ultimately they will have to face me. The last scoundral to try is lucky he never got that far though.@");
	add(["Last scoundral"]);
	
	case "Last scoundral" (remove):
	say("@Recently a scoundral was found on the roof of Castle Dew. He was attempting to cut through it in order to get inside the mint.@");
	say("@He is just lucky that someone else caught him up there before he had to contend with me.@");
	add(["Castle Dew", "Caught"]);
	
	case "Castle Dew" (remove):
	say("He lowers an eye as if thinking about you. @It is in the building you are in you sod.@");
	
	case "Caught" (remove):
	say("@One of the patrolling guards heard noise coming from the roof and decided to investigate. It was that the mans plot was discovered.@");
	say("@Now he is prison awaiting his trial. I am sure he will get sent to toil in the Sugar Caves like all the others of his ilk.@");
	add(["Sugar Caves", "Ilk"]);
	
	case "Sugar Caves" (remove):
	say("@Felons convicted of capital crimes get sent to toil in the sugar caves.@");
	say("@A sweet punishment would you not say?@");
	
	case "Ilk" (remove):
	say("@Bandits, thieves and beggars are all scum. They should get real jobs like me.@");
	say("He thinks for a moment. @Come to think of it you may be one of them as I do not actually know what you do. You better watch yourself or I shall cut you down.@");
	
	case "Potion" (remove):
	say("@It is about time my next potion came. Please, have it delivered on time in the future.@");
	UI_remove_party_items(1, 1332, ANY, ANY);
	gflags[GAVE_BRUNT_POTION] = true;
	AVATAR->set_npc_prop(EXPERIENCE, 100);
	
	case "Sanala" (remove):
	if(gflags[CAMILLE_CAUGHT])
	{
		say("Brunt seems to avoid making eye contact with you. @I, uhh, surely she was in on it in some form.@");
	}
	else
	{
		say("@Sanala was the old cook for Lord Dew. A clever ruse to gather information on how to rob the Royal Mint.@");
		add([]);
	}
	
	case "Plot on your life" (remove):
	say("He lets out a maniacal laugh. @Har har har! Bring any challenges on I say! Let them see how well they fare against the might of Brunt!@");
	
	
} // END CONVERSE


} // END TALK




} // END NPC FUNCTION

/*
	
if (gflags[HAS_POTION]) // After talking with Celena about Brunt and his elixer
{	
UI_add_answer("Bedic has a potion for you");
}
if (gflags[KILL_BRUNT])
{
UI_add_answer("There is a plot on your life");
}
if (gflags[CAMILLE_ACCUSED])
{
UI_add_answer("Sanala");
}

converse
{
		else if (response == "Salana")
			{
			say("Of course Salana was the one who was attempting to gather information on how to rob the Royal Mint!");
			UI_remove_answer("Salana");
			UI_add_answer("Did you see her?");
			}
		else if (response == "Did you see her?")
			{
			say("I did not actually see her... but it twas her mirror, so it had to have been her!");
			gflags[BRUNT_QUESTIONED] = true;
			UI_remove_answer("Did you see her?");
			}
		}
		
	UI_remove_npc_face(item);

	}
	*/
