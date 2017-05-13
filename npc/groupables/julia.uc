/*
Julia in Lechuck's prison
*/


void Julia object#(0x497) ()
	{
var bark = "Yes?";
var bark_intro = "Hail";

var locked_door = UI_find_nearby([2738, 1144, 0], 270, 3, MASK_NONE);
var locked_door_quality = UI_get_item_quality(locked_door);

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
			}
		else
			{
			if (inParty(-151))
			{
            }
            else
            {
			var n = UI_get_random(2);// 1-2.
			if (n == 1)
				UI_item_say(item, "Such a life");
			else if (n == 2)
				UI_item_say(item, "Why oh why");
            }
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
        call Julia, TALK;
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

if(inParty(-151))
{
    UI_add_answer("Leave");
    say("@What do you desire of me?");
    converse
    {
        if (response == "Name")
        {
            say("@Have you forgotten already? I am Julie.@");
        }
        else if (response == "Bye")
        {
            say("@Onward!@");
            break;
        }
        else if (response == "Job")
        {
            say("@I was a prisoner until you freed me. Now I journey with you. Have you forgotten already?");
            UI_remove_answer("Job");
        }
        else if (response == "Leave")
        {
            say("@If that is what you desire, I shall leave.@");
            UI_remove_answer("Leave");
			UI_add_answer("Join");
            UI_remove_from_party(-151);
        }
        else if (response == "Join")
        {
            say("@As you have freed me from the clutches of LeChuck I owe you what I can. I will join you.@");
            UI_remove_answer("Join");
			UI_add_answer("Leave");
            UI_add_to_party(-151);
        }
    }
}
else
{

if (UI_get_item_flag(item, MET))
	{
		say("@Why do you continue to do nothing?@");
		UI_remove_answer("Name");

	}
else
	{

		say("@Please, help me!@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag


converse
{
	if (response == "Bye")
	{
		if (inParty(-151))
		{
			say("@Onward!@");
		}
		else
		{
			say("@I suppose noone would want to stay talking to me...@");
		}
		break;
	}
        else if (response == "Name")
        {
            say("@You can call me anything you want if you free me, but my name is Julia.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
			if(locked_door && locked_door_quality == 39) //If she is still in the prison and you have not unlocked the door
			{
				say("@What does it look like my job is? I am meant to rot away in this cell as LeChuck's prisoner.@");
				UI_add_answer("Prisoner");
			}
			else
			{
				say("@Since you freed me I no longer have a job. Before LeChuck and his minions took me prisoner I worked on a ship, however all of my crewmates are now dead.@");
				UI_remove_answer("Job");
				UI_add_answer("Minions");
				UI_add_answer("Join");
			}
			UI_remove_answer("Job");
			UI_add_answer("LeChuck");
        }
        else if (response == "LeChuck")
        {
            say("@If you are speaking to me and not knowing about LeChuck I do not know what to say. You would have had to go through him to get to me.@");
            UI_remove_answer("LeChuck");
        }
        else if (response == "Minions")
        {
            say("@They would do LeChucks bidding without a second thought. They were none too bright but as strong as an ox.@");
            UI_remove_answer("Minions");
        }
        else if (response == "Join")
        {
            say("@As you have freed me from the clutches of LeChuck I owe you what I can. I will join you.@");
            UI_remove_answer("Join");
			UI_add_answer("Leave");
            UI_add_to_party(-151);
        }
	    else if (response == "Leave")
        {
            say("@If that is what you desire, I shall leave.@");
            UI_remove_answer("Leave");
            UI_remove_from_party(-151);
        }
		else if (response == "Prisoner")
		{
			say("She looks at you dumbfounded. @Can you not see the bars in which I am encased in? I have no freedom, I cannot leave at will.@");
			say("@I am a prisoner until I am freed or die.@");
			UI_remove_answer("Prisoner");
		}

		}
	UI_remove_npc_face(item);
}	
	}
	}

