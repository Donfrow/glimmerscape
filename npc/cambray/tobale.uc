//Tobale the apothocary


void TobalePurchase()
{
    UI_push_answers();
    UI_add_answer("Nothing");
    UI_add_answer("Potions");
    UI_add_answer("Reagents");
    converse
    {
        if (response == "Nothing")
        {
            say("@You will be back.@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "Potions")
        {
            var healcost = 15;
            var poisoncost = 10;
            var sleepcost = 15;
            var manacost = 30;
            say("@An adventurer who knows how useful potions are is an adventurer who lives another day. What kind would you like to purchase?@");
            BuyPotions(healcost, poisoncost, sleepcost, manacost);
            UI_remove_answer("Potions");
        }
        else if (response == "Reagents")
        {
            var pearlcost = 8;
            var bloodmosscost = 8;
            var nightcost = 7;
            var mandrakecost = 15;
            var garliccost = 4;
            var ginsengcost = 7;
            var silkcost = 6;
            var ashcost = 7;
            var bloodspawncost = 30;
            var scalescost = 10;
            say("@I have an excellent collection of reagents. What would you like to purchase?.@");
            BuyReagents(pearlcost, bloodmosscost, nightcost, mandrakecost, garliccost, ginsengcost, silkcost, ashcost, bloodspawncost, scalescost);
            UI_remove_answer("Reagents");
        }
    }
}

void Tobale object#(0x571) ()
	{
	
var bark = "Hello";
var bark_intro = "Hail";
	
	if (event == 0)
		{
		if(gflags[HYDRA_HYSTERIA])
		{
		}
		else
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
				UI_item_say(item, "Best potions around");
			else if (n == 2)
				UI_item_say(item, "Do not be caught missing a reagent");
			}
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
        call Tobale, TALK;
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
		say("@Decided it is time to pick up some supplies?@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");

	}
else
	{
	say("@Lovely a new face. Can I interest you in this fine potion?@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{

	if (response == "Bye")
			{
			say("@Do come again.@");			
			break;
			}
		else if (response == "Name")
			{
			say("@Tobale at your service. I have the best deals you will find.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
            say("@I am the apothocary here in Cambray. Did I mention you will not find a better deal anywhere else?@");
            UI_remove_answer("Job");
            UI_add_answer("Apothocary");
            UI_add_answer("Cambray");
            UI_add_answer("Buy");
        }
        else if (response == "Apothocary")
        {
            say("@I deal in potions and magical reagents. You should pick some up before you leave as you never know what the future may hold.@");
            UI_remove_answer("Apothocary");
        }
        else if (response == "Cambray")
        {
            say("@Cambray is the island which you are on at this very moment. It is also where my shop is located. Can I interest you in some potions?@");
            UI_remove_answer("Cambray");
        }
        else if (response == "Buy")
        {
            if(UI_get_schedule_type(item) == TEND_SHOP)
            {
                say("@I carry much of what the travelling magic user needs. What can I interest you in?@");
                TobalePurchase();
            }
            else
            {
                say("@As much as I would like to help you right now I am not open. Please do come back during my business hours.@");
            }
            UI_remove_answer("Buy");
        }

        } // end converse bracket

}		
	UI_remove_npc_face(item);	
	}

