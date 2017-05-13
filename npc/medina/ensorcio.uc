/*
Ensorcio the general merchant in Medina
*/

void Wine_Inventory_Function object#()()
{

    UI_remove_party_items(1, ZULITH_WINE, ANY, ANY);
    UI_add_party_items(1, ROOFIE, ANY, ANY);
    UI_show_npc_face(81, 0);
    say("@It is done. Here is your laced wine.@");
}

void FreezeEnsorcio object#()()
{
    UI_set_item_flag(-81, 16);
}
void UnFreezeEnsorcio object#()()
{
    UI_clear_item_flag(-81, 16);
}


void Ensorcio_Taint_Wine()
{
    script -81
    {
        call FreezeEnsorcio;
        call FreezeAvatar;
        actor frame LEAN;
        call Eat_Sound;
        wait 3;
        actor frame USE;
        call Bubbly_Sound;
        wait 3;
        actor frame SWING_1;
        wait 2;
        actor frame STAND;
        call Wine_Inventory_Function;
        wait 2;
        call UnFreezeAvatar;
        call UnFreezeEnsorcio;
    }
}

void EnsorcioLace()
{
    var fine_wine = UI_count_objects(PARTY, ZULITH_WINE, ANY, ANY);
    var amount = 200;
    
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    converse
    {
        if (response == "Yes")
        {
            if(hasGold(amount))
            {
                if(fine_wine > 0)
                {
                    chargeGold(amount);
                    say("@Excellent. It shall be a simple matter to lace this.@");
                    gflags[MAKE_CONCOCTION_FLAG] = true;
                }
                else
                {
                    say("@I need what you wish me to lace so that I can get the proportions right. Return to me when you doth possess it.@");
					gflags[MAKE_CONCOCTION_FLAG] = false;
                }
            }
			else
			{
				say("@You need to have 200 gold coins for me to make this beverage for you.@");
				gflags[MAKE_CONCOCTION_FLAG] = false;
			}
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("@Do come back if you change your mind.@");
			gflags[MAKE_CONCOCTION_FLAG] = false;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void EnsorcioBuy()
{
    UI_push_answers();
    UI_add_answer("Potions");
    UI_add_answer("Reagents");
    UI_add_answer("Bandages");
    UI_add_answer("Nothing");
    
    converse
    {
        if (response == "Potions")
        {
            var healcost = 6;
            var poisoncost = 5;
            var sleepcost = 8;
            var manacost = 20;
            say("@And what type of potion would you like to purchase?@");
            BuyPotions(healcost, poisoncost, sleepcost, manacost);
        }
        else if (response == "Reagents")
        {
            var pearlcost = 5;
            var bloodmosscost = 5;
            var nightcost = 5;
            var mandrakecost = 10;
            var garliccost = 2;
            var ginsengcost = 5;
            var silkcost = 4;
            var ashcost = 4;
            var bloodspawncost = 20;
            var scalescost = 8;
            say("@And which reagent wouldst you be interested in acquiring?@");
            BuyReagents(pearlcost, bloodmosscost, nightcost, mandrakecost, garliccost, ginsengcost, silkcost, ashcost, bloodspawncost, scalescost);
        }
        else if (response == "Bandages")
        {
            var bandagecost = 3;
            BuyBandages(bandagecost);
        }
        else if (response == "Nothing")
        {
            say("@I know that you will change your mind and seek me later!@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Ensorcio object#(0x451) ()
	{

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
				UI_item_say(item, "Finest potions in the lands");
			else if (n == 2)
				UI_item_say(item, "Try the glowing potions");
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
        call Ensorcio, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");

        // If you need to drug Toban the Glutton	
		if(gflags[FREE_SIRENUM])
		{
            UI_add_answer("Drug someone");
        }
        
if (UI_get_item_flag(item, MET)) 
	{
		say("@Always a pleasure. What can I interest you with?@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");
		

	}
else
	{

		say("@Tis a pleasure to see a new face.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Yes, some people must venture forth to gain their coin.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Why, I am, of course, Ensorcio the finest dealer of potions and reagents throughout the land!@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I sell all the goods an adventurer would require from bandages to reagents. I am also a skilled apothecary. Now what can I interest you in?@");
            UI_remove_answer("Job");
            UI_add_answer("Adventurer");
            UI_add_answer("Goods");
            UI_add_answer("Buy");
        }
        else if (response == "Adventurer")
        {
            say("@I can tell by the look of your face that you live your life in search of adventure. As such, you have come to the right place as I can sell you all the goods you will require to slay mighty foes!@");
            UI_remove_answer("Adventurer");
        }
        else if (response == "Goods")
        {
            say("@Dost you require reagents? If so, I can provide for you! Dost you require potions? I can provide that as well! All you must do is merely ask and I will be more than happy to assist you in acquiring goods!@");
            UI_remove_answer("Goods");
        }
        else if (response == "Buy")
        {
            if (UI_get_schedule_type(item) == TEND_SHOP)
            {
                say("@I knew that you could not stay away from purchasing from me.@");
                EnsorcioBuy();
            }
            else
            {
            say("@Although I am not currently open for business, if you would return when I am I would be more than happy to assist you in spending your coin.@");
            }
            UI_remove_answer("Buy");
        }
        else if (response == "Drug someone")
        {
            say("@If you are looking for a way to lower ones inhibitions you have come to the right man. Now, some of my colleagues may frown upon such practices but I believe my skills would become feable if I only concentrated on the 'accepted' practices.@");
            say("@If you bring me what you wish me to lace and say, 200 gold, I will prepare what you wish. Do you wish for me to prepare such a concoction?@");
            EnsorcioLace();
            if(gflags[MAKE_CONCOCTION_FLAG])
            {

                Ensorcio_Taint_Wine();
                break;
            }
            UI_remove_answer("Drug someone");
        }


		}
	UI_remove_npc_face(item);
	}
}
