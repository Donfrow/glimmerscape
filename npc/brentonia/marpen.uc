/*
Marpen - Cambray shop keeper stuck in Brentonia
*/

void Cambray_News()
{
UI_push_answers();
if(gflags[HYDRA_HYSTERIA]) // Cambray has been slaughtered
{
	add(["Everyone is dead!"]);
}
if(gflags[VISITED_CAMBRAY]) // visisted cambray
{
	add(["Business as usual"]);
}
else
{
	add(["Never been there"]);
}
converse(["No"])
{
	case "Everyone is dead" (remove):
	say("You relate the tale of the hydra and the mass slaughter that took place in Cambray. @I... I did not expect to hear news such as that. This certainly cannot be good for business.@");
	say("He thinks for a moment. @There must be some way I can profit from this...@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Business as usual" (remove):
	say("You explain to Marpen that Cambray has not changed much since his departure. @I did not expect much to have happened but it is good to hear things are going well.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "Never been there" (remove):
	say("He shakes his head. @That is a shame. You really ought to visit sometime.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "No" (remove):
	say("He shakes his head. @That is a shame.@");
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}
}

void Marpen object#(0x5f6) ()
	{

var female = UI_get_npc_prop(AVATAR, 10); // get the avatar's gender

var bark = "What do you want?";
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
				UI_item_say(item, "Damn sailors");
			else if (n == 2)
				UI_item_say(item, "Damn pirates");
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
        call Marpen, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)

{

UI_show_npc_face(item);
	
if (UI_get_item_flag(item, MET)) 
{
	say("Marpen looks back at you. @I do hope you come bearing good news.@");
}
else
{
	say("A distraught man looks at you. @What do you want?@");
	UI_set_item_flag(item, MET, true);
	add(["Name"]);	
}

	
converse(["Job", "Bye"])
{

	case "Bye" (remove):
	say("He sighs. @Yes, you be on your way. I will be here, here among the transients and hobos, waiting for my chance to get home.@");
	break;
		
	case "Name" (remove):
	say("He eyes you up. @I assure you I am not one of the transients that normally reside here. You may call me Marpen of Cambray.@");
	
	case "Job" (remove):
	say("@What a question that is. In my normal life I am the proprietor of Lady Elena's Gift Shop in Cambray. In this travesty of an existance I am nothing but another transient in Brentonia.@");
	add(["Lady Elena's Gift Shop", "Cambray", "Transient", "Brentonia"]);
	
	case "Lady Elena's Gift Shop" (remove):
	say("@Lady Elena's Gift Shop is a souvenier store which sells wonderful trinkets to remind visitors of their trip to Cambray.@");
	say("@If I ever manage to get back to my home I suggest you visit and pick up something to remember your own trip. My prices cannot be beat!@");
	
	case "Cambray" (remove):
	say("@Cambray is a wonderful city located on an island to the North East. As I am trapped here on the mainland I have heard next to nothing of my beloved home since I left.@");
	say("@Would you happen to have any news of Cambray?@");
	Cambray_News();
	
	case "Transient" (remove):
	say("@Not once in my life have I had a vacation and you know what happens the first timet I take one? The Nautical Guild enacts a ban on sailing as soon as I leave the island!@");
	say("@The first time I close down my shop, expecting to be gone only a week, I end up being gone for who knows how long! Not only that, I have used up all the of the funds for my vacation.@");
	say("He shakes his fist at the sky. @Now I have no choise but to resort to living like a common hobo in the charity housing of Brentonia. I was not meant to be in a place like this.@");
	add(["Vacation", "Nautical Guild", "Ban on sailing"]);
	
	case "Vacation" (remove):
	say("@Do not even ask me about my vacation. It has been nothing short of a disaster@");
	
	case "Nautical Guild" (remove):
	say("@The Nautical Guild is a large organization that controls all ships throughout Desporia, including passenger ships.@");
	
	case "Ban on sailing" (remove):
	say("@Shortly after I left Cambray the Nautical Guild decided that the best way to combat piracy was to simply stop sailing. I am not quite sure what they hoped to accomplish but it has caused quite a few problems for many people such as myself.@");
	if(gflags[LECHUCK_DEAD])
	{
		say("@The ban was in effect for some time but has recently been lifted. Unfortunately now the backlog of those needing to sail is clogging up all the available ships.@");
		say("@Every day I go to Nautical Guild's operation in Brentonia hoping to find room on a ship and each day I have no luck finding it.@");
	}
	else
	{
		say("@The ban is still in effect and until it is lifted only a limited number of ships on official business are allowed to sale.@");
		say("Every day I go to the Nautical Guild's operation here in Brentonia hoping for good news. So far I have heard nothing good.");
	}
	say("@I just want to go home!@");
	
	case "Brentonia" (remove):
	say("@Brentonia is the only place I can survive now that I have exhausted all of my coin. They have some sort of homeless shelter or mission of some sort for those who need a place to stay.@");
	say("@As much as I despise spending my time in such a noisy and messy environment it is better than being on the streets.@");
}

}
}


