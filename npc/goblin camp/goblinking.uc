/*
Goblin King
*/

void GoblinKing object#(0x55e)()
	{

var bark = "Human!";
var bark_intro = "Halt beast";

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
				UI_item_say(item, "Gruplinort gobble");
			else if (n == 2)
				UI_item_say(item, "Gobbledegoo");
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
        call GoblinKing, TALK;
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
		UI_add_answer("Liche");	

if (UI_get_item_flag(item, MET)) 
	{
	say("@You will not escape this time.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@You are impressive to have made it this far but you will not make it farther.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@You will be a lovely feast.@");
			set_alignment(HOSTILE); 
   			set_schedule_type(IN_COMBAT); 
   			set_opponent(AVATAR); 
			break;
			}
		else if (response == "Name")
			{
			say("@You are in the presence of the mighty Glurb.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@To eat feast on the flesh of the likes of you.@");
			UI_remove_answer("Job");
			}
		else if (response == "Liche")
			{
			say("@Indeed the Liche of the southern mountains did aid us. My minions that creature did feast on in exchange were a small price to pay for the knowledge we gained.@");
			say("@Soon we wilt no longer need the Liche and we shall feast on it as it has feasted upon us.@");
			UI_remove_answer("Liche");
			}
		else if (response == "The Liche is slain")
			{
			say("@If the Liche has been slain you has saved us much work. Unfortunately for you now it is time for you to be slain.@");
			UI_remove_answer("The Liche is slain");
			UI_add_answer("Over my dead body");
			}
		else if (response == "Over my dead body")
			{
			say("@That is the idea. Hope you enjoy being on my dinner plate. I know I will.@");
			set_alignment(HOSTILE); 
   			set_schedule_type(IN_COMBAT); 
   			set_opponent(AVATAR); 
			break;
			}


		}
	UI_remove_npc_face(item);
	}
}
