/*
Lucille the barkeep in Dewtopia

*/

void Lucille object#(0x53c) ()
	{

var bark = "What can I get for you?";
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
				UI_item_say(item, "Best food around");
			else if (n == 2)
				UI_item_say(item, "Enjoy the food");
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
        call Lucille, TALK;
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
	say("@Your lovely face is always a welcome addition to my surroundings.@");
	UI_remove_answer("Name");
	UI_add_answer("Buy");
	}
else
	{
	say("@Welcome to the Savage Plate.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Thank you come again!@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@They call me Lucille.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I run the Savage Plate, the finest pub in all of Dewtopia. It is here where citizens and travellers alike can spend their coin on delicious food.@");
			UI_remove_answer("Job");
			UI_add_answer("Food");
			UI_add_answer("Savage Plate");
			UI_add_answer("Buy");
			}
		else if (response == "Savage Plate")
			{
			say("@The bar was founded by my father and his wife when Dewtopia was still a fledgling village. When they past on my sister and I took over.@");
			UI_remove_answer("Savage Plate");
			UI_add_answer("Sister");
			}
		else if (response == "Sister")
		{
			say("@I have a sister name Lucilla who has since left the business to open her own pub in Brentonia.@");
			say("@While I have not spoken to her in some time I have heard it has become quite successful, though it has certain elements of ill repute which helps in the success.@");
			UI_remove_answer("Sister");
			UI_add_answer("Ill repute");
		}
		else if (response == "Ill repute")
		{
			say("@Lets just say women are not required to wear clothes in the establishment and leave it at that.@");
			UI_remove_answer("Ill repute");
		}
		else if (response == "Food")
			{
			say("@If I dare say so, I believe I prepare some of the finest foods throughout the land. Those who venture into the city are treated with a delicious meal.@");
			UI_remove_answer("Food");
			UI_add_answer("Outside the city");
			}
		else if (response == "Outside the city")
			{
			say("@It is dangerous lands outside the city walls. Goblins and Bandits doth prey outside the walls.@");
			if (gflags[GELVIN])
			{
			say("@Word has spread that you discovered Gelvin's shop overrun with Bandits. I am saddened to hear about his and his wifes death. I shall have to find a new source of meat now.@");
			}
			else
			{
			say("@My latest shipments of meat from Gelvin hath not arrived yet either. I do hope the Bandits or Goblins did not get him.@");
			}
			UI_remove_answer("Outside the city");
			UI_add_answer("Shipment");
			UI_add_answer("Goblins");
			UI_add_answer("Bandits");
			}
		else if (response == "Goblins")
			{
			say("@They have no taste in food. They will eat their own kind that fall in battle I've heard. Raw.@");
			UI_remove_answer("Goblins");
			}
		else if (response == "Bandits")
			{
			say("@The Plains Bandits rob those outside the city and sometimes slay them as well. If I may so, I believe occasionally they sneak into the city in disguise and eat here.@");
			say("@My food is just that good.@");
			UI_remove_answer("Bandits");
			}
		else if (response == "Shipment")
			{
			say("@Gelvin is the butcher who provides me with my fine meats. His shop is far outside Dewtopia. I have overheard weary travellers saying that the inn south of his shop has been destroyed. I do hope that nothing has happened to him.@");
			
			UI_remove_answer("Shipment");
			UI_add_answer("Inn");
			}
		else if (response == "Inn")
			{
			say("@There was a large inn to the south of Gelvin's shop, The Boars Rest I believe it is called. You should speak to Talendor about that. He is a member of an Inn Guild or some such.@");
			gflags[TALENDOR] = true;
			UI_remove_answer("Inn");
			}
		else if (response == "Buy")
		{
			say("@I can serve you mutton, beef, fowl or ham, all of which will make your mouth water. Which would you prefer?@");
			var muttoncost = 8;
			var beefcost = 14;
			var fowlcost = 10;
			var hamcost = 9;
			BuyMeat(muttoncost, beefcost, fowlcost, hamcost);
			UI_remove_answer("Buy");
		}
		}
	UI_remove_npc_face(item);
	}
}
