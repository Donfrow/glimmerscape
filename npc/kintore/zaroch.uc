/*
Zaroch, guy in Kintore
*/

void WhoAreYou()
{
UI_push_answers();

UI_add_answer("Sergeant Slate");
UI_add_answer("Bob");
UI_add_answer("I am The Batman");
UI_add_answer("Dr Jones");


	converse
	{
		if (response == "Sergeant Slate")
		{
		say("@You are an affront to my sense.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}
		else if (response == "Bob")
		{
		say("@What about Bob?@");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}
		else if (response == "I am The Batman")
		{
		say("@Of course you are.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}
		else if (response == "Dr Jones")
		{
		say("@No time for love Dr. Jones.@");
		UI_clear_answers();
		UI_pop_answers();
		break;
		}
	}

}


void Zaroch object#(0x4bc) ()
	{

	
var bark = "Hello commoner";
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
				UI_item_say(item, "I am so great");
			else if (n == 2)
				UI_item_say(item, "Of course");
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
        call Zaroch, TALK;
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
		LookForDarkMonk();

if (UI_get_item_flag(item, MET)) 
	{
		say("@Yes?@");
		UI_remove_answer("Name");
	}
else
	{

	say("@What would you like with me?@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag




		converse
		{

	if (response == "Bye")
			{
			say("@Yes yes, be on thy way.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Zaroch and who are you?@");
			WhoAreYou();
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@Why would I need a job? I am rich.@");
			UI_remove_answer("Job");
			UI_add_answer("Rich");
			}
		else if (response == "Rich")
			{
			say("@That is right, rich. Rich beyond your wildest dreams. That is why I have chosen to retire here to the simple life.@");
			UI_remove_answer("Rich");
			UI_add_answer("Simple life");
			}

		else if (response == "Simple life")
			{
			say("@I was hoping to settle down and avoid having to answer questions from those such as yourself.@");
			say("@So if you would be so kind, please leave me be.@");
			break;
			}

		else if (response == "Seen any ex-dark monks lately?")
			{
			say("@I do not keep tabs on the citizens nor guests of Kintore so please do not ask such things of me.@");
			UI_remove_answer("Seen any ex-dark monks lately?");

			}

		
		
		}
	UI_remove_npc_face(item);
	}
}
