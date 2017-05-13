/*

Graethe

*/


void Graethe object#(0x543) ()
	{

var bark = "Finally a living person...";
var bark_intro = "Knight...";

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
				UI_item_say(item, "The pain");
			else if (n == 2)
				UI_item_say(item, "I cannot last much longer...");
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
        call Graethe, TALK;
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


	say("@Oh pain...@");
gflags[FOUND_GRAETHE] = true;


		converse
		{
	if (response == "Bye")
			{
			say("@Take this note which I have written on old cloth... I cannot last much longer.@");
			say("@Gaaack@");
			UI_add_party_items(1, 707, 52, 1);
			UI_remove_npc_face(item);
			UI_item_say(item, "Gaaaaaack");
			UI_kill_npc(-323);

			break;
			}
		else if (response == "Job")
			{
			say("@I am a Dewtopian Knight.@");
			UI_remove_answer("Dewtopian Knight");
			}
		else if (response == "Name")
			{
			say("@I am Graethe, Dewtopian Knight, though I fear I will not be for much longer.@");
			UI_remove_answer("Name");
			UI_add_answer("Much Longer");
			}
		else if (response == "Much Longer")
			{
			say("@I have been food for that liche for so long I have lost count. I have learned much information as I have been prisoner in here that must be passed on before I die.@");
			say("@Take this note which I have written on old cloth... I cannot last much longer.@");
			say("@Gaaack@");
			UI_add_party_items(1, 707, 52, 1);
			UI_remove_npc_face(item);
			UI_item_say(item, "Gaaaaaack");
			UI_kill_npc(-323);
			break;
	
			}
	

		}
	UI_remove_npc_face(item);
	}
}
