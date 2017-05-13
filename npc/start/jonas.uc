/*
Jonas - Shipmate at start
*/


void Jonas object#(0x598) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Ahoy";
var bark_intro = "Hail";
var avatar_name = UI_get_npc_name(AVATAR)
;
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
        call Jonas, TALK;
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
	say("@Hold on! It looks like we're about to sail into a rough looking storm!@");
	egg_trigger_start_animation();
	break;
		
	case "Name" (remove):
	say("@I think you have a bit too much sea air in your lungs if you are already forgetting your friend and captain Jonas.@");
	
	case "Job" (remove):
	say("@Now ", avatar_name, " you know it was agreed that none of us would talk about this voyage. Why must you insist on pressing the issue?@");

}

}
}


