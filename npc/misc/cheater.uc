/*
Cheater NPC in Monitor Jail
*/


void Cheater object#(0x462) ()
{

var bark = "Yes?";
var bark_intro = "Hail";

if (UI_get_schedule_type(item) == 14)
{		
	UI_item_say(item, "@...ZZzzZZZzzZ....@");
	return;
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
        call Cheater, TALK;
    }
    // avatar's script here
    abort;
}

else if (event == TALK)
{
        // dialog here
        
UI_show_npc_face(item);

UI_add_answer("Name");
UI_add_answer("Job");
UI_add_answer("Bye");	
UI_add_answer("Adjust Karma");

say("@Welcome to the House 'O' Cheats.@");
UI_set_item_flag(item, MET, true);

		converse
		{

		if (response == "Bye")
			{
			say("@Hasta La Vista, Baby");
			break;
			}
		else if (response == "Name")
			{
			say("@Why would I name a NPC in here?@");
			
			UI_remove_answer("Name");
			}
		else if (response == "Job")
		{
		  say("@I oversee the House 'O' Cheats");
		  UI_remove_answer("Job");
		  UI_add_answer("House 'O' Cheats");
        }
        else if (response == "House 'O' Cheats")
        {
            say("@The House 'O' Cheats is the old Monitor Jail. It is housed as so due to sentimental reasons. Originally when using Serpent Isle in Dos the jail was cleaned up and made into a bar and inn for NPC's.@");
            say("@Their schedules were modified to have them come and eat and loiter. NPC's from all around had their schedules changed to come here. That is except for Fawn since the attacking Fawn people was stupid due to the auto-jail.@");
            say("@Anyway... back to the actual building in its current state...@");
            say("@The various rooms contain weapons, armor and other game content. A mod without making a cheat room certainly would not be in the spirit of Ultima7, would it?@");
            UI_remove_answer("House 'O' Cheats");
            UI_add_answer("Why is Iolo baking in here?");
        }
        else if (response == "Why is Iolo baking in here?")
        {
            say("@That is a joke which cannot be explained well. Suffice to say, that is Iolo's REAL place in the world.@");
            UI_remove_answer("Why is Iolo baking in here?");
        }
        else if (response == "Adjust Karma")
        {
            say("@The current level of the pseudo-karma system is " + karma, ". Use the slider to adjust between 0 and 100. All values are multipled by 100 for the final result.@");
            var karmaadjust = UI_input_numeric_value(0, 100, 1, 50);
            karma = karmaadjust * 100;
            say("@Karma level adjusted to " + karma);
            UI_remove_answer("Adjust Karma");
        }
        }
UI_remove_npc_face(item);

}
}
        


