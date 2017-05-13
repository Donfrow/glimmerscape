/*
Murgle the goblin jailkeeper
*/

void Murgle object#(0x560)()
	{

var bark = "Human!";
var bark_intro = "Stand fast goblin";

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
				UI_item_say(item, "Gruplinortgubble");
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
        call Murgle, TALK;
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
	say("@You will be slain.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Another prisoner for my torture chamber.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@You will not enjoy my jail.@");
			set_alignment(HOSTILE); 
   			set_schedule_type(IN_COMBAT); 
   			set_opponent(AVATAR); 
			break;
			}
		else if (response == "Name")
			{
			say("@Murgle shall slay you.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@To torture and cause suffering to my pets.@");
			UI_remove_answer("Job");
			UI_add_answer("Pets");
			}
		else if (response == "Pets")
			{
			say("@The likes of you are my pets. I do enjoy causing them much suffering.@");
			say("@And now that you have come to me I shall make you one of my pets. Do enjoy.@");
			UI_remove_answer("Pets");
			set_alignment(HOSTILE); 
   			set_schedule_type(IN_COMBAT); 
   			set_opponent(AVATAR); 
			break;
			}
		}
	UI_remove_npc_face(item);
	}
}
