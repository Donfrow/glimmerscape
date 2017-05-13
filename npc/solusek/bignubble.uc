/*
Captain Bignubble in Solusek Mining Company
*/


void Bignubble object#(0x405) ()
	{

var bounty_scroll = UI_count_objects(AVATAR, SCROLL1, 66, 2); 


var bark = "Hello";
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
				UI_item_say(item, "Such complaints");
			else if (n == 2)
				UI_item_say(item, "Those miners are lucky");
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
        call Bignubble, TALK;
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
		say("@Why do you continue to pester me?");
		UI_remove_answer("Name");
	}
else
	{

	say("@Yes?@");
	UI_set_item_flag(item, MET);
	}
// End MET Flag


// Check if you have flanwald's head in your party

if (bounty_scroll > 0)
	{
	UI_add_answer("Collect on Bounty");

	}

		converse
		{

	if (response == "Bye")
			{
			say("@Bye indeed.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Bignubble, Captain to you.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am the body guard and personal assistant to the head of the Solusek Mining Company, Gabbie Mardoddle. I also serve the lord of the island, Lord Gimblox.@");
			UI_remove_answer("Job");
			UI_add_answer("Solusek Mining Company");
			UI_add_answer("Gabbie Mardoddle");
			UI_add_answer("Lord Gimblox");
			}
		else if (response == "Solusek Mining Company")
			{
			say("@I do not care to answer your questions about the company. Go ask the entrance secretary. She does love to babble.@");
			UI_remove_answer("Solusek Mining Company");
			}
		else if (response == "Gabbie Mardoddle")
			{
			say("@She is the head of the company and a lovely woman. She does what needs to be done and allows for massive profits.@");
			UI_remove_answer("Gabbie Mardoddle");
			UI_add_answer("What needs to be done");
			}
		else if (response == "Lord Gimblox")
		{
			say("@Lord Gimblox is the lord of this island. When the company was first formed this island was vast in its riches so a deal had to be made with the local lord.@");
			say("@It has made both both the company and Lord Gimblox quite wealthy, not that a man as vain as Lord Gimblox more to give him an inflated sense of self.@");
			UI_remove_answer("Lord Gimblox");
			UI_add_answer("Vain");
		}
		else if (response == "Vain")
		{
			say("@Lord Gimblox is a terribly vain man and thinks himself to be above all others. All of the gold he has aquired through the deal with the company has only made his ego bigger. No doubt that man wishes he could live forever.@");
			say("He stops abruptly. @Excuse me, I should not discuss such things or involve myself with spreading gossip.@");
			UI_remove_answer("Vain");
		}
		else if (response == "What needs to be done")
			{
			say("@I will not get into specifics but suffice to say it works.@");
			UI_remove_answer("What needs to be done");
			}

		else if (response == "Collect on Bounty")
			{
			say("@Ah I see that you have brought Flanwald to justice. Such a swine. Here is your payment. Now do not doddle around, neither Gabbie nor Lord Gimblox cares for such things.@");
			UI_add_party_items(250, SHAPE_GOLD, ANY, ANY); // add 250 gold
			UI_remove_party_items(1, SCROLL1, 66, 2); // Removes the scroll to get payment
			UI_remove_answer("Collect on Bounty");
			}


	}	}
	UI_remove_npc_face(item);
	}

