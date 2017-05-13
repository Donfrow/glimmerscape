/*
Albon the battle medic in Hensall
*/


void Albon object#(0x5ad) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Good to see you in one piece";
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
				UI_item_say(item, "Such terrible times");
			else if (n == 2)
				UI_item_say(item, "The bloodshed is terrible");
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
        call Albon, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@It is good to see that you are still in one piece.@");
	
}
else
{
	say("The man before you stands beaten and bruised. @These are such terrible times.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}


converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("The man acknowledges you and goes back to tending to the wounded.");
	break;
	
	case "Name" (remove):
	say("@I am Albon, have you forgotten already?@");
	
	case "Job" (remove):
	say("@I detest uttering such words but my job is to tend to the wounded. Oh how I long for the days of peace and stability.@");
	add(["Wounded", "Peace and stability", "Heal"]);
	
	case "Wounded" (remove):
	if(gflags[HENSALL_FREED])
	{
		say("You expect a smile but you are only met with sad eyes. @Despite the fact that you have managed to stop the incursion of the other worldly beasts those which they wounded remain.@");
		say("He shakes his head. @While the worst of it is over I do not think all of my current patients will survive the next few days.@");
	}
	else
	{
		say("@With the current invasion of other worldly beasts a large number of men and woman appear before me in a severly wounded state.@");
		say("He shakes his head. @Such terrible times. Just yesterday I was unable to keep four men from passing on. It is such a terrible time.@");
	}
	add(["Invasion"]);
	
	case "Invasion" (remove):
	if(gflags[HENSALL_FREED])
	{
		say("The man lets out a sigh of relief. @Thankfully the invasion has been stopped but the destruction it brought to us remains. Hopefully, in time, we will be able to move on with our lives.@");
	}
	else
	{
		say("The man turns away from you. @Other worldly beasts have been attacking the city for some time now. I am not certain of the circumstances of their arrival but what I do know is they are fierce and we are losing the fight.@");
		add(["Fight"]);
	}
	
	case "Fight" (remove):
	say("@We have lost most of the city and are now only in control of two buildings. The remaining townsfolk have been moved to the basement of this building and we lose this position we are certainly doomed.@");
	add(["Basement"]);
	
	case "Basement" (remove):
	say("@The conditions are not very nice but at least it is safe... for now that is.@");
	
	case "Peace and stability" (remove):
	if(gflags[HENSALL_FREED])
	{
		say("A solemn face stares back at you. @While the invasion has been stopped I fear it will be some time until Hensall returns to stability. Much of the town is destroyed and many lives have been lost.@");
		say("@I have no doubt we will be able to move on but it will be nothing but hard times ahead of us.@");
	}
	else
	{
		say("It almost appears as if the man will start to cry. @I used to only have to heal minor injuries from hunting accidents, falls of roofs, that sort of thing.@");
		say("@Sadly, with the invasion I now must work on healing life threatening injuries on a daily basis. While I realize it is my duty that does not mean it does not take a toll on me.@");
	}
	
	case "Heal" (remove):
	if(gflags[HENSALL_FREED])
	{
		say("@While I appreciate the fact that you have stopped the invasion their are those with much more serious injuries who require my attention.@");
	}
	else
	{
		say("@While I realize you may be in pain there are those with much more serious injuries who require my attention.@");
	}
	

}

}
}
