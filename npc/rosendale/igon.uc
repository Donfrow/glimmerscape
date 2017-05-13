/*
Igon, the artist in Rosendale
*/

void Igon object#(0x5de) ()
	{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Well met";
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
				UI_item_say(item, "It is tough carving stone");
			else if (n == 2)
				UI_item_say(item, "Phew");
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
        call Igon, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("Igon wipes his forehead. @Always a pleasure.@");
add(["Job", "Bye"]);
}
else
{
say("The man wipes his forehead of sweat. @Well met stranger.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("He nods his head at you.");
	break;
	
	case "Name" (remove):
	say("The man grins widely as you inquire about his identity. @I am Igon, creator of the finest statues in the land.@");
	
	case "Job" (remove):
	say("A big smile appears. @Have you seen the statues of kings, lords and ladies throughout the lands? I have you ever wondered where they come from?@");
	say("@Well, now you know where they come from, for it is I, Igon, who creates them.@");
	add(["Statues", "Kings, lords and ladies", "Create"]);
	
	case "Statues" (remove):
	say("@The life size replicas made of stone which can be found in kingdoms and homes are statues. I create them for all those who can afford it in my studio here in Rosendale.@");
	say("@I also made the statues which you can find in the Rosendale Galleria.@");
	add(["Studio", "Rosendale", "Galleria"]);
	
	case "Studio" (remove):
	say("@It is in my studio where I create all my masterpieces. The town of Rosendale has graceciously allowed me to set up shop in the Galleria, free of charge.@");
	add(["Free of charge"]);
	
	case "Free of charge" (remove):
	say("@The town does not require me to pay any rent for the space I use in the Galleria. All they ask of me in return is to allow tourists view me sculpting and occasionally give them small speech.@");
	add(["Tourists", "Speech"]);
	
	case "Tourists" (remove):
	say("@Many people travel to Rosendale to view the Galleria. It has the finest collection of statues that can be found in the lands.@");
	say("He nudges you. @All created by me, I might add.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@Thankfully the Nautical Guild is sailing again now that the pirates have been dealt with. I was starting to become concerned with how little tourists the Galleria was getting.@");
	}
	else
	{
		say("@Unfortunately the pirate menace has significantly reduced the number of tourists visiting the Galleria. Hopefully after the menace is dealt with more people will come to see my wonderful work.@");
	}
	add(["Pirates"]);
	
	case "Pirates" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@There was a ban on sailing put in place by the Nautical Guild until the pirate menace could be dealt with.@");
		say("@It would appear that the guild has dealt with the menace as the ban has been lifted and ships are now allowed to sail again.@");
	}
	else
	{
		say("@The Nautical Guild has placed a ban on sailing until the pirate threat can be dealt with. I do not know the specifics about it but it must be rather bad for them to impose a ban on sailing.@");
	}
	add(["Nautical Guild"]);
	
	case "Nautical Guild" (remove):
	say("@The Nautical Guild is the an organization that sailors join. I believe they are headquartered in Medina.@");
	
	case "Speech" (remove):
	say("@In return for free rent on my studio I am required at times to give a speech to tourists about how I create such fine pieces of art.@");
	say("@It can be quite annoying at times but it is worth it in order to have a place to work where I do not have to worry about paying rent.@");
	
	case "Rosendale" (remove):
	say("@Rosendale is such a fine place to live. The people are very nice and they treat me somewhat like a celebrity for the works I create.@");
	say("@All in all it is a nice place to live.@");
	
	case "Galleria" (remove):
	say("@The Galleria of Rosendale consists of some of the finest art in the lands, all created by me I might add. You will not find a finer collection of statues anywhere in the land.@");
	add(["Galleria statues"]);
	
	case "Galleria statues" (remove):
	say("@If you would like to know about the importance behind the statues in the Galleria I suggest you speak with Tully. She is the guide for the Galleria.@");
	
	case "Kings, lords and ladies" (remove):
	say("He laughs. @If there is one thing nobility wants, it is to be remembered. My statues, created from some of the hardest rock, helps them fulfill this desire.@");
	say("@Long after they have passed on from this life their image, etched into stone, will still be around for remind future generations to view.@");
	
	case "Create" (remove):
	say("@Everyone wants to do something for which they will be remembered. I create my magnificant statues which will last for generations in order to accomplish this.@");
	say("@It is not easy to make realistic depictions in some of the hardest rock one can find, but I manage to do it, and do it well.@");
	add(["Rock"]);
	
	case "Rock" (remove):
	say("@Some of the strongest rock in the land can be found in the mountains just west of Rosendale. The rock is extremely heavy and would cost an obscene amount of gold to ship an unfinished piece.@");
	say("@To put it into perspective, the cost to transport my finished statues can be well over 5000 gold coins and this is after I have reduced the original weight through the sculpting process.@");
	say("@I can only imagine how much it would cost to ship the full, unsculpted piece of rock off this island.@");

}
}
else if (event == DEATH)
{
	

}


}

