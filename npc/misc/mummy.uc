/*
Mummy High Priest in Monitor crypts
*/

void Mummy object#(0x458) ()
	{

var has_soul_orb = UI_count_objects(PARTY, ORB_OF_SOULS, ANY, ANY);

var bark = "Ugggh";
var bark_intro = "Stand fast creature";

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{
			UI_item_say(item, "Zzzz");
			return;
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
        call Mummy, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);


 say("@Difficult... maintain.... composure.. ungh");



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
			say("@Your transgressions are... noted.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am... Bakenkhons");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@High Priest of the Ophidians...@");
			UI_remove_answer("Job");
			UI_add_answer("Ophidians");
			UI_add_answer("Why can you talk better than other undead?");

			}
		else if (response == "Ophidians")
			{
            say("@The empire... collapsed... no more... tombs and rubble all that remain.@");
			UI_remove_answer("Ophidians");
			     if (gflags[HAS_ALL_ORBS])
			     {
			         UI_add_answer("Where is Akakothen");
                 }
			}
        else if (response == "Where is Akakothen")
            {
            say("@Akakothen... last ruler... cause of the collapse...@");
            UI_remove_answer("Where is Akakothen");
            UI_add_answer("Where does he lie?");
            }
         else if (response == "Where does he lie?")
            {
                say("@Much confusion in last days... proper buriel rites not preformed... servant may know.@");
                UI_remove_answer("Where does he lie?");
                UI_add_answer("Servant");
            }
         else if (response == "Servant")
         {
            say("@Head servant to Akakothen in these tombs... seek him out...@");
            gflags[TALK_TO_SERVANT] = true;
            UI_remove_answer("Servant");
         }
         else if (response == "Why can you talk better than other undead?")
         {
            say("@Well disciplined High Priest must be...@");
            UI_remove_answer("Why can you talk better than other undead?");
         }
                   }
		}
	UI_remove_npc_face(item);
	}
}
