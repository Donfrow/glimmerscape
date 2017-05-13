/*
Darlessa, lady at the Galleria
*/


void Darlessa object#(0x5e0) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Greetings";
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
				UI_item_say(item, "His schedule is quite full");
			else if (n == 2)
				UI_item_say(item, "So much work");
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
        call Darlessa, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("@How nice to see you again.@");
add(["Job", "Bye"]);
}
else
{
say("@Good day to you stranger. If you wish to see Dayne you will need an appointment.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@Do not be a stranger. Do return sometime.@");
	break;
	
	case "Name" (remove):
	say("@I am Darlessa Thornbridge, it is a pleasure.@");
	
	case "Job" (remove):
	say("You can tell the woman is slightly annoyed at the question. @I am Dayne's personal assistant. Anyone who knows anything about the Galleria knows that.@");
	say("She quickly composes herself. @I apoligize for my rudeness. As you are a tourist you would not know that.@");
	add(["Dayne", "Assistant", "Galleria", "Tourist"]);
	
	case "Dayne" (remove):
	say("@Dayne is the curator of the Galleria. He is quite a busy man so he requires a personal assistant to manage his schedule. This allows him to not double book meetings and travel.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@Though, as of late, the pirate threat had nearly eliminated all travel so Dayne was not travelling at all. With the ban lifted his schedule will become quite busy again.@");
	}
	else
	{
		say("@Though, as of late, the pirate threat has nearly eliminated all travel so Dayne's schedule is much simpler without the travel.@");
	}
	add(["Pirates"]);
	
	case "Pirates" (remove):
	if(gflags[LECHUCK_DEAD])
	{
		say("@The pirates are a menance on the high seas. Fortunately the Nautical Guild has dealt with the threat and they are no longer much of a concern.@");
		if(gflags[ROSENDALE_THUGS_KILLED])
		{
		}
		else
		{
			say("@Sadly, we still have a group of thugs here in Rosendale that is causing trouble during the night.@");
			gflags[HEARD_OF_THUGS] = true;
			add(["Thugs"]);
		}
	}
	else
	{
		say("@Pirates are a menance on the high seas. They have become so burdensome that the Nautical Guild has suspended all travel by their members. I do hope the threat is dealt with soon.@");
		if(gflags[ROSENDALE_THUGS_KILLED])
		{
		}
		else
		{
			say("@Yet, Rosendale has its own issues. As of late a band of thugs have been causing trouble during the night.@");
			gflags[HEARD_OF_THUGS] = true;
			add(["Thugs"]);
		}
	}
	add(["Nautical Guild"]);
	
	case "Thugs" (remove):
	say("@I do not know much but rumour has it that during the night a band of thugs have been beating up citizens and robbing them. The rumours must be true as Dryn has taken the matter up personally.@");
	add(["Dryn"]);
	
	case "Dryn" (remove):
	say("@Dryn is the sheriff here in Rosendale. He is in charge of investigating and enforcing the laws.@");	
	
	case "Nautical Guild" (remove):
	say("@The Nautical Guild runs all the sea lanes in Desporia. As long as you are sailing with a member of the Nautical Guild you can rest assured you will not be cheated.@");

	case "Assistant" (remove):
	say("@Dayne is so busy that he cannot possibly organize all of his meetings and travel so it is my job to ensure his day runs smoothly.@");
	say("@Without someone like me to organize his day no doubt he would be exhausted.@");
	say("@My duties can vary greatly and can range from arranging the travel to ordering the food for his meetings. It can be quite a bit of work.@");
	add(["Meetings and travel"]);
	
	case "Meetings and travel" (remove):
	say("@In order to promote the Galleria Dayne is often required to meet with important figures either here in Rosendale or in other cities.@");
	say("@He is so busy that he himself cannot arrange all the intricacies of such gatherings.@");
	
	case "Galleria" (remove):
	say("@The Galleria, officially called The Great Galleria of Rosendale, is a place where one can find the finest statues in all the lands. As you can imagine we get quite a few visitors coming to see the exhibits.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@That was until the pirate menance. Unfortunately when piracy was on the rise we had far fewer visitors. Hopefully now that the threat is dealt with more people will start visiting again.@");
	}
	else
	{
		say("@That was until the pirate menance. Unfortunately with piracy on the rise we have had far fewer visitors than we are used to.@");
	}
	add(["Exhibits"]);
	
	case "Exhibits" (remove):
	say("@If you wish to know about the exhibits you should speak to Tully. She is the guide for the Galleria.@");

	case "Tourist" (remove):
	say("@In the course of my duties I deal with nearly everyone who lives in Rosendale and I do not recognize you so you must be a tourist here.@");
	say("@It is actually quite refreshing to see a strange face again as the number of tourists visiting lately has been few and far between.@");
}
}
else if (event == DEATH)
{
	

}


}

