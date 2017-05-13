/*
Andy, one of the miners
*/


void Andy object#(0x5f2) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "What is it you say?";
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
				UI_item_say(item, "This rock is so hard");
			else if (n == 2)
				UI_item_say(item, "What a day");
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
        call Andy, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("Andy nods at you.");
add(["Job", "Bye"]);
}
else
{
say("An older looking man beams a smile at you. @Well hello there stranger. It is a pleasure to meet you.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@Yes, a good idea. I should get back to what I was doing anyway.@");
	break;
	
	case "Name" (remove):
	say("He fluffs his beard slightly. @You can call me Andy. Well you could call me a lot of things but Andy is my name.@");
	
	case "Job" (remove):
	say("@I am one of the miners who works in the mountains hauling out all this rather strong rock. It is a very backbreaking line of work but there are some benefits to it at least.@");
	add(["Rock", "Benefits"]);
	
	case "Rock" (remove):
	say("@I am not sure if the rock has a special name but suffice to say it is extremely difficult to work with.@");
	say("@I am amazed that anyone even bothers to make sculptors out of a material so difficult to work with.@");
	say("He shows you his pick. @Just take a look at this pick. I have been using it for less than two days and it is nearly destroyed already.@");
	say("@This rock causes us to go through quite a bit of equipment in a short time.@");
	add(["Sculptors","Equipment"]);
	
	case "Sculptors" (remove):
	say("@A local artisan named Igon works with this rock to make some sculptors out of it.@");
	say("@I am not sure why someone would purposefully choose to make their works out of something that is so difficult to work with but someone does.@");
	say("@Now, I am no art critic but I will not deny that this rock along with the Igon's skill makes some lovely work but I do not see why he would choose such a difficult material to work with.@");
	say("@I suspect that if it were not for someone using it locally this rock would never even be mined. It really is too heavy to have much value It keeps me employed at least.@");
		
	case "Equipment" (remove):
	say("@We go through so much different equipment mining this rock you would think me crazy. Picks, hammers, even explosives are used up very quickly.@");
	say("He grins. @In fact, if you happen to run across mayor Harris perhaps you could see about getting us some more picks. We are in drastic need of some new ones.@");
	gflags[SELL_PICKS] = true;
	add(["Picks"]);
	
	case "Picks" (remove):
	say("@Actually we are low on other supplies too but at the moment we need picks the most. It seems the supply shipments have become very eradic as of late.@");
	add(["Supply shipments"]);
	
	case "Supply shipments" (remove):
	say("@I do not know the specifics but my understanding is the eradic nature of the shipments lately have something to do with pirates.@");
	add(["Pirates"]);
	
	case "Pirates" (remove):
	say("@The only things I know about them is what I overhear in the Galleria Gumption during dinner. I suggest you ask some of the other townsfolk about it rather than myself.@");

	case "Benefits" (remove):
	say("@Those of us who work at mining this rock are given free food, healing and residence. It is espcially good that we get free healing as this job is visiting the local healer fairly often.@");
	add(["Healing", "Residence"]);
	
	case "Healing" (remove):
	say("@It is rather funny as I am far healthier now, despite being constantly injured while working, than I have been in my entire life.@");
	say("@It just goes to show you what can happen under the hand of a trained healer like Walter.@");
	add(["Walter"]);
	
	case "Walter" (remove):
	say("@Walter is the local healer in Rosendale. He is constantly healing Stone, Marsh and myself from various injuries we sustain while working.@");
	say("@At times he actually has to take care of all three of us at once.@");
	say("@Luckily, at the moment Stone and myself are in good working order. Marsh on the other hand is quite hurt, and it is not even from work but a group of thugs who jumped him at night!@");
	add(["Thugs"]);
	
	case "Thugs" (remove):
	say("@I have seen some terrible beatings throughout my life but what they did to poor Marsh is by far the worst. The beating they gave him is actually worse than any injury we have ever received while mining.@");
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
		say("@Thankfully the toughs have been brought to justice. I hope the ones who died had a rather painful death given what they did to poor Marsh.@");
	}
	else
	{
		say("@I just hope that whoever is responsible are brought to justice.@");
	}
		
	case "Residence" (remove):
	say("@Those of us who work in the mine get free residence in the southeast part of town.@");
	say("@It is rather cramped for the three of us but between all of our injuries one of us is usually staying at Walters place recuperating.@");
	say("He lowers his face. @Do not tell anyone but sometimes I like being injured as Walter takes very good care of us.@");

	
}
}
else if (event == DEATH)
{
	

}


}

