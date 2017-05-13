/*
Garvis, Jorletta's boyfriend
*/


void Garvis object#(0x5e4) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Duh";
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
				UI_item_say(item, "Huh huh huh");
			else if (n == 2)
				UI_item_say(item, "Har he har");
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
        call Garvis, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("The dimwitted teen stares at you. @Uhh, wut?@");
add(["Job", "Bye"]);
}
else
{
say("A rather dimwitted looking teen stares at you blankly.");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@Huh huh huh@");
	break;
	
	case "Name" (remove):
	say("@Duh, Garvis.@");
	
	case "Job" (remove):
	say("The teen lets out a rather stupid sounding laugh. @I am Jorletta's boyfriend.@");
	add(["Jorletta"]);
	
	case "Jorletta" (remove):
	say("@She is pretty and lets me do lots of things to her. I love her. Huh huh huh.@");
	

}
}
else if (event == DEATH)
{
	

}


}

