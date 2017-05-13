/*
Amoir - Merchant at Dante's Trading Post
*/

void SellGoods()
{

var yeti_pelts = UI_count_objects(PARTY, 402, ANY, 35) || UI_count_objects(PARTY, 402, ANY, 3); // Gwani corpse

UI_push_answers();

say("@What would you like to sell?@");
UI_add_answer("Yeti pelts");

converse
    {

    if (response == "Yeti pelts")
        {
            say("@I will pay you 100 gold per low quality pelt, 200 per medium quality pelt, and 500 per high quality pelt.@");
            var n = UI_get_random(5); // Random to
            
            if (yeti_pelts > 0)
            {

            
                  if (n == 1 || n == 2)
                     {
                     say("@I see you has brought me ", yeti_pelts, " low quality pelts. Here is ", yeti_pelts * 100, " gold.@");
                     UI_add_party_items(yeti_pelts*100, SHAPE_GOLD, QUALITY_ANY, FRAME_ANY, true);
                     UI_remove_party_items(yeti_pelts, 402, ANY, 35);
                     UI_remove_party_items(yeti_pelts, 402, ANY, 3);
                     UI_clear_answers();
	               	 UI_pop_answers();
	                 break;
                        }
                  else if (n == 3 || n == 4)
                     {
                     say("@I see you has brought me ", yeti_pelts, " medium quality pelts. Here is ", yeti_pelts * 200, " gold.@");
                     UI_add_party_items(yeti_pelts*200, SHAPE_GOLD, QUALITY_ANY, FRAME_ANY, true);
                     UI_remove_party_items(yeti_pelts, 402, ANY, 35);
                     UI_remove_party_items(yeti_pelts, 402, ANY, 3);
                     UI_clear_answers();
	                 UI_pop_answers();
	                 break;
                        }
                     else if (n == 5)
                       {
                       say("@I see you has brought me ", yeti_pelts, " high quality pelts. Here is ", yeti_pelts * 500, " gold.@");
                       UI_add_party_items(yeti_pelts*500, SHAPE_GOLD, QUALITY_ANY, FRAME_ANY, true);
                       UI_remove_party_items(yeti_pelts, 402, ANY, 35);
                       UI_remove_party_items(yeti_pelts, 402, ANY, 3);
                       UI_clear_answers();
	                   UI_pop_answers();
	                   break;
                      }
            }
            else
            {
                say("@You do not have any pelts!@");
                UI_clear_answers();
                UI_pop_answers();
                break;
            }
                
            
        }

    }

}

void BuyGoods()
{



UI_push_answers();
say("@What would you like to purchase?@");
UI_add_answer("Bandages");
UI_add_answer("Potions");
   converse
   {
if (response == "Bandages")
    {

        say("@I charge 20 gold per 4 bandages. How many batches would you like?@");
        var amount = UI_input_numeric_value(0, 20, 1, 0);
        
        if (chargeGold(amount*20))
	            {
                say("@Very well, here is ", amount*4, " bandages.@");
                UI_add_party_items(amount*4, 827, ANY, 1);
                UI_clear_answers();
	           	UI_pop_answers();
	           	break;
            	}
        else
            	{
 	            say("@You do not have enough coin!@");
        	    UI_clear_answers();
	           	UI_pop_answers();
	           	break;
            	}



    }
    
else if (response == "Potions")
{

        say("@I charge 25 gold per 5 healing potions. How many batches would you like?@");
        var amount = UI_input_numeric_value(0, 20, 1, 0);
                if (chargeGold(amount*25))
	            {
                say("@Very well, here is ", amount*5, " healing potions.@");
                UI_add_party_items(amount*5, 340, ANY, 1);
                UI_clear_answers();
	           	UI_pop_answers();
	           	break;
            	}
        else
            	{
 	            say("@You do not have enough coin!@");
        	    UI_clear_answers();
	           	UI_pop_answers();
	           	break;
            	}

}
   }

}

void Amoir object#(0x437) ()
	{

var bark = "Can I interest you in some supplies?";
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
				UI_item_say(item, "Get your wares here");
			else if (n == 2)
				UI_item_say(item, "Supplies are adequate");
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
        call Amoir, TALK;
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

if (UI_get_item_flag(item, MET)) 
	{
		say("@I am glad to see you hast not become stuck in the ice.@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");
		UI_add_answer("Sell");
	}
else
	{

		say("@Welcome to Dante's Trading Post.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


		converse
		{

	if (response == "Bye")
			{
			say("@Do not forget your warm clothes.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Amoir.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the merchant here at Dante's Trading Post. I will buy and sell supplies for you.@");
			UI_remove_answer("Job");
			UI_add_answer("Trading Post");
			}
		else if (response == "Trading Post")
			{
            say("@I believe there used to be some sort of post here run by the ancient Ophidians before their empire collapsed. You can see the ruins just outside by the shore.@");
			say("@Now this area is a trading post run by Dante. Ramil, GumDrop and myself inhabit the outpost with Dante.@");
			UI_remove_answer("Trading Post");
			UI_add_answer("Buy");
			UI_add_answer("Dante");
			UI_add_answer("Ramil");
			UI_add_answer("GumDrop");
			}
        else if (response == "Dante")
            {
            say("@Dante is a fierce but fair man. He is very good at trades and negotiations. It is no wonder this outpost is so prosperous with him in charge.@");
            UI_remove_answer("Dante");

            }

        else if (response == "Ramil")
            {
                say("@Ramil is a guard who has been hired by Dante. He is not very talkative but he is good at keeping trouble out of here.@");
                UI_remove_answer("Ramil");
            }
        else if (response == "GumDrop")
            {
                say("@GumDrop is a gnome which lives in the mountain with us. She is a strange creature but useful. She has extrodinary ability to make gadgets and other objects.@");
                UI_remove_answer("GumDrop");
            }
        else if (response == "Buy")
        {
            BuyGoods();
        }
        else if (response == "Sell")
        {
            SellGoods();
        }
		}
}
	UI_remove_npc_face(item);
	}

