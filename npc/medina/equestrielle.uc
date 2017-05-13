/*

The named fairy with the ring

*/


void Equestrielle object#(0x4ce) ()
	{
var necklace = UI_count_objects(PARTY, FIERY_NECKLACE, ANY, ANY);

var bark = "Hail";
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
				UI_item_say(item, "Shiny");
			else if (n == 2)
				UI_item_say(item, "Razzle Dazzle");
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
        call Equestrielle, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

        UI_show_npc_face(item);
if (UI_get_item_flag(item, MET))
	{
		say("@It is you! It is you again!@");
		UI_remove_answer("Name");
	}
else
	{

		say("@It is you it is you!@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if (necklace > 0)
{
    UI_add_answer("Give necklace");
}

converse
{
    if (response == "Bye")
    {
        say("@Miss you miss you I will!@");
        break;
    }
    else if (response == "Name")
    {
        say("@You asks my name? You will know my name! Equestrielle is my name I tell you!@");
        UI_remove_answer("Name");
    }
    else if (response == "Job")
    {
        say("@Why would you ask of me the job which I be? No job is to me but perhaps there is to you?@");
        UI_remove_answer("Job");
        UI_add_answer("Say what?");
    }
    else if (response == "Say what?")
    {
        say("@What do you request of me to be?@");
        UI_remove_answer("Say what?");
        UI_add_answer("What is your purpose wench!");
    }
    else if (response == "What is your purpose wench!")
    {
        say("@Purpose of me asks you? To dazzle and razzle and shiny to me is what dazzles you and me!@");
        UI_remove_answer("What is your purpose wench!");
        UI_add_answer("Huh?");
    }
    else if (response == "Huh?")
    {
        say("@Ratmen fond of me like you! To bring shiny objects to me! Dazzle, razzle and fazzle I be to you and them.@");
        UI_remove_answer("Huh?");
        UI_add_answer("Ratmen");
        UI_add_answer("Shiny objects");
    }
    else if (response == "Ratmen")
    {
        say("@From the cave they be just like you did see! Creatures of rat and man yet not like you nor me. Fine they be to me.@");
        UI_remove_answer("Ratmen");
    }
    else if (response == "Shiny objects")
    {
        say("@Razzle and dazzle the shiny objects be! Not gold but better never have I seen. But you? Perhaps you have seen?@");
        UI_remove_answer("Shiny objects");
        UI_add_answer("No, what is it?");
    }
    else if (response == "No, what is it?")
    {
        say("@Shiny they be and rocked shape they can be but rocks they not seem to me to be! That is what they give me! A ring to me too!@");
        UI_remove_answer("No, what is it?");
        UI_add_answer("Rocks");
        UI_add_answer("Ring");
    }
    else if (response == "Rocks")
    {
        say("@See they not be rocks to me nor you. But something else! I do not know but shiny they be and I keep what they give to me! Ask them if you wish your own shiny razzle dazzle rocks not me.@");
        UI_remove_answer("Rocks");
    }
    else if (response == "Ring")
    {
        if (gflags[GOT_RING])
        {
            say("@Ring no longer with me for I have given it to you!@");
        }
        else
        {
        say("@Old and ancient I sense it be but not look like such to me. Unique I see it to be.@");
        UI_add_answer("I want it");
        }
        UI_remove_answer("Ring");
    }
    else if (response == "I want it")
    {
        say("@No no no you cannot take it from me! You will not get it!@");
        UI_remove_answer("I want it");
        UI_add_answer("Gimmie");
    }
    else if (response == "Gimmie")
    {
        say("@If you want it from me then you should see something to me which will replace it! Remain it will be with me until you do so.@");
        UI_remove_answer("Gimmie");
        UI_add_answer("Replace");
    }
    else if (response == "Replace")
    {
        say("@Shiny it must be. Shinier than my rocks it must be. A necklace perhaps? A shiny necklace! Yes yes, you bring necklace to me, satisfy me it will!@");
        UI_remove_answer("Replace");
        UI_add_answer("Necklace");
    }
    else if (response == "Necklace")
    {
        say("@A shiny stone, unlike any other you have seen. But I have! A fiery gem, shiny and fiery it be! Yes yes, to me that will be good! Ratmen can make it necklace for me!@");
		say("@Find a fiery rock and bring to ratmen then bring to me!@");
        gflags[MAKE_NECKLACE] = true;
        break;
    }
    else if (response == "Give necklace")
    {
        say("@Shiny and fiery and shiny it is! Trade you I will you will see! Here is your ring now you can razzle and dazzle like me!@");
        UI_remove_party_items(1, FIERY_NECKLACE, ANY, ANY);
        UI_add_party_items(1, RING, ANY, ANY);
        gflags[GOT_RING] = true;
		UI_remove_answer("Give necklace");
    }

}


	
	UI_remove_npc_face(item);
	}
}

