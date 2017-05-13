/*
Corrupted Forest spirit in Northern Forest
*/



void corrupt_forest_spirit object#(0x5dd) ()

{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "";
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
        call corrupt_forest_spirit, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

add(["Name", "Job", "Bye"]);
if(gflags[FREED_FOREST_SPIRIT]) // Used dust of the forest on the corrupt spirit
{
	say("An exhausted creature looks back at you. @Freed I am but rest is needed.@");
	converse([])
	{
		case "Name" (remove):
		say("It stares at you blankly. @The forest has no name.@");
		
		case "Job" (remove):
		say("It stares at you blankly. @I am part of the forest.@");
		say("Suddenly it seems to waver. @Rest is needed now. Much rest needed.@");
		break;
		
		case "Bye" (remove):
		say("It stares at you. @Good... bye.@");
		break;		
	}
}
else
{
	say("A creature looks back at you with empty eyes.");
	converse([])
	{
		case "Name" (remove):
		say("It stares at you blankly.");
		
		case "Job" (remove):
		say("It stares at you blankly.");
		
		case "Bye" (remove):
		say("It stares at you blankly.");
		break;		
	}
}
}
else if (event == DEATH)
{
	script item
	{
		say "Why...";
	}

}


}

