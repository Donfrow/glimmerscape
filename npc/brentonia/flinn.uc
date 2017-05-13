/*
Flinn the jail guard in Dewtopia
*/


void Flinn object#(0x4ef) ()
	{

var bark = "Yes?";
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
				UI_item_say(item, "Do not break any laws");
			else if (n == 2)
				UI_item_say(item, "Noone has escaped under my watch");
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
        call Flinn, TALK;
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

if(gflags[GOOD_TRANSPORT_RELEASE])
{
	UI_add_answer("Markus got away");
}
if(gflags[BAD_TRANSPORT_RELEASE])
{
	UI_add_answer("Markus had goblins ambush me");
}
		
if (UI_get_item_flag(item, MET)) 
	{
		say("@Why do you return?@");
		UI_remove_answer("Name");

	}
else
	{

		say("@What do you want with me?@");
		UI_set_item_flag(item, MET, true);
	}
// End MET Flag

		converse
		{
        if (response == "Bye")
        {
            say("@Do not break any laws lest you end up under my watch.@");
            break;
        }
        else if (response == "Name")
        {
            say("@Jailor Flinn, at your service.@");
            UI_remove_answer("Name");
        }
        else if (response == "Job")
        {
            say("@I guard those who have committed crimes and are placed in the Brentonia Jail.@");
            UI_remove_answer("Job");
            UI_add_answer("Jail");
            UI_add_answer("Crimes");
        }
        else if (response == "Jail")
        {
            say("@It is very small and I believe this is one of the reasons that crime is not rampant here. Who would want to spend a day crowded in such a small cell with other prisoners?@");
            UI_remove_answer("Jail");
			UI_add_answer("Prisoners");
        }
		else if (response == "Prisoners")
		{
			say("@Currently the only prisoners in the cell are Marsten and Nuggles.@");
			UI_remove_answer("Prisoners");
			UI_add_answer("Marsten");
			UI_add_answer("Nuggles");
		}
		else if (response == "Marsten")
		{
			say("@There is a sad excuse for a man. He claims that when he was caught picking Luther's pockets that the real thief framed him. Anyone who believes that story is a fool.@");
			UI_remove_answer("Marsten");
		}
		else if (response == "Nuggles")
		{
			say("The man sighs. @He is not technically a prisoner as he has committed no crime but his mind is so far out that when he is allowed to roam free he tends to get into trouble.@");
			say("@We have tried letting him out of the cell before but we simply cannot watch him all the time, and the moment you take your eyes off him he is off getting himself into some sort of trouble.@");
			say("@So we have no choice but to lock him up as he has no family or anyone else willing to take care of him.@");
			UI_remove_answer("Nuggles");
		}
        else if (response == "Crimes")
        {
            say("@There is not really much to say about that. Do not steal, do not murder, do not cause civil unrest. Obey such simple laws and you will be fine here.@");
            say("@But do not litter... those who litter are sent straight to the gallows.@");
            UI_remove_answer("Crimes");
        }
		else if (response == "Markus got away")
		{
			say("@Typical. Leave it to Dewtopian knight to let a goblin symphysiser escape his clutches. Know that it is on you to go capture him again.@");
			UI_remove_answer("Markus got away");
		}
		else if (response == "Markus had goblins ambush me")
		{
			say("@Do not try to concoct a story to cover up for your incompetence. Know that it is on you to go and capture him again.@");
			UI_remove_answer("Markus had goblins ambush me");
		}

		}
	UI_remove_npc_face(item);
	}
}
