/*
You when you are in the bad test (when you are following good karma)
*/

void Evil_Avatar object#(0x5c5) ()
	{
var female = UI_get_npc_prop(AVATAR, 10);
var bark = "He he he...";
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
				UI_item_say(item, "You are not worthy");
			else if (n == 2)
				UI_item_say(item, "You will fail!");
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
        call Evil_Avatar, TALK;
    }
    // avatar's script here
    abort;
}

else if (event == TALK)
{
if(female)
{
	UI_show_npc_face(0, 2);
}
else
{
	UI_show_npc_face(0, 3);
}

if(gflags[CURED_PAINED_UNICORN] && gflags[RESCUED_TRAPPED_MAN] && gflags[HELPED_MAN_IN_DESTROYED_HOUSE])
{
	say("The mirror image before you seems to become enraged. @How can you do such a thing? How could you help them? You were meant to fail!@");
	script -453
	{
		nohalt;
		say "Nooooooo";
	}
	UI_kill_npc(-453);
}
else
{

say("@You will never have it!@");

converse(["Name", "Job", "Bye"])
{
	
	case "Bye" (remove):
	say("@Enjoy eternity here.@");
	break;
	
	case "Name" (remove):
	say("@Why would you ask yourself that?@");
	
	case "Job" (remove):
	say("@To stop you.@");

}
}
}
}
