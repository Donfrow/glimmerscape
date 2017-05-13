/*

Kilyne Dewtopia sewer lady

*/

void Kilyne object#(0x43e) ()
	{

var bark = "Hello there";
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
				UI_item_say(item, "Sew sew sew");
			else if (n == 2)
				UI_item_say(item, "Lots of gloves");
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
        call Kilyne, TALK;
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
	say("Again we meet sir");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to Dewtopia, you are a new face to me.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Have a wonderful day.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Those that know me call me Kilyne.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I sew and sew and sew! In other words, I sell fabrics, clothes, and other cloth goods in Dewtopia.@");
			UI_remove_answer("Job");
			UI_add_answer("Sew");
			}
		else if (response == "Sew")
			{
			say("@It was not originally my goal in life to be a weaver, but it turns out I am rather good at it. At least this job gives me a roof and out of harms way.@");
			UI_remove_answer("Sew");
			UI_add_answer("Harms way");
			}
		else if (response == "Harms way")
			{
			say("@Many creatures roam outside of Dewtopia. The most common being the Plains Bandits and Goblins.@");
			UI_remove_answer("Harms way");
			UI_add_answer("Plains Bandits");
			UI_add_answer("Goblins");
			}
		else if (response == "Plains Bandits")
			{
			say("@A group of thugs if you dost ask me, which clearly you did. They steal from the poor and rich alike to increase their coffers.@");
			say("@But within Dewtopia they tend not to trouble anyone. They are more of an annoyance to those outside the walls.@");
			UI_remove_answer("Plains Bandits");
			UI_add_answer("Outside the walls");
			}
		else if (response == "Outside the walls")
			{
			say("@Those unfortunate enough to not be within the protective walls of Dewtopia must face the dangers of the Plains Bandits moreso than us.@");
			say("@While I do feel sorry for them it is not my fault they are out there, so I do not lose sleep over it.@");
			UI_remove_answer("Outside the walls");
			}
		else if (response == "Goblins")
			{
			say("@They are giant green man-like creatures. Their stench causes my nostrils to burn and their sheer ugliness causes my eyes to water.@");
			say("@Luckily the walls protect us from them, but that does not protect my nose from their stench!@");
			UI_remove_answer("Goblins");
			}
		}
	UI_remove_npc_face(item);
	}
}
