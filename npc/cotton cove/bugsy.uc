/*
Bugsy outside Cotton Cove
*/

void KiteConvo()
{
    UI_push_answers();
    UI_add_answer("Give kite");
    UI_add_answer("Destroy kite");
    converse
    {
        if (response == "Give kite")
        {
            say("The child quickly grabs the kite as you hand it to him. @Yay kite! You aw vewy nice!@");
            karma = karma + 100;
            UI_remove_party_items(1, 1153, ANY, ANY); // remove the kite
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Destroy kite")
        {
            say("Displeased at how the child has grabbed at the kite and demanded it from you makes you feel like teaching the child a lesson. You hold the kite above the childs head and begin to tear it apart. The child lets out so many tears it almost completely clears the goo and gunk off of his face.");
            say("@Nooo kite! You aww the meanest pewson evew!@");
            karma = karma - 250;
            gflags[MEAN_TO_BUGSY] = true;
            UI_remove_party_items(1, 1153, ANY, ANY); // remove the kite
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}


void Bugsy object#(0x46a) ()
	{
var bark = "Me is cute!";
var bark_intro = "Hello little child.";
var kite = UI_count_objects(PARTY, 1153, ANY, ANY); // Kite shape

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
				UI_item_say(item, "Weee");
			else if (n == 2)
				UI_item_say(item, "You awt funny");
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
        call Bugsy, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
		

	UI_show_npc_face(item);

if (gflags[MEAN_TO_BUGSY])
{
    say("Weave me awone.");
}
else
{
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
if (kite > 0)
{
    UI_add_answer("Return kite");
}
if (UI_get_item_flag(item, MET)) 
	{
		say("The child before you still appears to have drool and other sticky gunk covering his face and hands but he greets you as if he did not know it was there. @Huwwo I wemembew you.@");
		UI_remove_answer("Name");
	}
else
	{

		say("The child before you has drool and other sticky gunk covering his face and hands. As you approach he greets you. @Huwwo swanwer!@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{
        if (response == "Bye")
        {
            say("Bye bye!");
            break;
        }
        else if (response == "Name")
        {
            say("The childs voice sounds proud as he announces his name. @BUGWY!@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("Judging by the mess the child is covered in you are not quite sure you want to know what the child does all day but you ask anyway. @I wun awound and play games!@");
            UI_remove_answer("Job");
            UI_add_answer("Games");
            UI_add_answer("You art filthy, go bathe you little pile of puke");
        }
        else if (response == "Games")
        {
            say("Me wike games but my kite on woof. Pwease get it fow me!");
            UI_remove_answer("Games");
        }
        else if (response == "You art filthy, go bathe you little pile of puke")
        {
            say("The gunk covering the child begins to dribble as tears come out of his eyes. @You aww a big meanie go away.@");
            gflags[MEAN_TO_BUGSY] = true;
            UI_remove_answer("You art filthy, go bathe you little pile of puke");
            karma = karma - 50;
            break;
        }
        else if (response == "Return kite")
        {
            say("The childs eyes light up as he notices that you have gotten his kite off the roof and quickly tries to grab it from you. @Give me kite! Give me give!@");
            KiteConvo();
            if(gflags[MEAN_TO_BUGSY])
            {
                break;
            }
            else
            {
                UI_remove_answer("Return kite");
            }
        }
        }


		}
	UI_remove_npc_face(item);
	}
	   }

