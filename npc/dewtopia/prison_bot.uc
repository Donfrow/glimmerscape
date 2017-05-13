/*
Prison automation inside sugar caves
*/

void PrisonBot object#(0x53d) ()
	{

var bark = "Response sequence initiated";
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
				UI_item_say(item, "Click whirr whirr click");
			else if (n == 2)
				UI_item_say(item, "Click");
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
        call PrisonBot, TALK;
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
	say("@Greetings again knight.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Greetings. As I do not have you in my prison roster I know that thee are a night of Dewtopia here of your own free will.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("click");
			break;
			}
		else if (response == "Name")
			{
			say("@I am a Prison Bot.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I oversee the Sugar Caves.@");
			UI_remove_answer("Job");
			UI_add_answer("Sugar Caves");
			UI_add_answer("Oversee");
			}
		else if (response == "Sugar Caves")
			{
			say("@The Sugar Caves are where the major criminals of Dewtopia are sent to labour for the length of their sentence.@");
			
			UI_remove_answer("Sugar Caves");
			}
		else if (response == "Oversee")
			{
			say("@I am programmed to oversee the prisoners here. I provide them with rations, work schedules and medical needs.@");
			say("@I also recover the remains of prisoners who have passed on while in custody.@");
			UI_remove_answer("Oversee");
			UI_add_answer("Rations");
			UI_add_answer("Work schedules");
			UI_add_answer("Medical needs");
			UI_add_answer("Remains");
			}
		else if (response == "Rations")
			{
			say("@Each prisoner is allotted a set amount of bread and water. I dispense these to the prisoners at the appropriate times.@");
			UI_remove_answer("Rations");
			}
		else if (response == "Work schedules")
			{
			say("@I let each prisoner know where and when they are to mine for the sugar.@");
			say("@I am programmed to allow leaway as long as an appropriate amount of sugar is mined each day.@");
			UI_remove_answer("Work schedules");
			}
		else if (response == "Medical needs")
			{
			say("@If a prisoner is injured or requires medical care I am programmed to provide them with the appropriate amount of care.@");
			UI_remove_answer("Medical needs");
			}
		else if (response == "Remains")
			{
			say("@Prisoners may perish before their sentence is up, or if there sentence is for life. It is my duty to gather their remains for disposal.@");
			say("@At times they may perish due to a cave in, and as a result they cannot be retrieved for some time.@");
			UI_remove_answer("Remains");
			}
		}
	UI_remove_npc_face(item);
	}
}
