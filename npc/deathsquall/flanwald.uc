/*
Flanwald to the north of the mountains of freedom
*/

void GiveKey()
{
    UI_push_answers();
    UI_add_answer("Yes");
    UI_add_answer("No");
    
    converse
    {
        if (response == "Yes")
        {
            say("@Thank you! Here is the key.@");
            UI_add_party_items(1, 641, 10, ANY);
            gflags[FLANWALD_KEY] = true;
            karma = karma + 250;
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
        else if (response == "No")
        {
            say("@If you change your mind I will still give the key!@");
            UI_clear_answers();
            UI_pop_answers();
            break;
        }
    }
}

void Flanwald object#(0x416) ()
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
				UI_item_say(item, "I am a dead man");
			else if (n == 2)
				UI_item_say(item, "Woe is me");
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
        call Flanwald, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@At least you art not after my head.@");
	}
else
	{

	say("@Please, do not hurt me.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag






		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Do be careful on this island.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Flanwald, former foreman of DeathScorn Mountains.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I was the former forman of the mining operation within DeathScorn Mountains.@");
			UI_remove_answer("Job");
			UI_add_answer("DeathScorn Mountains");
			}
		else if (response == "DeathScorn Mountains")
			{
			say("@The DeathScorn Mountains are the massive mountain range that you can find on this island.@");
			say("@It was here that the Solusek Mining Company had setup operations in order to retrieve the gold from within. That operation has since been abandoned.@");
			UI_remove_answer("DeathScorn Mountains");
			UI_add_answer("Solusek Mining Company");
			UI_add_answer("Abandoned");
			}
		else if (response == "Abandoned")
			{
			say("@During the mining we had breached into a chamber filled with feriocious green beasts. Even more fearsome than goblins.@");
			say("@The company sent us guards to reinforce the lines so that the miners could continue to work, however the sheer number of the beasts was too much and eventually the mine was being overrun.@");
			UI_add_answer("Beasts");
			UI_remove_answer("Abandoned");
			UI_add_answer("Overrun");

			}
		else if (response == "Overrun")
			{
			say("@The company was taking heavy losses with the guards sent to protect the miners and eventually decided the cost of this operation was becoming unacceptable.@");
			say("@They ordered the mine evacuated, guards and equipment first. I tried to keep the miners safe but eventually it became too much with the few guards who were still present.@");
			say("@I ordered the evacuation of the miners before the company desired it. They had hoped to milk every ounce of gold before they had no choice but to order the miners out.@");
			UI_remove_answer("Overrun");
			UI_add_answer("Miners");
			}
		else if (response == "Miners")
			{
			say("@The miners cost a gold coin for a dozen to the company, and as such they are deemed expendable. After the guards and equipment were safely out they were to be evacuated.@");
			say("@However the beasts were slaughtering the miners in such numbers that I could not wait for the evacuation order from the company so I ordered it ahead of time.@");
			say("@This has not made the company happy at all I am sure.@");
			UI_remove_answer("Miners");
			UI_add_answer("Happy");
			}
		else if (response == "Happy")
			{
			say("@The Solusek Mining Company does not take kindly to those who disobey orders and get in the way of their profits.@");
			say("@No doubt if they were to find me now I would be quartered and hanged. That is why you find me here.@");
			UI_remove_answer("Happy");
			}

		else if (response == "Beasts")
			{
			say("@Green skinned creatures with heads like a snake. They are quite deadly. When we left the mine we locked both entrances.@");
			say("@I do hope that noone has opened the gates for surely they would destroy everything nearby.@");
			UI_add_answer("Gates");
			UI_remove_answer("Beasts");
			}
		else if (response == "Gates")
			{
			say("@Wrought iron gates designed to only be opened from the outside block the entrances. I do hope noone manages to get them open.@");
			UI_remove_answer("Gates");
			}
		else if (response == "Solusek Mining Company")
		{
            say("@They run their main operations from their headquarters to the west of the main continent. One must have a key or business there in order to enter.@");
            if (gflags[FLANWALD_KEY])
            {
            }
            else
            {
            say("@As I am not longer welcome, I have no use for my key. If you promise to not let them know of my location I can give you my key. Will you agree to this?@");
            GiveKey();
            }
            UI_remove_answer("Solusek Mining Company");
        }


		}
	UI_remove_npc_face(item);
	}
}

