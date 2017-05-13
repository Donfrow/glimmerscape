/*
Dupra
*/

void Dupre object#(0x401) ()
	{
	
var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "ungh";
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
        call Dupre, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);

say("@Hi.@");

if(inParty(-1))
{
add("Leave");
}
else
{
add("Join");
}

converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("She nods at you as you depart.");
	break;
	
	case "Job" (remove):
	say("@To annoy you.@");
	
	case "Join" (remove):
	say("@Joining!@");
	UI_add_to_party(-1);
	
	case "Leave" (remove):
	say("@Leaving.@");
	UI_remove_from_party(-1);
	
}
}



}
