/*
The skinless man in evil karma test (when you are following good karma)
*/

void Skinless_Man object#(0x5c6) ()
	{

var bark;
var bark_intro;

if(gflags[HELPED_MAN_IN_DESTROYED_HOUSE])
{
bark = "It is my saviour...";
bark_intro = "Hail";
}
else
{
bark = "Feel my pain for eternity!";
bark_intro = "Hail";
}

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
				UI_item_say(item, "The suffering!");
			else if (n == 2)
				UI_item_say(item, "Why!?");
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
        call Skinless_Man, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{
UI_show_npc_face(item);

if(gflags[HELPED_MAN_IN_DESTROYED_HOUSE])
{


say("The horribly disfigured man looks back at you. @I may not longer be chained to my suffering but I shall suffer regardless for my ways.@");

converse(["Name", "Job", "Bye"])
{

	case "Bye" (remove):
	say("The man whimpers.");
	break;
	
	case "Name" (remove):
	say("@There is no use for names in a place such as this.@");
	
	case "Job" (remove):
	say("@Even though I am not longer chained to my suffering I shall continue to suffer for the mistakes I have done. I am doomed here forever.@");
	add(["Mistakes", "Doomed"]);
	
	case "Mistakes" (remove):
	say("@I cared only for myself. I would only help others when it would help me. I shall pay for what I have done.@");
	
	case "Doomed" (remove):
	say("@Noone escapes this place unless they are worthy. I shall not be worthy to leave this place.@");
	add(["Worthy"]);
	
	case "Worthy" (remove):
	say("@They are worthy if they pass the test with the heart they came in with...@");
	break;
}

}
else
{

say("A horribly disfigured man looks back at you. @The suffering knows no bounds!@");

var chains = UI_count_objects(PARTY, 209, ANY, 4);

if(chains > 0)
{
add(["Return chain"]);
}

converse(["Name", "Job", "Bye"])


	
{
		
	case "Bye" (remove):
	say("The man whimpers.");
	break;
	
	case "Name" (remove):
	say("@Noone cares about such a thing here? Why should you?@");
	
	case "Job" (remove):
	say("Whimpers escape from the mans mouth. @My purpose is to suffer. Flee now or you too shall suffer too.@");
	add(["Suffer", "Flee"]);
	
	case "Suffer" (remove):
	say("@I was greedy. I wanted too much. I did not care what it took to achieve my goals. Now I am meant to suffer for my ways.@");
	add(["Greedy","Ways"]);
	
	case "Greedy" (remove):
	say("@I wanted it all and now I have nothing!@");
	
	case "Ways" (remove):
	say("@One cannot mend their ways once they have entered the test so I am doomed for eternity to suffer here. That horrible creature will ensure I am chained here forever.@");
	add(["Creature", "Chained"]);
	
	case "Creature" (remove):
	say("@The horrible unicorn in the cave torments us me, it chains me here forever!@");
	gflags[ASK_UNICORN_ABOUT_CHAINS] = true;
	
	case "Chained" (remove):
	say("@I am chained, shackled to my suffering! The pain of it all! Find my chains so that I may be free!.@");
	
	case "Flee" (remove):
	say("@I can sense that you have not entered this place unlike the others here. You must flee if you can before you are overcome!@");
	add(["Overcome"]);
	
	case "Overcome" (remove):
	say("The man starts screaming. @I was not always like this! Look at me now! I am forever doomed!@");
	
	case "Return chain" (remove):
	say("As you present the chain to the man he quickly grabs it and whimpers. @You have helped but I am still doomed to suffer, I shall never truely escape.@");
	gflags[HELPED_MAN_IN_DESTROYED_HOUSE] = true;
	UI_remove_party_items(1, 209, ANY, 4);
	break;
	
}
} // END IF




}
}
