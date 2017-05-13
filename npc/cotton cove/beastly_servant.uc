/*
Golem outside Floydens house
*/



void Beastly_Servant object#(0x5bb) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "";
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
				UI_item_say(item, "");
			else if (n == 2)
				UI_item_say(item, "");
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
        call Beastly_Servant, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The creature stares at you blankly.");
}

	
converse(["Name", "Job", "Bye"])
{

	case "Bye" (remove):
	say("The creature stares at you blankly.");
	break;
		
	case "Name" (remove):
	say("A massive mouth of rock begins to move with the grace of a butterfly. @No name is needed.@");
	
	case "Job" (remove):
	say("@Job to protect Floyden.@");
	add(["Floyden"]);

	case "Floyden" (remove):
	say("The creature almost seems to display emotion at the mention of Floyden. @Floyden is creator of me. Must protect Floyden. Must protect father.@");
	add(["Father"]);
	
	case "Father" (remove):
	say("@Floyden created me. Floyden is... father.@");
	
}

}
}

