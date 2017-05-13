/*
Jarvis the grave robber
*/

void Jarvis_Apology()
{
UI_push_answers();

converse(["Apologize", "Thief!"])
{

	case "Apologize" (remove):
	say("You apologize for Jarvis for jumping to conclusions. @That is right. Now I think you best be on your way and forget you ever saw me.@");
	say("@Otherwise I may end up defending my honour.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Thief!" (remove):
	say("You stand by your accusation of Jarvis which appears to infuriate him. @How dare you say such a thing to me!@");
	AVATAR.say("@It is quite obvious you are the graverobber who has been stealing from this cemetary.@");
	UI_show_npc_face(442, 0);
	say("Jarvis scowls at you. @It really would have been better for both of us if you had just apologized. I hate having to put people into the ground...@");
	gflags[ACCUSE_GRAVEROBBER] = true;
	UI_clear_answers();
	UI_pop_answers();
	break;
}

}

void Jarvis object#(0x5b2) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Do not startle me like that!";
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
				UI_item_say(item, "What was that?");
			else if (n == 2)
				UI_item_say(item, "Did I just hear something?");
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
        call Jarvis, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The man tenses until he realizes it is you. @Oh, it is just you again.@");
	
}
else
{
	say("@Do not startle me like that! You will give me a heart attack!@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
{
	case "Bye" (remove):
	say("@Yes, yes, be on your way.@");
	break;
	
	case "Name" (remove):
	say("The man tugs at his collar. @I am Jarvis.@");
	
	case "Job" (remove):
	say("The man tenses up. @I am... uh... the grave digger for this cemetary. Yes, that is me.@");
	add(["You dig this late?", "Cemetary"]);
	
	case "You dig this late?" (remove):
	say("You can tell the man is nervous. @It is, uh, too hot to dig during the day so I have no choice but to dig at night. Yes, that is why I dig at night.@");
	if(gflags[GRAVEROBBER])
	{
		add(["Graverobber!"]);
	}
	
	case "Graverobber!" (remove):
	say("The man gasps. @How dare you accuse me of such a thing! I have the nerve to strike you down right here for such an accusation. I demand an apology this instant.@");
	Jarvis_Apology();
	if(gflags[ACCUSE_GRAVEROBBER])
	{
		UI_set_schedule_type(-434, IN_COMBAT);
		UI_set_alignment(-434, HOSTILE);
		UI_set_oppressor(-434, AVATAR);
		script -434
		{
			say "Die!";
		}
		break;
		
	}
	
	case "Cemetary" (remove):
	say("@It is a small cemetary... the people buried here are buried with some expensive items... and by that I mean their lifelong possessions.@");
	say("He tenses up. @Indeed, their lifelong possessions they should never part with.@");
}


}
}
