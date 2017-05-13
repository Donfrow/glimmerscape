/*
Sentri - boat version
*/


void Sentri1 object#(0x599) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Yar!";
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
        call Sentri1, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
say("@What can I do for ye?@");

converse(["Name", "Job", "Bye"])
{

	case "Bye" (remove):
	say("@We should return to our duties.@");
	break;
		
	case "Name" (remove):
	say("@How can you forget the name of your friend Sentri? Has the sea air finally gotten to you?@");
	
	case "Job" (remove):
	say("@My job is the same as yours my friend. We must protect the cargo at all costs.@");
	add(["Cargo"]);
	
	case "Cargo" (remove):
	say("@You know we should not be talking about the cargo! Do you want to get us killed?@");

}

}
}


