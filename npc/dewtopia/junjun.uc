/*

JunJun the mad Jester 

*/


void JunJun object#(0x541) ()
	{

var bark = "Tehehehe you look fun...";
var bark_intro = "Hail";

var loc = get_object_position(item);

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
				UI_item_say(item, "Muhaha");
			else if (n == 2)
				UI_item_say(item, "Tehehehe");
			}
		}
if (event == DOUBLECLICK)
{

if(AVATAR->is_dest_reachable(loc))
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
        call JunJun, TALK;
    }
    // avatar's script here
    abort;
}
}
else if (event == TALK)
{

	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if (UI_get_item_flag(item, MET)) 
	{
	say("@Buhahaha.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@You found me yes you see!@");
	UI_set_item_flag(item, MET, true);
	}


if(gflags[JESTER])
	{
	UI_add_answer("Lich");
	}

	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Buhahaha.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Name? What is in a name! A name is in a name of course!@");
			say("@But for what is in that name, it is Jun Jun.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@What does a job possess? Nothing!@");
			say("@I do nothing! For that is my job. Nothing! Buhaha.@");
			UI_remove_answer("Job");
			UI_add_answer("What do you do here?");
			}
		else if (response == "What do you do here?")
			{
			say("@Why I live here. You are more daft than I did first think! Buhaha.@");
			UI_remove_answer("What do you do here?");
			}
		else if (response == "Lich")
			{
			say("@A lich a lich! Liches feast on the living to stay strong! A lich a lich!@");
			UI_remove_answer("Lich");
			UI_add_answer("Tell me more");
			}
		else if (response == "Tell me more")
			{
			say("@A lich in the mountain a lich a lich!@");
			say("@Ohh I should not have said that. You heard nothing. Nothing was heard!@");
			UI_remove_answer("Tell me more");
			UI_add_answer("I demand answers");
			}
		else if (response == "I demand answers")
			{
			say("@Nooo it is not feeding time yet he still has a meal to consume nooo not ready yet!@");
			UI_remove_answer("I demand answers");
			UI_add_answer("Feeding time");
			}
		else if (response == "Feeding time")
			{
			say("@Feed only at certain times on one morsal of food. I cannot gather even more to feed two morsals of food.@");
			UI_remove_answer("Feeding time");
			UI_add_answer("Food");
			}
		else if (response == "Food")
			{
			say("@Lich feeds over time must keep his meal alive! He must feed meal to feed himself! I bring food to feed meal for Master.@");
			say("@Hard to get food to feed his meals. Master would be displeased with starving meals.@");
			UI_remove_answer("Food");
			UI_add_answer("Master");
			}
		else if (response == "Master")
			{
			say("@My job my job real job to serve Master! I bring Master food.@");
			say("@I should not have told you about Master! Master entrusted me with key to lair and I tell you all about master!@");
			say("@I must bring you to master like the last morsal of food.@");
			UI_remove_answer("Master");
			UI_add_answer("Last Morsal");
			}
		else if (response == "Last Morsal")
			{
			say("@Other morsal in armor asked same questions as you now ask! Master was not pleased when I brought him before him!@");
			say("@I must now take you to master! I hope he does not punish me too much... but you will be punished even more!@");
			UI_remove_answer("Last Morsal");
			UI_set_alignment(-321, HOSTILE);
			UI_set_opponent(-321, PARTY);
			UI_set_schedule_type(-321, IN_COMBAT);
   			UI_clear_item_flag(-321, 29);
			AttackAvatar();
			break;
			}
		

		}
	UI_remove_npc_face(item);
	}
	}
