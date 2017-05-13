/*

Wendy at The Logger's Stump

*/


void Wendy object#(0x558) ()
	{

var bark = "Good day to you";
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
				UI_item_say(item, "Best food in the forest");
			else if (n == 2)
				UI_item_say(item, "Nice day");
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
        call Wendy, TALK;
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
	say("@I knew you couldst not resist my cooking.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Well met milord.@");
	UI_set_item_flag(item, MET, true);
	}

if (gflags[ASK_WENDY])
	{
	UI_add_answer("Jesse and Bains");
	}

		converse
		{
	if (response == "Bye")
			{
			say("@You were lovely company.@");
			break;
			}
		else if (response == "Job")
			{
			say("@I work with my husband and son at The Logger's Stump.@");
			UI_remove_answer("Job");
			UI_add_answer("Husband");
			UI_add_answer("Son");
			}
		else if (response == "Name")
			{
			say("@I am Wendy good sir.@");
			UI_remove_answer("Name");
			}
		else if (response == "The Logger's Stump")
			{
			say("@It is a cozy little inn nestled in the Northern Forest. Beware of bandits as you travel though.@");
			UI_remove_answer("The Logger's Stump");
			UI_add_answer("Bandits");
			}
		else if (response == "Bandits")
			{
			say("@A group which call themselves the Northern Bandits rob and murder inhabitants if you art caught off guard. Rest assured if you stay at the inn that you will be well protected.@");
			
			UI_remove_answer("Bandits");
			}
		else if (response == "Husband")
			{
			say("@Burtan is his name. It was his idea to create the inn. I must admit I was wary at first but it turns out that it was a good idea.@");
			UI_remove_answer("Husband");
			}
		else if (response == "Son")
			{
			say("@Wendill is my son. He is a good boy and helps run the inn with Burtan and I.@");
			UI_remove_answer("Son");
			}
		else if (response == "Jesse and Bains")
			{
			say("@Aye, I did overhear them talking amongst themselves. One hears many things as a server.@");
			UI_remove_answer("Jesse and Bains");
			UI_add_answer("What did you hear");
			}
		else if (response == "What did you hear")
			{
			say("@Those two did talk about travelling to the west. It was something about meeting a ship. That is all I know and I will not enquire why you seek those two out.@");
			say("@Beware if you travel that direction as the goblins live among the mountains there.@");
			UI_remove_answer("What did you hear");
			}
	

		}
	UI_remove_npc_face(item);
	}
}
