/*
Marsh, the wounded man
*/

void Marsh_Where_Beatup()
{
UI_push_answers();
converse(["Where did this happen?", "When did this happen?", "Nevermind"])
{

	case "Nevermind" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Where did this happen?" (remove):
	say("He thinks for a moment. @I was walking south just east of the Galleria. I had just passed the dockhouse when the thugs jumped out at me.@");
	say("@I do not remember much once they started to beat me.@");

	case "When did this happen?" (remove):
	say("You can see that Marsh winces in pain as he speaks. @I was jumped in the dead of night. I believe it was sometime around three in the morning.@");
}
}

void Marsh object#(0x5ea) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Huh? Who said that?";
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
				UI_item_say(item, "My head");
			else if (n == 2)
				UI_item_say(item, "Oh the pain");
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
        call Marsh, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("You are met with a blank stare. @Oh, it is you again.@");
add(["Job", "Bye"]);
}
else
{
say("You are greeted with a blank stare. @Do I know you?@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@Yes, yes. Let me get my rest.@");
	break;
	
	case "Name" (remove):
	say("@I am Marsh. I question as to why you ask such questions of me when I am obviously in pain.@");
	
	case "Job" (remove):
	say("He lets out a small laugh before grimacing in pain. @I did work in the mountains mining the stone but I do not know if I will be able to go back to work given the extent of my injuries.@");
	add(["Mine", "Stone", "Injuries"]);
	
	case "Mine" (remove):
	say("@The mine can be found on the west side of the island. It is extremely difficult to mine it however the pay is quite good.@");
	say("He winces in pain. @Though I am not sure I will be able to go back to work given my injuries.@");
	
	case "Stone" (remove):
	say("@The stone is extremely hard and difficult to work with. It is some of the strongest stone in all the lands.@");
	say("@It is extremely hard to get out of the mountain. I have no idea how Igon manages to sculpt statues out of it.@");
	add(["Igon"]);
	
	case "Igon" (remove):
	say("@Igon is a local artisan who carves all the statues for the Galleria. It is quite the collection the Galleria has. I suggest you visit there if you have time.@");
	add(["Galleria"]);
	
	case "Galleria" (remove):
	say("He coughs up a bit of blood. @Do we really have to discuss such things now?@");
	
	case "Injuries" (remove):
	say("@Those thugs beat me up pretty badly. Walter says I suffered quite a few broken bones from the beating. I hope I have no permanent injuries from the beating.@");
	say("He groans. @Though from Walter has said it looks like I may.@");
	add(["Thugs", "Walter"]);
	
	case "Thugs" (remove):
	say("@I was leaving the Galleria Gumption around three in the morning one night when a group of thugs jumped at me from the shadows demanding money.@");
	say("@They beat me up pretty badly even after I handed over all I had on me.@");
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
		say("He makes a pained smile. @Walter informed me that Dryn has managed to bring the thugs to justice. While I am saddened to learn two of them had to die I am quite pleased they will not be robbing anyone else.@");
	}
	else
	{
		say("@I had always thought this town rather safe. I guess it goes to show that nowhere is safe.@");
		Marsh_Where_Beatup();
	}
	
	case "Walter" (remove):
	say("@Walter is the town healer, and based on my experience with him he is quite a talented one.@");
	say("@I am rather lucky that I got beaten in this town as I do not know if I would have survived without a healer as talented as him.@");
	say("@The best part is that if I wake up in pain in the middle of the night I can yell for him and he comes running right out of his room. He is never angry even if I wake him up in the earlier hours of the morning.@");
	add(["Room"]);
	
	case "Room" (remove):
	say("@Walter, and his wife Joy for that matter, work out of their home. Their bedroom is just next to the room I am in so I can rest assured knowing that Walter is always around.@");
	

}
}
else if (event == DEATH)
{
}

else if (event == PROXIMITY)
{
	script item
		{
			frame 0;
			repeat 32
		{
		next frame cycle;
		};
	}
}


}

