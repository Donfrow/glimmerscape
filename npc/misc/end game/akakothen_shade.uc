/*
End game, Akokothan in Jail
*/


void Jailed_Akakothen object#(0x5fb) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Please! No!";
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
				UI_item_say(item, "This was not to be");
			else if (n == 2)
				UI_item_say(item, "End it now");
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
        call Jailed_Akakothen, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The shade of Akakothen stares at you deeply. @I am not meant for this!@");
	
}
else
{
	say("The shade of Akakothen stares at you. @This was not to be my fate!@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("@Free me! I command you!@");
	break;
	
	case "Name" (remove):
	say("The ghosts head convulses violently. @Akakothen. Part of. Not deserving!@");
	
	case "Job" (remove):
	say("@Bow before me! No, do not do it! Please stop. You must not!@");
	add(["Pardon?"]);

	case "Pardon?" (remove):
	say("@Do you not know who you stand before? I command you to bow before me or suffer my wrath! No, it is a trick. Do not do it! Stop it! Quiet you!@");
	add(["Trick", "Wrath"]);
	
	case "Trick" (remove):
	say("@Run while you still can! That is a lie. Stay here with me and bow before your MageLord.@");
	
	case "Wrath" (remove):
	say("@My wrath is felt by all. No, I am too weak to be hurt anyone. I will regain my power.@");
	say("@You will all bow before me!@");
	add(["Bow"]);
	
	case "Bow" (remove):
	say("The shade bows before you in humility and reverence and quickly stands up. @All pathetic worms must bow before me.@");
	say("Without warning the shade begins to cry. @Will someone please not bow before me... I need it... I need it...@");
	say("He turns his head suddenly and screams but no sounds come out.");
	UI_show_npc_face1(505);
	say("@Suffer. Suffer for your choices.@");
	break;
	
	
}

}
}
