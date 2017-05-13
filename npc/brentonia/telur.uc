/*
Telur in Brentonia - Mint guy
*/


void Telur object#(0x4e9) ()
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
				UI_item_say(item, "Supplies are adequate");
			else if (n == 2)
				UI_item_say(item, "Seems things are on schedule");
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
        call Telur, TALK;
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
	
// Payment papers for Lewis
var paymentPapers = PARTY->count_objects(797, 109, ANY);

if (UI_get_item_flag(item, MET)) 
	{
		say("@How can I help you today?@");
		UI_remove_answer("Name");
		UI_add_answer("Exchange");

	}
else
	{

		say("@What can I do for you, stranger?@");
		UI_set_item_flag(item, MET, true);
	}
	
if (paymentPapers > 0)
{
	UI_add_answer("Shelter Payment Papers");
}
	
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Yes yes, I suppose I should get back my business.@");
            break;
        }
        else if (response == "Name")
        {
            say("@I am Telur.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I am the supply and mint caretaker here in Brentonia.@");
            UI_remove_answer("Job");
            UI_add_answer("Brentonia");
            UI_add_answer("Supply");
            UI_add_answer("Mint");
        }
        else if (response == "Brentonia")
        {
            say("@Brentonia is a city nestled in the great northern mountains. It is quite safe here.@");
            UI_remove_answer("Brentonia");
        }
        else if (response == "Supply")
        {
            say("@I am to keep record of our stock of supplies should the goblins ever cut us off. It is not very glamourous but it needs to be done.@");
            UI_remove_answer("Supply");
            UI_add_answer("Goblins");
        }
        else if (response == "Goblins")
        {
            say("@They are a foul menace, but more of an annoyance to us than a threat. They are much more dangerous to Dewtopia.@");
            UI_remove_answer("Goblins");
        }
        else if (response == "Mint")
        {
            say("@I ensure the treasury is adequate for the cities needs as well as exchange coins.@");
            UI_remove_answer("Mint");
            UI_add_answer("Exchange");
        }
        else if (response == "Exchange")
        {
				 if (UI_get_schedule_type(item) == 30) // Desk Work
					{
					    var nugget_rate = 25;
					    var bar_rate = 100;
					exchange_gold(nugget_rate, bar_rate);
					}
				else {
					say("@I am not doing exchanges right now.@");
					
					}
            UI_remove_answer("Exchange");
        }
		
		else if (response == "Shelter Payment Papers")
		{
			say("@You have official papers for me to release funds for the shelter? Lewis has been trying to get me to release that for some time but he did not have the paperwork. Let me have a look at that.@");
			say("As Telur takes the decree he reads through it carefully. @Everything seems to be in order here. No doubt what happened to poor Tonidra caused a delay in this being properly processed. I will have the funds released right away.@");
			say("@You may tell Lewis that everything will be taken care of shortly.@");
			UI_remove_party_items(1, 797, 109, ANY);
			gflags[PAID_LEWIS_DEBT] = true;
			UI_remove_answer("Shelter Payment Papers");
		}
	}
	UI_remove_npc_face(item);
	}
}
