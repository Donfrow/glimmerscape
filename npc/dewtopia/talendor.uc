/*

Talendor the Inn Keeper of Dewtopia

*/

void Talendor_Room()
{
	UI_push_answers();
	UI_add_answer("Yes");
	UI_add_answer("No");
	converse
{
		if (response == "Yes")
			{
				var amount = 50;
				if (chargeGold(amount)) // automatically removes the 50 gold
				{
				say("@Your room is the centre room. Here is the key.@");
				UI_add_party_items(1, KEY, 10, ANY);	
				UI_clear_answers();
				UI_pop_answers();
				break;
				}
				else
				{
				say("@I am afraid your coffers are too empty to afford it.@");
				UI_clear_answers();
				UI_pop_answers();
				break;
				} 
			}
		else if (response == "No")
		{
			say("@Very well.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
}
}

void Talendor object#(0x52f) ()
	{

var amount = 50;

var roomcost = UI_count_objects(AVATAR, 644, 50, -359);

var bark = "Welcome";
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
				UI_item_say(item, "Such a fine day");
			else if (n == 2)
				UI_item_say(item, "Nicest beds in all the lands");
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
        call Talendor, TALK;
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
	say("@Need a place to stay?@");
	UI_remove_answer("Name");
	}
else
	{
	say("@A pleasure to see a new face.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	
if (gflags[TALENDOR])
	{
	UI_add_answer("Inn Guild");
	}

		converse
		{
	if (response == "Bye")
			{
			say("@Sleep well!@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Talendor at your service. Can I interest you in a room for the night?@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I run the Inn in Dewtopia. I can provide you with a room any time you wish, just approach me!@");
			UI_remove_answer("Job");
			UI_add_answer("Inn");
			}
		else if (response == "Inn")
			{
			say("@It is a fine inn, protected by the wonderful guards of Dewtopia which leaves you safe from Goblins, Bandits or any other dangers.@");
			UI_remove_answer("Inn");
			UI_add_answer("Room");
			UI_add_answer("Goblins");
			UI_add_answer("Bandits");
			UI_add_answer("Other dangers");
			}
		else if (response == "Goblins")
			{
			say("@Savage, savage creatures. Very strong yet very dumb. You will be safe from them within Dewtopia's walls.@");
			UI_remove_answer("Goblins");
			}
		else if (response == "Bandits")
			{
			say("@The bandits around these parts, known as the Plains Bandits, are nothing more than petty thieves. You will not have to worry about them in Dewtopia.@");
			UI_remove_answer("Bandits");
			}
		else if (response == "Other dangers")
			{
			say("@You are safe from any dangers within the city walls of Dewtopia. I dare not even think what other hidious things live outside the city.@");
			UI_remove_answer("Other dangers");
			}
		else if (response == "Room")
			{
			say("@I charge 50 gold coins for a room. This may seem steep, but remember you are protected from all the dangers when you stay with me.@");
			say("@So... would you like a room?@");
			Talendor_Room();
			UI_remove_answer("Room");

			}

		else if (response == "Inn Guild")
			{
			say("@Yes, I am a member of the Guild. We speak with each about unruly guests so that we may avoid them. Do you have any particular questions?@");
			
			UI_remove_answer("Inn Guild");
			UI_add_answer("The Boar's Rest");

			}
		else if (response == "The Boar's Rest")
			{
			say("@Ah yes, that Inn is far outside the safety of Dewtopia. I have not spoken with its proprietor in some time.@");
			say("@I would not be surprised if it has been destroyed with the recent surge of Goblin and Bandit activity as they have minimal guards stationed there.@");
			say("@If you have any other questions about the fine inn's of these lands, you should seek out my book in the Dewtopian Library.@");
			UI_remove_answer("The Boar's Rest");
			}
		}
	UI_remove_npc_face(item);
	}
}
