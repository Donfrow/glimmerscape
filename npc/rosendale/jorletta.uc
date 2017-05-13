/*
Jorletta, Dayne's daughter and punk
*/


void Jorletta object#(0x5e3) ()
{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "What do you want?";
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
				UI_item_say(item, "I hate this town");
			else if (n == 2)
				UI_item_say(item, "Useless place");
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
        call Jorletta, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
if(UI_get_item_flag(item, MET))
{
say("@What do you want?@");
add(["Job", "Bye"]);
}
else
{
say("@What do you want?@");
add(["Name", "Job", "Bye"]);
UI_set_item_flag(item, MET, true);
}

converse([])
{
	case "Bye" (remove):
	say("@Get lost.@");
	break;
	
	case "Name" (remove):
	say("@You would be one of the first people to ever actually care what my name is, but that does not mean I care what yours is.@");
	add(["What is your name"]);
	
	case "What is your name" (remove):
	say("@Sheesh, quit yelling. I am Jorletta.@");
	
	case "Job" (remove):
	say("The girl laughs. @Like someone actually cares about me. My job is to rot away in this pathetic little town until I am able to get out of here on my own.@");
	add(["Rot", "Town", "Sail away"]);
	
	case "Rot" (remove):
	say("@My father forces me to rot in this useless town, not allowing me to leave. At least I he rents me out my own place so that I do not have to see him.@");
	add(["Father", "Own place"]);
	
	case "Father" (remove):
	say("@My father is the oh-so-important Galleria curator Dayne.@");
	
	case "Own place" (remove):
	say("@The old man rents out a place for me here in town so that I do not bother him when he gets home from work. This way I do not have to see him and he does not have to see me.@");
	
	case "Town" (remove):
	say("@This town is useless. I hate living in Rosendale. I hope it sinks beneath the sea and is forgotten about by everyone.@");
	say("@The only good thing about this place is my boyfriends.@");
	add(["Boyfriends"]);
	
	case "Boyfriends" (remove):
	say("@Merdlon and Garvis are local nitwits but they do whatever I say and are always willing to pleasure me.@");
	if(female)
	{
		say("@I am sure you understand what I mean at least. We have at least we have common desires.@");
	}
	else
	{
		say("@Not that you would understand what it is like to have desires, you are just a brute of a man.@");
	}
	
	case "Sail away" (remove):
	say("@When I have a chance I am going to buy a ship and sail away from this pathetic town. At least that way I am away from pathetic people, such as yourself.@");
	

}
}
else if (event == DEATH)
{
	

}


}

