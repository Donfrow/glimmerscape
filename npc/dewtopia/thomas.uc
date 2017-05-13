/*

*/

void Thomas object#(0x4f1)()
	{
var bark = "Greetings";
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
				UI_item_say(item, "Damn paperwork");
			else if (n == 2)
				UI_item_say(item, "Sometimes I wish I was outside these walls");
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
        call Thomas, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);
if (UI_get_item_flag(item, MET)) 
	{
	say("@It is good to see you again.@");
	}
else
	{
	say("@Greetings, welcome to Dewtopia.@");
	say("@You best stay out of trouble while here or you may end up under my watch.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	
	
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{


if (response == "Bye")
		{
			say("@Do stay out of trouble. I would not want to have you become my guest.@");
			break;
		}
		else if (response == "Name")
			{
			say("@My name is Thomas.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am one of two full time guards who book and keep watch of trouble makers inside Dewtopia.@");
			UI_add_answer("Trouble Makers");
			UI_add_answer("Other guard");
			UI_remove_answer("Job");
			}
		else if (response == "Other guard")
			{
			say("@Jeroan and I take shifts booking and keeping an eye on the trouble makers.@");
			UI_remove_answer("Other guard");
			}
		else if (response == "Trouble Makers")
			{
			say("@Anyone who causes unrest in Dewtopia is thrown in the jail. A trial is later to determine if they should be set free or sent to toil in the underground sugar caves.@");
			UI_remove_answer("Trouble Makers");
			UI_add_answer("Sugar caves");
			UI_add_answer("Trial");
			}
		else if (response == "Sugar caves")
			{
			say("@I do not know much of the details, suffice to say you do not want to be there.");
			UI_remove_answer("Sugar caves");
			}
		else if (response == "Trial")
			{
			say("@When a public trial is held it is held just north of the castle. However only major crimes will have a trial, such as an attempt to steal from the Royal Mint.@");
			UI_remove_answer ("Trial");
			UI_add_answer("Royal Mint");
			}
		else if (response == "Royal Mint")
			{
			say("@It contains the gold and coin of the Dewtopian Empire. It is also very well guarded and many a would-be thief has ended up under my watch until their trial.@");
			UI_remove_answer ("Royal Mint");
			UI_add_answer ("Would-be thief");
			}
		else if (response == "Would-be thief")
			{
			say("@Many try to sneak into the Royal Mint to help themselves to a piece of King Dew's treasure.@");
			say("@In fact, one of our newest guests was caught trying to steal from the Royal Mint just recently.@");
			UI_remove_answer ("Would-be thief");
			UI_add_answer ("Newest guest");
			}
		else if (response == "Newest guest")
			{
			say("@Jeroan booked him. I do not know of the details other than he is here for attempting to steal from the Royal Mint.@");
			UI_remove_answer ("Newest guest");
			}
		}
	UI_remove_npc_face(item);
	}
}
