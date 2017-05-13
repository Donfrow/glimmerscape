/*
Marion, wife of Jones by Noxious swamp
*/


void Buckles object#(0x5c0) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Huwwo";
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
				UI_item_say(item, "Weeee");
			else if (n == 2)
				UI_item_say(item, "Teehee");
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
        call Buckles, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("@It is a pleasure to see you again.@");
}
else
{
	say("A small boy stares at you.");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}
	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("@Buh Bye!@");
	break;
		
	case "Name" (remove):
	say("The boy attempts to look important. @Buckles!@");
	
	case "Job" (remove):
	say("A giggle comes out of the boy. @I pway!@");
	add(["Play"]);
	
	case "Play" (remove):
	say("@I pway wiff mommy.@");
	add(["Mommy"]);
	
	case "Mommy" (remove):
	say("@Mommy fun! Mommy pway wiff me!@");


	
	
}

}
}

