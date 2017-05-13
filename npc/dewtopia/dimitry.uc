/*

Dimitry the fancy pirate
*/

void Dimitry object#(0x4f9) ()
	{
var bark = "Deary";
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
				UI_item_say(item, "Noone appreciates the finer things");
			else if (n == 2)
				UI_item_say(item, "Simply fabulous");
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
        call Dimitry, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
if (UI_get_item_flag(item, 28)) 
	{
	say("@We simply must chat some more!@");
	}
else
	{
	say("@Greetings stranger, you are looking wonderful today.@");
	UI_set_item_flag(item, 28, true);
		}
// End MET Flag
	
		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{
	if (response == "Bye")
			{
			say("@Safe travels.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Dimitry.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@Noone appreciates a fancy pirate so at the moment I am unemployed.@");
			UI_remove_answer("Job");
			UI_add_answer("Fancy pirate");
			}
		else if (response == "Fancy pirate")
			{
			say("@Pirates need not be roughnecks with dirty clothes, hooks for hands and eyepatches. We can dress fabulously and pillage in style deary.@");
			UI_remove_answer("Fancy pirate");
			UI_add_answer("So why are you here?");
			UI_add_answer("Deary?");
			}
		else if (response == "So why are you here?")
			{
			say("@I am simply down on my luck right now. You are given no respect when pillaging as a fancy pirate.@");
			UI_remove_answer("So why are you here?");
			}
		else if (response == "Deary?")
			{
			say("@My apologies sweety, it was a slip of my tongue.@");
			UI_remove_answer("Deary?");
			UI_add_answer("Are you sure you should be a pirate?");
			}
		else if (response == "Are you sure you should be a pirate?")
			{
			say("@At times I long for the simple life of accessorizing and tea parties.@");
			say("@But the sea and the rough men it attracts is truely the life for me.@");
			UI_remove_answer("Are you sure you should be a pirate?");
			}
		}
	UI_remove_npc_face(item);
}
	}
