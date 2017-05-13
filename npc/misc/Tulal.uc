/*
Tulal servant to Akakothen in Monitor crypts
*/

void Tulal object#(0x4b8) ()
	{

var has_soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);

var bark = "Uggh";
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
				UI_item_say(item, "Uggh");
			else if (n == 2)
				UI_item_say(item, "Umm");
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
        call Tulal, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);


      say("@Ungggh.@");



if (has_soul_orb > 0)
    {
        UI_play_music(55);
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
			converse
		{
		

	if (response == "Bye")
			{
			say("@Eternal rest... soon?@");
			break;
			}
		else if (response == "Name")
			{
			say("@Been... so long... ughh. Tulal.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
			say("@Job? I... do not remember what job... what must be done?");
			UI_remove_answer("Job");
			if(gflags[TALK_TO_SERVANT])
			{
				UI_add_answer("Did you serve Akakothen");
			}
		}
		else if (response == "Did you serve Akakothen")
		{
            say("The figure stars blankly for some time. @Servant... faithful servant of Akakothen I will forever be.@");
			UI_remove_answer("Did you serve Akakothen");
			UI_add_answer("Where lies Akakothen");
		}
        else if (response == "Where lies Akakothen")
		{
            say("It appears as if the ghost begins to tremble. @Proper rites not done... ensuing chaos after white light... lies beneath castle...@");
			say("Suddenly it opens its mouth and begins screaming. @No, master needs a proper buriel. How could I fail master? I am a failure!@");
            gflags[BASEMENT_OF_CASTLE] = true;
			script -184
			{
				say "A failure!";
			}
            break;
		}
        }
            
		}
	UI_remove_npc_face(item);
	}
}
