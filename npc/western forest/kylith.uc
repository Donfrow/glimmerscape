/*
Kylith Batbane - Artemis's wife
*/


void Kylith object#(0x436) ()
	{

var bark = "Hello";
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
				UI_item_say(item, "Dumdadee");
			else if (n == 2)
				UI_item_say(item, "Artemis is my life");
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
        call Kylith, TALK;
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
		say("@Hello again.@");
		UI_remove_answer("Name");
	}
else
	{

		say("@Greetings, stranger.@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag




		converse
		{

	if (response == "Bye")
			{
			say("@Be wary of bandits and goblins good sir.@");
			break;
			}
		else if (response == "Name")
			{
			say("@You may call me Kylith Batbane.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am a but a humble housewife.@");
			UI_remove_answer("Job");
			UI_add_answer("Housewife");
			}
		else if (response == "Housewife")
			{
			say("@I tend to the animals and my house while my husband is away. When he returns home we work together. It is not a glamourous life but I do not seek adventure.@");
			UI_remove_answer("Housewife");
			UI_add_answer("Husband");
			}
		else if (response == "Husband")
			{
			say("@Artemis is my husband. I do not spend enough time with him as he is always working, but when he is home I greatly enjoy it.@");
			UI_remove_answer("Husband");
			UI_add_answer("Work");
			}
		else if (response == "Work")
			{
			say("@He slays foul beasts and is often times hired by the Solusek Mining Company to do so. I often worry for him when he is fighting such beasts but he has always returned home to me.@");
			UI_remove_answer("Work");
			UI_add_answer("Solusek Mining Company");
			}
		else if (response == "Solusek Mining Company")
			{
			say("@They are the biggest company in all these lands. I am surprised you have not heard of them.@");
			UI_remove_answer("Solusek Mining Company");
			}
		}
	UI_remove_npc_face(item);
	}
}
