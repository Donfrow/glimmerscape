/*
John the Pirate at the shelter
*/

void John object#(0x4f8) ()
	{
var bark = "Ye shall soon fear me";
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
				UI_item_say(item, "Arrrr");
			else if (n == 2)
				UI_item_say(item, "I am the toughest pirate ever");
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
        call John, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);
if (UI_get_item_flag(item, 28)) 
	{
	say("@Must you continue to bother me?@");
	}
else
	{
	say("@What do you want with me?!@");
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
			say("@Watch your back...@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am John the Pirate.@");
			UI_remove_answer("Name");
			UI_add_answer("Don't pirates not live in shelters?");
			}
		else if (response == "Don't pirates not live in shelters?")
			{
			say("@Do you accuse me of not being a pirate?@");
			UI_remove_answer("Don't pirates not live in shelters?");
			UI_add_answer("Yes");
			UI_add_answer("No");
			}
		else if (response == "No")
			{
			say("@You are not as foolish as you look.@");
			UI_remove_answer("Yes");
			UI_remove_answer("No");
			}
		else if (response == "Yes")
			{
			say("@Say that again and I shall have the tongue of a blithering fool.@");
			UI_add_answer("You are not a pirate");
			UI_add_answer("Say nothing");
			UI_remove_answer("Yes");
			UI_remove_answer("No");
			}
		else if (response == "Say nothing")
			{
			say("@Smart fellow you are.@");
			UI_remove_answer("Say nothing");
			UI_remove_answer("You are not a pirate");
			}
		else if (response == "You are not a pirate")
			{
			say("@Your tongue shall be mine.@");
			set_alignment(HOSTILE);  // Alternativelly, "item->set_alignment(HOSTILE);"
   			set_schedule_type(IN_COMBAT);  // Alternativelly, "item->set_schedule_type(IN_COMBAT);"
    			set_opponent(AVATAR);  

			break;
			}
		else if (response == "Job")
			{
			say("@I plunder and pillage like a great pirate does.@");
			UI_remove_answer("Job");
			UI_add_answer("Plunder and pillage");
			UI_add_answer("Great pirate");
			}
		else if (response == "Great pirate")
			{
			say("@I am one of the mightiest pirates of these lands, you would be best to fear me.@");
			UI_remove_answer("Great pirate");
			UI_add_answer("You seem to just leach from others");
			}
		else if (response == "You seem to just leach from others")
			{
			say("@Thems fighting words!@");
			UI_set_schedule_type(-248, 0);
			UI_set_alignment(-248, 2);
			UI_set_oppressor(-248,0);
			break;
			}
		else if (response == "Plunder and pillage")
			{
			say("@I take from others and add it to my treasure!@");
			UI_remove_answer("Plunder and pillage");
			UI_add_answer("Treasure");
			}
		else if (response == "Treasure")
			{
			say("@My treasure is well hidden.@");
			UI_remove_answer("Treasure");
			}
		}
	UI_remove_npc_face(item);
	}
	}
