/*
Marsten the prisoner in Brentonia
*/

void Marsten_Job()
{
UI_push_answers();

converse(["Superhero", "Hairdresser", "Prisoner", "Wiseman"])
{
	case "Superhero" (remove):
	say("The man sneers at you. @Oh yes you nailed that one head on. During the day I am but a humble prisoner but during the night I fight crime from the rooftops.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Hairdresser" (remove):
	say("@You are absolutely correct. My hair studio is here behind these bars. It certainly adds to the appeal of my professionalism, do you not agree?.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Prisoner" (remove):
	say("@Your powers of perception are uncanny.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Wiseman" (remove):
	say("@You are clearly more wise than I to have deduced such a thing. I bow to your superior intellect.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}

}

void Marsten object#(0x445) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "Joy, a new tormentor";
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
				UI_item_say(item, "I am innocent!");
			else if (n == 2)
				UI_item_say(item, "A mockery of justice!");
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
        call Marsten, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("The man sneers at you. @What do you want?@");
}
else
{
	say("A shady looking man peers out at you from behind the bars. @Well, at least you are not Luther.@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("@Whatever.@");
	break;
		
	case "Name" (remove):
	say("@If you truely must know, I am Marsten.@");
	
	case "Job" (remove):
	say("@Are you daft? What do you think my job is?@");
	Marsten_Job();
	add(["Prisoner", "Crime"]);
	
	case "Prisoner" (remove):
	say("@It is such a wonderful life. I have only the finest company and I get all the moldy bread and water I could ever desire.@");
	add(["Company", "Moldy bread"]);
	
	case "Company" (remove):
	say("@While in this fabulous resort I get the company of only the finest people. If you look around I sure you cannot miss the star attraction, Mr Nuggles.@");
	add(["Nuggles"]);
	
	case "Nuggles" (remove):
	say("The tone of the mans voice drips sarcasm. @Oh yes, a fine fellow he is. Why not speak to him yourself.@");
	
	case "Moldy bread" (remove):
	say("The man rolls his eyes. @They serve only the finest gourmet meals here. You should try it sometime.@");

	case "Crime" (remove):
	say("The mans attitude suddenly changes. @I am innocent! I was walking along suddenly this oaf of a guard Luther says I am trying to steal from him and next thing I know I am tossed in here.@");
	add(["Luther"]);
	
	case "Luther" (remove):
	say("@He turns around after I pass him and accuses me of pocketing some of his hard earned coin. Naturally I deny this and next thing I know he is attacking me.@");
	say("@Now I am by no means a weak man but this oaf is built like an oxe so when he hit me I promptly fell to the ground. Now he constantly comes in and taunts me about how he caught me!@");
	add(["That is it?", "Taunts"]);

	case "That is it?" (remove):
	say("@Well, as it was, as soon as I hit the ground some other thief decided to throw all of his stolen goods around me to appear as if it had fallen out of my robes.@");
	say("@And of course this helped convict me of many other robberies and the real thief is still running around out their feely. What a cunning fellow he must be.@");
	add(["Liar"]);
	
	case "Liar" (remove):
	say("The man scowls at you as you challenge his absurd story. @I hope you get robbed and beaten you no good pile of dung.@");
	
	case "Taunts" (remove):
	say("@That big oaf comes in every day and taunts about how stupid I am to try to steal from such a mighty warrior. It is really quite tiresome.@");
}

}
}


