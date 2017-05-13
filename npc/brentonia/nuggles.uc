/*
Nuggles the prisoner in Brentonia
*/



void Nuggles object#(0x44d) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "I see you!";
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
				UI_item_say(item, "Ogadawogade");
			else if (n == 2)
				UI_item_say(item, "blurp blurp blurp");
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
        call Nuggles, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("Nuggles waves at the wall. @I remember you!@");
}
else
{
	say("An oddly dressed man looks back at you. @Nice to see you!@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("The man tries to do a flip in the air but instead simply lands on his buttocks. @Goodbye. See you some other time.@");
	break;
		
	case "Name" (remove):
	say("@It is me, Nuggles!@");
	
	case "Job" (remove):
	say("@Hmm, that is a good question. I suppose I could be a baker, or perhaps play the lute.@");
	add(["Baker", "Lute"]);
	
	case "Baker" (remove):
	say("@You baked me a cake? Why thank you, but I best not take it now lest the pixies get upset.@");
	add(["Pixies"]);
	
	case "Pixies" (remove):
	say("The man whispers softly into the air that you have a hard time understanding him. @Pixies do not like cake very much.@");
	
	case "Lute" (remove):
	say("@The lute is a wonderful sounding instrument. It has too many keys though. I much prefer a stringed instrument.@");
}

}
}


