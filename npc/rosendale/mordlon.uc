/*
Mordlon, Jorletta's boyfriend # 2
*/


void Mordlon object#(0x5e5) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Duh";
var bark_intro = "Hail";

var jorletta_dead = UI_is_dead(-483);
var garvis_dead = UI_is_dead(-484);

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
				UI_item_say(item, "I so funny");
			else if (n == 2)
				UI_item_say(item, "I am tough");
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
        call Mordlon, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

if(jorletta_dead && garvis_dead)
{
UI_show_npc_face(664);
say("As you stare at Mordlon it appears as if he is going to cry. @My nose hurts.@");
converse(["Job", "Bye"])
{
	case "Bye" (remove):
	say("Mordlon turns away as a tear runs down his cheek.");
	break;
	
	case "Job" (remove):
	say("He looks to his feet. @I am being punished for being a bad boy. I did not mean to do it. I wanted to impress Jorletta.@");
	add(["Punished", "Jorletta"]);
	
	case "Punished" (remove):
	say("@I did bad things so now I am being punished. I did not mean to do them. I only wanted to impress Jorletta. I do not want to be in here!@");
	
	case "Jorletta" (remove):
	say("@She was so pretty and let me do things with her as long as I did what she said. I only wanted to impress her.@");
	
}
}
else
{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("You are met with a blank stare.");
add(["Job", "Bye"]);
}
else
{
say("You are met with a blank stare.");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@I funny. Haha.@");
	break;
	
	case "Name" (remove):
	say("@Mordlon. M-o-r-d-l-o-n. That spells Mordlon.@");
	
	case "Job" (remove):
	say("The teen lets out a rather stupid sounding laugh. @I am Jorletta's boyfriend.@");
	add(["Jorletta"]);
	
	case "Jorletta" (remove):
	say("@She is pretty and lets me do things with her. I would do anything she says. Huh huh huh.@");
	

}
}
}
else if (event == DEATH)
{
	

}


}

