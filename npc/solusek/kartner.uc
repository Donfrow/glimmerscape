/*
Kartner the gnome on solusek island
*/


void Kartner object#(0x4aa) ()
	{


var ore = UI_count_objects(PARTY, 330, ANY, 3);
var ore2 = UI_count_objects(PARTY, 330, ANY, 35); // stones used as the ore
var  ore3 = ore+ore2;

var bark = "Hail human";
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
				UI_item_say(item, "A lovely rock");
			else if (n == 2)
				UI_item_say(item, "Shiny");
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
        call Kartner, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@Greetings once more I give.@");
		UI_remove_answer("Name");
	}
else
	{

	say("@New face a pleasure to be seen by me.@");
	UI_set_item_flag(item, MET, true);
	}
// End MET Flag

if (ore3>2)
{
    UI_add_answer("Lense");
}


		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	
		converse
		{

	if (response == "Bye")
			{
			say("@Wellness is wished on you.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@Kartner, you can call me Kartner.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@To search and make objects with my mate and friend. Travel is finally done.@");
			UI_remove_answer("Job");
			UI_add_answer("Objects");
			UI_add_answer("Mate");
			UI_add_answer("Friend");
			}
		else if (response == "Objects")
			{
			say("@Precious metals make for precious objects in the hands of a gnome. Skilled humans are, but not as skilled as the hand of a gnome.@");
			UI_remove_answer("Objects");
			UI_add_answer("Gnome");
			}

		else if (response == "Gnome")
			{
			say("@I am gnome. You are human.@");
			UI_remove_answer("Gnome");
			}
		else if (response == "Mate")
			{
			say("@Olive is mate of mine. She is lovely gnome is she not?@");
			UI_remove_answer("Mate");
			}
		else if (response == "Friend")
			{
			say("@Rentrak is friend of Kartner. We are good friends. We fled mountain home together when it was discovered by humans and humans wanted metals.@");
			say("@Long time of travel since then is now over.@");
			UI_remove_answer("Friend");
			UI_add_answer("Travel");
			}
		else if (response == "Travel")
			{
			say("@Mountains are the home of the gnomes. Solusek Mining Company goes deep within the mountains and displaces us from our homes.@");
			say("@Many are killed trying to flee the invaders. We are viewed as rodents by many.@");
			UI_remove_answer("Travel");
			UI_add_answer("Solusek Mining Company");
			}
		else if (response == "Solusek Mining Company")
			{
			say("@This group takes the lives of many gnomes. I am saddened at the loss of my brothers and sisters. We have found this to be safe place even though it is so close to those that destroy.@");
			UI_remove_answer("Solusek Mining Company");
			UI_add_answer("Why is it safe?");
			}
		else if (response == "Why is it safe?")
			{
			say("@Anything of value to humans have already been taken from this cave. Humans have no reason to return here.@");
			say("@That does not mean that gnomes cannot find precious material to make objects with. Gnomes are not as picky as humans.@");
			UI_remove_answer("Why is it safe?");
			}
		else if (response == "Lense")
		{
		  say("@Construct this lense a gnome could do. Using ore which you have brought lense I will now construct.@");
		  say("@Here is your lense thank you I do for allowing me to construct it!@");
		  UI_remove_party_items(3, 330, 0, ANY);
		  UI_add_party_items(1, LENS, 0, 0);
		  UI_remove_answer("Lense");
        }
		
		}
	UI_remove_npc_face(item);
	}
}
