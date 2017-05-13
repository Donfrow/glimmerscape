/*
Mathis, innkeeper at rosendale
*/

void Rosendale_Inn_Key()
{

UI_push_answers();
say("@I charge 25 gold pieces for a room but since you seem like a nice fellow I shall do it for 20. What do you say?@");
converse(["Yes", "No"])
{

	case "Yes" (remove):
    if (chargeGold(20))
	{
		say("@Wonderful! Here is your key.@");
		UI_add_party_items(1, KEY, 41, ANY);
		gflags[GOT_ROSENDALE_INN_ROOM] = true;
	}
    else
	{
		say("@I am afraid you do not have enough gold.@");
	}
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("He slumps his shoulders. @Very well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;	
	

}

}


void Mathis object#(0x5ed) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var name = UI_get_npc_name(AVATAR);

var bark = "Hail";
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
				UI_item_say(item, "I wish business would pickup");
			else if (n == 2)
				UI_item_say(item, "Curse those pirates");
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
        call Mathis, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("@I trust the world is treating you well.@");
add(["Job", "Bye"]);
}
else
{
say("@Hello there stranger. Any chance I can interest you in a room for the night?@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@Do return sometime.@");
	break;
	
	case "Name" (remove):
	say("@My noble traveller, you may call me Mathis.@");
	
	case "Job" (remove):
	say("@Now that is a question I am more than happy to answer for you. I am the innkeeper here in Rosendale. Any chance I can interest you in a room?@");
	add(["Rosendale", "Innkeeper", "Room"]);
	
	case "Rosendale" (remove):
	say("@Rosendale is a fine city on an island located just northeast of the mainland. It is also home to the Great Galleria of Rosendale, which if I may say so is a fine attraction.@");
	say("He nudges you. @In fact, I suggest you visit it.@");
	add(["Galleria"]);
	
	case "Galleria" (remove):
	say("It seems as if Mathis is quoting a tour booklet. @The Galleria is located in the centre of the city, just south of the local pub, Galleria Gumption.@");
	say("You yawn as he continues his mind numbing schpheel. @In here you are able to view some of the finest statues in all the lands, carved out of the hardest rock one will ever find.@");
	say("@Visit the Galleria today and prepare to be amazed!@");
	add(["Statues", "Rock"]);
	
	case "Statues" (remove):
	say("@The statues are carved by Igon, the local artisan. Through his skilled hand he creates some of the finest statues you will ever set your eyes on.@");
	if(gflags[GOT_ROSENDALE_INN_ROOM])
	{
	}
	else
	{
		say("@And after a hard day of viewing their splendor, come and rest your weary head on the finest pillows, curtesy of the Rosendale Inn.@");
		say("@Just 25 gold pieces a night.@");
	}
	
	case "Rock" (remove):
	say("The question about the rock stumbles Mathis. @To be honest I do not know much about it so I cannot tell you much about it. All I know is that it is extremely hard.@");
	
	case "Innkeeper" (remove):
	say("@An innkeeper is one who runs an inn. It is not a glamourous job or title but it pays the bills and I get to meet many interesting characters.@");
	if(gflags[GOT_ROSENDALE_INN_ROOM])
	{
	}
	else
	{
		say("@And after a hard day of viewing their splendor, come and rest your weary head on the finest pillows, curtesy of the Rosendale Inn.@");
		say("@Just 25 gold pieces a night.@");
	}
	add(["Interesting characters"]);
	
	case "Interesting characters" (remove):
	say("@Well, I am mostly familiar with the townspeople so when someone visits my inn it is a nice change of pace and can be rather interesting observing them.@");
	say("@I suspect someone who travels around the lands such as yourself would find it rather dull so I shall not bore you with it.@");
	
	case "Room" (remove):
	if(gflags[GOT_ROSENDALE_INN_ROOM])
	{
		say("@I have already given you the key to the room.@");
	}
	else
	{
		Rosendale_Inn_Key();
	}
	
	
}
}
else if (event == DEATH)
{
}

}



