/*
Enrick - Nautical Guild member in Brentonia
*/



void Enrick object#(0x5a0) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "I see you!";
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
				UI_item_say(item, "Another calm day");
			else if (n == 2)
				UI_item_say(item, "Fresh air is nice");
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
        call Enrick, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("Enrick tips his hat to you. @It is nice to see you again.@");
}
else
{
	say("A man tips his hat to you. @A pleasure to see a new face.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("Enrick nods. @Safe travels to you.@");
	break;
		
	case "Name" (remove):
	say("@I am Enrick, Nautical Guild member of the Third Class.@");
	
	case "Job" (remove):
	say("The man motions around. @I am the dockmaster here in Brentonia and proud member of the Nautical Guild.@");
	add(["Dockmaster", "Brentonia", "Nautical Guild"]);
	
	case "Dockmaster" (remove):
	say("@I am the one who is required to keep track of all the ships which seek to port here at the docks.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@And I am quite glad that the ban on sailing has been lifted. It was quite dull here while the ban was in place. I ended up spending most of my day leaning back in my chair.@");
	}
	else
	{
		say("The man sighs. @Though as of late it has been quite dull. With the ban on sailing in place I spend most of my time leaning back in my chair.@");
	}
	add(["Ban on sailing", "Dull"]);
	
	case "Ban on sailing" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@With LeChuck slain the Nautical Guild has lifted its self imposed ban on sailing. We are once again free to sail the open sea.@");
	}
	else
	{
		say("@The Nautical Guild has severly restricted sailing at the moment in an effort to combat the growing threat of piracy. I am not sure if it is the most effective method to combat such an issue, but we shall see.@");
	}
	
	case "Dull" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@While things have yet to return to their normal pace now that the sea lanes are active again I can at least look forward to spending my days working.@");
		say("The man chuckles. @Surprisingly I yearn for work to do as the days can pass by quite slowly when you have nothing to do.@");
	}
	else
	{
		say("@Normally I would spend my days fillling out paper work and working with the sailors who come into port but with the ban on sailing such things are few and far between.@");
		say("@You would be surprised at how slow the day goes when all I have to do is sit in my chair and stair out the window.@");
	}
	
	case "Brentonia" (remove):
	say("@Although I am just outside of the walls of the city I am, for all intents and purposes, part of the city. Which is a good thing, as even though I am outside the walls the knights protect me.@");
	add(["Knights"]);
	
	case "Knights" (remove):
	say("@A hearty group of warriors if I ever did see any. Sometimes on a calm day I can even hear them training by the city walls. If what I hear then is the same on the battlefield I would flee in terror if I had to face them.@");
	say("The man sighs. @Yet their numbers are few. If only there were more of them there would be no threat from goblins.@");
	add("Goblins");
	
	case "Goblins" (remove):
	say("You can tell the man is shaking. @The goblins are hidious creatures. I heard they cook their victims alive... that is if they do not eat them raw.@");
	say("The man quickly regains his composure. @Even though I am outside the city walls I am confident when I have the Brentonian Knights protecting me.@");
	
	case "Nautical Guild" (remove):
	say("You can clearly tell the man enjoys talking about the Nautical Guild. @The Nautical Guild is a wonderful organization based in Medina that runs the shipping lanes in all of Desporia.@");
	say("@If not for them, the shipping lanes would be in chaos and noone would ever get their supplies. I am very proud to be a part of it all.@");
}

}
}


