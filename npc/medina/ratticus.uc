/*
Ratticus
*/

void Ratticus object#(0x4c8) ()
	{

var fiery_gem = UI_count_objects(PARTY, FIERY_GEM, ANY, ANY);

var bark = "Do us no harm";
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
				UI_item_say(item, "nibble nibble");
			else if (n == 2)
				UI_item_say(item, "scratch");
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
        call Ratticus, TALK;
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
		say("@You return.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@It is not often a human ventures into our cave.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if (gflags[MAKE_NECKLACE])
{
    UI_add_answer("Shiny ring");
    {
        if (gflags[MAKE_NECKLACE] && fiery_gem > 0)
        {
            UI_add_answer("Make necklace");
        }
    }
}

		         	converse
	           	{

	if (response == "Bye")
			{
			say("@Do come again with cheese.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Name? Such a human concept. But you may call me Ratticus.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@A human concept! We ratmen do not have jobs like you. We eat and sleep and live.@");
			UI_remove_answer("Job");
			UI_add_answer("Ratmen");
			}
		else if (response == "Ratmen")
		{
		  say("@Unlike men and unlike our brethern the rats. We are a mixed breed. We live in these caves in peace and do not cause trouble so please, do not cause trouble with us.@");
		  UI_remove_answer("Ratmen");
        }
        else if (response == "Shiny ring")
        {
            say("@Yes yes, shiny ring and other shiny things are given to the creature of the mountain. We live in her home it is only right that we give things for intruding.@");
            UI_add_answer("Creature");
            UI_add_answer("Ring");
            UI_remove_answer("Shiny ring");
        }
        else if (response == "Creature")
        {
            say("@She is a kind creature though confusing. We do not know what type of creature she is nor where she came from, but she was here before us.@");
            UI_remove_answer("Creature");
        }
        else if (response == "Ring")
        {
            say("@A ring we did give her along with other shiny rocks. Ring was found buried in this very cave. Ancient human treasure I believe it to have been, but of no value to us.@");
            UI_remove_answer("Ring");
            UI_add_answer("Shiny rocks");
			UI_add_answer("Cave");
        }
        else if (response == "Shiny rocks")
        {
            say("@Ratmen have no use for gold, and shiny rocks are far prettier. We give shiny rocks to the creature and also keep them ourselves.@");
            UI_remove_answer("Shiny rocks");
        }
        else if (response == "Make necklace")
        {
            say("@Of course I will make a gift for the creature for you. Creature is worthy of such gifts. Ratmen are good at making jewelry, better than you humans think.@");
            say("@Here is your necklace. Creature will be most pleased, it is nice and shiny.@");
            UI_remove_answer("Make necklace");
            UI_add_party_items(1, FIERY_NECKLACE, ANY, ANY);
            UI_remove_party_items(1, FIERY_GEM, ANY, ANY);
        }
		else if (response == "Cave")
		{
			say("@This portion of cave is small, though much deeper depths can be found beyond us. Simply go down the stairs.@");
			UI_remove_answer("Cave");
			UI_add_answer("Stairs");
		}
		else if (response == "Stairs")
		{
			say("@Stairs lead into depths of cave. I believe you humans call it such. You will encounter locked gate at bottom of stairs.@");
			UI_remove_answer("Stairs");
			UI_add_answer("Locked gate");
		}
		else if (response == "Locked gate")
		{
			say("@Gate was setup long before my kind showed up but we have explored the depths. If you wish to go you can use a key which your kind lost that came into our possession.@");
			say("@It is laying around here somewhere.@");
			UI_remove_answer("Locked gate");
		}

		}

	UI_remove_npc_face(item);
	}
}

