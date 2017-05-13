/*
End game, crutchman in jail
*/


void Crutches_Man object#(0x5f9) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "So hungry";
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
				UI_item_say(item, "I am so hungry");
			else if (n == 2)
				UI_item_say(item, "Please, feed me");
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
        call Crutches_Man, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The man looks at you through the bars. @I am so hungry.@");
	
}
else
{
	say("A man with crutches looks at you through the bars. @Please, I am so hungry.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
	
{
		
	case "Bye" (remove):
	say("The man simply looks away.");
	break;
	
	case "Name" (remove):
	say("@Please, I will say anything. Please just feed me.@");
	
	case "Job" (remove):
	say("@I am starving. I was only trying to help my family. Please have mercy.@");
	add(["Starving", "Help", "Mercy"]);

	case "Starving" (remove):
	say("A frail hand reaches out to you from behind the bars. @Anything to tide my hunger.@");
	
	case "Help" (remove):
	say("@My wife... my son. They were so hungry. I had to do it. Please understand. I did not want to do it. I had no choice.@");
	UI_show_npc_face1(505);
	say("@You must pay for your choices.@");
	
	case "Mercy" (remove):
	say("@I beg of you. Have mercy on me. My wife and child needed the bread to survive. The man could live without it. He did not even miss it.@");
	say("His hand slowly goes limp as his voice trails off. @So hungry...@");
	break;

	
}

}
}
