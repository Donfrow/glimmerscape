/*
Devra the bar lady in Medina
*/



void Devra object#(0x429) ()
	{

var bark = "How can I help you?";
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
				UI_item_say(item, "Try the mutton");
			else if (n == 2)
				UI_item_say(item, "Thy the fowl");
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
        call Devra, TALK;
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
		say("@I hope the sea air is treating you well.@");
		UI_remove_answer("Name");
		UI_add_answer("Buy");
	}
else
	{

		say("@Greetings, how may I help you today?@");
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
            say("@You mayest call me Devra.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I tend the tavern here in Medina.@");
            UI_remove_answer("Job");
            UI_add_answer("Tavern");
            UI_add_answer("Medina");
        }
        else if (response == "Medina")
        {
            say("@Medina is a fine island. Geographically it is somewhat closer to the frigid planes than other islands but the temperature does not get too cold. It is also the place where the Nautical Guild has its headquarters.@");
            UI_remove_answer("Medina");
            UI_add_answer("Nautical Guild");
        }
        else if (response == "Nautical Guild")
        {
            say("@If you truely do not know what it is I am sure that you can enquire at their headquarters. It is directly north of the dockmaster.@");
            UI_remove_answer("Nautical Guild");
        }
        else if (response == "Tavern")
        {
            say("@Tis a fine business if you ask me. Business hath been somewhat slower lately but it still manages to keep me with enough coin to live comfortably.@");
            UI_remove_answer("Tavern");
            UI_add_answer("Buy");
        }
        else if (response == "Buy")
        {
            if (UI_get_schedule_type(item) == WAITER)
            {
            say("@And what would you like to purchase?@");
            var muttoncost = 5;
            var beefcost = 4;
            var fowlcost = 4;
            var hamcost = 10;
            BuyMeat(muttoncost, beefcost, fowlcost, hamcost);
            }
            else
            {
            say("@I am not currently open for business. Please return when I am.@");
            }
            UI_remove_answer("Buy");
        }


		}
	UI_remove_npc_face(item);
	}
}
