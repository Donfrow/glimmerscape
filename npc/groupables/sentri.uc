/*
Sentri, fellow sailor outside of Cotton Cove
*/


void Sentri object#(0x5a5) ()
	{
var bark;
var bark_intro = "Hail";
if(inParty(421))
{
bark = "Yes?";
}
else
{
bark = "You survived!";
}
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
				UI_item_say(item, "Such a horrible storm");
			else if (n == 2)
				UI_item_say(item, "All was lost");
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
        call Sentri, TALK;
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
		
if (inParty(-421))
{
    UI_add_answer("Leave");
}

if (UI_get_item_flag(item, MET)) 
	{
		say("@What do you require?@");
		UI_remove_answer("Name");

	}
else
	{

		say("@It is you! I thought I was the only survivor of the storm!@");
		UI_add_answer("Storm");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag



		converse
		{
        if (response == "Bye")
        {
            say("@Fair well.@");
            break;
        }
        else if (response == "Name")
        {
            say("@The storm must have battered your brains. It is me, Sentri!");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@As our ship is destroyed and the crew mostly dead as a result of the storm I suppose I no longer possess a job.@");
            UI_remove_answer("Job");
            UI_add_answer("Ship");
            UI_add_answer("Crew");
            UI_add_answer("Storm");
            if(inParty(421))
            {
            }
            else
            {
            UI_add_answer("Join");
            }
        }
        else if (response == "Ship")
        {
            say("@I was tossed overboard before the ship was destroyed but I know it could not have survived such a storm. You have confirmed my suspician about such a thing.@");
            UI_remove_answer("Ship");
        }
        else if (response == "Crew")
        {
            say("@I thought myself to be the only survivor until you showed up. I am glad I am not the only one, but I fear the odds of finding another survivor is small.@");
			say("@Such a tragedy that we have lost such fine sailors. I shall miss Jonas and Spectan.@");
            UI_remove_answer("Crew");
			UI_add_answer("Jonas");
			UI_add_answer("Spectan");			
        }
		else if (response == "Jonas")
		{
			say("@Jonas was a great sailor. One of the finest I have had the privilge to sail with. I shall miss him.@");
            UI_remove_answer("Jonas");			
		}
		else if (response == "Spectan")
		{
			say("@As good of a lookout as Spectan was I am surprised he did not see that storm growing on the horizon. I suppose he has paid for that error with his life.@");
            UI_remove_answer("Spectan");			
		}
        else if (response == "Storm")
        {
            say("@Such a storm I have never seen on all my days on the sea. Such horrible luck that we were caught in it.@");
            UI_remove_answer("Storm");
            UI_add_answer("What were we doing?");
        }
        else if (response == "What were we doing?")
        {
            say("@You must have been extremely shaken up! We were to deliver the supplies the island keep north of Cotton Cove.@");
            UI_remove_answer("What were we doing?");
            UI_add_answer("Supplies");
        }
        else if (response == "Supplies")
        {
            say("@We shant speak of the cargo, especially now that it belongs to the sea. As well, if you recall I am merely sent on such journies to combat a pirate attack, should we run into it.@");
            say("@Sadly, I cannot combat a storm.@");
            UI_remove_answer("Supplies");
        }
        else if (response == "Join")
        {
            say("@I suppose that is the best thing to do at this time. There is not much else which can be done.@");
            UI_remove_answer("Join");
            UI_add_to_party(-421);
        }
        else if (response == "Leave")
        {
            say("@I feel that is unwise, but if you no longer wish for me to accompany you, I shall leave.@");
            UI_remove_from_party(-421);
            UI_remove_answer("Leave");
        }
}
	UI_remove_npc_face(item);
	}
}
