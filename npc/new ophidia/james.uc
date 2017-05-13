//Sophia, dock master of new ophidia

void James_Potions_Or_Bandages()
{
    UI_push_answers();
    UI_add_answer("Potions");
    UI_add_answer("Bandages");
    UI_add_answer("Nothing");
    converse
    {
        if(response == "Potions")
        {
            var healcost = 12;
            var poisoncost = 10;
            var sleepcost = 16;
            var manacost = 40;
            BuyPotions(healcost, poisoncost, sleepcost, manacost);
        }
        else if (response == "Bandages")
        {
            var bandagecost = 10;
            BuyBandages(bandagecost);
        }
        else if (response == "Nothing")
        {
            say("@Very well.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void James object#(0x57a) ()
	{
	
var bark = "Greetings";
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
				UI_item_say(item, "Difficult wounds");
			else if (n == 2)
				UI_item_say(item, "These poor souls");
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
        call James, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
    var schedule = UI_get_schedule_type(item);
    UI_show_npc_face(item);

    UI_add_answer("Name");
    UI_add_answer("Job");
    UI_add_answer("Bye");

if(gflags[HAD_RELATIONS]) // got disease from theodora
{
	if(gflags[KILL_JAMES_TALK])
	{
	}
	else
	{
		UI_add_answer("Mysterious illness");
	}
}
	
if (UI_get_item_flag(item, MET))
	{
		say("@It is good to see you still in one piece.@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");
	}
else
	{

	say("@Greetings.@");
	UI_set_item_flag(item, MET, true);

	}

converse
    {
        if(response == "Bye")
        {
            say("@Be careful out there.@");
            break;
        }
        else if (response == "Name")
        {
            say("@You may call me James.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the healer here in the trapper settlement.@");
            UI_remove_answer("Job");
            UI_add_answer("Healer");
            UI_add_answer("Trapper settlement");
        }
        else if (response == "Healer")
        {
            say("@I tend to various wounds and other ailments which one encounters in such a climate. I also sell bandages and potions.@");
            say("@And may I add, that this climate certainly causes my services to be needed, and although I would not be here normally, Strehin pays well for me to be.@");
            UI_remove_answer("Healer");
            UI_add_answer("Wounds and ailments");
            UI_add_answer("Pays well");
        }
        else if (response == "Wounds and ailments")
        {
            say("@Most of the wounds I encounter come from the various beasts the trappers deal with, but occasionally I get a wound from a fall through the ice or something similar.@");
            say("@The main ailments I encounter are a result of the bitter weather. It is usually the inexperienced trappers that do not dress warmly enough.@");
            UI_remove_answer("Wounds and ailments");
            UI_add_answer("Beasts");
            UI_add_answer("Inexperienced trappers");
        }
        else if (response == "Beasts")
        {
            say("@It is mostly minor wounds from leopards and bears, but when the trappers deal with the yeti some are often gravely injured.@");
            say("@In fact, Tomasion over there is a first for me. He was injured by an ice dragon!@");
            UI_remove_answer("Beasts");
            UI_add_answer("Tomasion");
            UI_add_answer("Ice dragon");
        }
        else if (response == "Tomasion")
        {
            say("@I prefer not to speak of my patients conditions with those who do not need to know, but I will say he was pretty touch and go for some time.@");
            say("@Now I keep him constantly sedated so that he does not feel the pain of his wounds.@");
            UI_remove_answer("Tomasion");
        }
        else if (response == "Ice dragon")
        {
            say("@Never have I seen such wounds caused by a beast. It is amazing anyone could survive an attack by such a creature.@");
            UI_remove_answer("Ice dragon");
        }
        else if (response == "Inexperienced trappers")
        {
            say("@Each trapping season new trappers are brought in. Usually it is the same trappers from previous seasons but there is always at least one new trapper.@");
            say("@It is these fellows that have not learned how to deal in such a harsh environment.@");
            UI_remove_answer("Inexperienced trappers");
        }
        else if (response == "Pays well")
        {
            say("@I will not get into the exact amounts, but suffice to say it is enough to make me content to live in such conditions.@");
            UI_remove_answer("Pays well");
        }
        else if (response == "Trapper settlement")
        {
            say("@This settlement must allow for better products from the trappers, or some other large benefit, to make it worthwhile to have people live up here.@");
            UI_remove_answer("Trapper settlement");
        }
        else if (response == "Buy")
        {
            if(schedule == TEND_SHOP)
            {
                say("@Would you be interested in potions or bandages?@");
                James_Potions_Or_Bandages();
            }
            else
            {
                say("@Please do come back when I am open.@");
            }
            UI_remove_answer("Buy");
        }
		else if (response == "Mysterious illness")
		{
			var poison = UI_get_item_flag(AVATAR, POISONED);
			say("James eyes you. @I will not ask questions about where you picked this up this particular ailment but I will let you know that I have seen it many times before.@");
			if(poison)
			{
				say("@As such I have become quite adept at healing this so particular malady. Which is lucky for you, as I do not feel the need to charge you for such a simple task.@");
				UI_clear_item_flag(AVATAR, POISONED);
			}
			else
			{
				say("@I have become quite proficient at healing this particular malady, however it appears to have run its course already.@");
			}
			say("@Hopefully this experience will teach you a lesson before you engage in certain activities in the same manner in the future.@");
			UI_remove_answer("Mysterious illness");
			gflags[KILL_JAMES_TALK] = true;
		}


    }

}
		
UI_remove_npc_face(item);	
}

