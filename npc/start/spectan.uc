/*
Spectan - Shipmate at start
*/


void Spectan object#(0x59a) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Yes?";
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
        call Spectan, TALK;
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
	say("@I should be concentrating on my duties.@");
	break;
	
	case "Name" (remove):
	say("@Do you not recall that I am Spectan?@");
	
	case "Job" (remove):
	say("@Can you not tell that I am to keep a lookout for any trouble we might encounter while on the trip? Is it not wise to let me perform my duties?@");

}

}
}


