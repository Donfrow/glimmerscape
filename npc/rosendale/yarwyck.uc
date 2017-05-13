/*
Yarwyck, sheriff deputy in rosendale
*/


void Yarwyck object#(0x5e6) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Good day";
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
				UI_item_say(item, "I am watching you");
			else if (n == 2)
				UI_item_say(item, "Do not cause trouble");
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
        call Yarwyck, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("@It is good to see you again.@");
add(["Job", "Bye"]);

if(gflags[HEARD_OF_THUGS])
{
	if(gflags[ROSENDALE_THUGS_KILLED])
	{
		add(["Thugs dead"]);
	}
	else
	{	
	add(["Thugs"]);
	}
}

}
else
{
say("@It has been sometime since I have seen a new face. It is a pleasure.@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@Goodday.@");
	break;
	
	case "Name" (remove):
	say("@Deputy Yarwyck.@");
	
	case "Job" (remove):
	say("@I work with Dryn keeping trouble locked up here in Rosendale during the night.@");
	add(["Trouble", "Rosendale", "Night"]);
	
	case "Trouble" (remove):
	say("@This town usually sees quite a few visitors. Along with visitors come undesireables who like nothing more than to cause trouble. It is these people that I help Dryn deal with.@");
	add(["Undesireables"]);
	
	case "Undesireables" (remove):
	say("@Undesireables can range from vandels to murderers, though I have to admit we do not get very many murderers.@");
	say("@Most people we take into custody tend to be petty thieves who are attracted by the crowds the Galleria brings.@");
	add(["Galleria"]);
	
	case "Galleria" (remove):
	say("@The Galleria holds statues that people from around the lands come and visit. It is these crowds that the petty thieves tend to be attracted to.@");
	
	case "Rosendale" (remove):
	say("@Rosendale is situated on an island just northeast of the mainland. I am not entirely certain why this place was chosen to found the city but I suspect it has something to do with the rock.@");
	add(["Rock"]);
	
	case "Rock" (remove):
	say("@Some rather strong rock comes from the mountains found here on the island. I believe this rock is what the statues in the Galleria are consturcted from.@");
	
	case "Night" (remove):
	say("He sighs. @I am the deputy stuck with the night shift. My days are spent sleeping and my nights are spent keeping watch on those we have locked up in the cells.@");
	say("@On the bright side, the prisoners tend to sleep at this time and very rarely cause me any issues. They must leave all that up to the dayshift.@");
	
	case "Thugs" (remove):
	say("@There is a group of no good thugs causing trouble in this town. Hopefully they can be brought to justice.@");
	
	case "Thugs dead" (remove):
	say("@I have heard of this group of thugs and their untimely demise. Even though they will never come under my watch, I am not sure that they deserved to die.@");
	say("He stares at you. @Ha! Who am I kidding? I am glad they are gone. It is less work for me!@");
}

}
else if (event == DEATH)
{
	

}


}

