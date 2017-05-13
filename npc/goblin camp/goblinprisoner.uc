/*
Goblin Prisoner in the goblin city
*/

void GoblinPrisoner object#(0x562)()
	{

var bark = "I did not want to die alone...";
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
				UI_item_say(item, "I cannot last");
			else if (n == 2)
				UI_item_say(item, "Oh the pain");
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
        call GoblinPrisoner, TALK;
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
	say("@Thank you for now I will not die alone amoung these beasts.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Thank you for now I will not die alone amoung these beasts.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Do not... forget the scroll. Ugh.@");
			UI_kill_npc(-504);
			break;
			}
		else if (response == "Name")
			{
			say("@It is not important, it is only important that you are here.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am but a piece of meat for the goblins experiments.@");
			UI_remove_answer("Job");
			UI_add_answer("Experiments");
			}
		else if (response == "Experiments")
			{
			say("@I do not know how but the goblins have gained an intelligence never before seen...@");
			say("@They have been combining their prisoners with spiders and other creatures to create abominations that no doubt you have encountered.@");
			say("@You must stop them before it is too late for the beasts will be unstoppable if they can continue this.@");
			say("@Ugh I cannot continue on... please, be a a noble soul and take my last words off my body to my wife in Alayna in Brentonia...@");
			UI_remove_answer("Experiments");
			UI_kill_npc(-504);
			break;
			}
		}
	UI_remove_npc_face(item);
	}
}
