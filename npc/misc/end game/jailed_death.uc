/*
End game, Death in Jail
*/


void Jailed_Death object#(0x5fa) ()
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
        call Jailed_Death, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("Death appears to be looking through you.");
	
}
else
{
	say("Death appears to be looking through you.");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("A silent whisper fills your ear as Death turns away.");
	break;
	
	case "Name" (remove):
	say("A boney hand raises from the cloak and points to itself. @Death...@");
	
	case "Job" (remove):
	say("The form looks at you blankly. @Punishment@");
	add(["Punishment"]);

	case "Punishment" (remove):
	say("@The deeds... they must be punished.@");
	add(["Deeds"]);
	
	case "Deeds" (remove):
	say("The shade pauses. @The lives of innocents taken rest upon me.@");
	UI_show_npc_face1(505);
	say("@The innocents taken shall suffer for their innocence.@");
	
	
}

}
}
