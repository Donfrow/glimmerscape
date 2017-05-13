/*

Lighthouse keep on island

*/

void Guybrush object#(0x553) ()
	{

	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{		// Sleeping.
			UI_item_say(item, "Zzzz");
			
			return;
			}
		var n = UI_get_random(2);// 1-2.
		if (n == 1)
			UI_item_say(item, "I'm a mighty pirate!");
		else if (n == 2)
			UI_item_say(item, "I can hold my breath for 10 minutes");
		return;
		}

	UI_show_npc_face(item);

		UI_add_answer("Name");
		UI_add_answer("Job");
		UI_add_answer("Bye");	

if(gflags[LEARN_OF_SUNK_SHIP])
{
	UI_add_answer("The Whipplestick");
}
		
if (UI_get_item_flag(item, MET)) 
	{
	say("@Welcome back.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Welcome to my island stranger.@");
	UI_set_item_flag(item, MET, true);
	}
	// End of opening IF
	

		converse
		{
	if (response == "Bye")
			{
			say("@Safe sailing.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@My name is Guybrush. Guybrush Threepwood and I'm a mighty pirate!@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am a mighty pirate!@");
			UI_remove_answer("Job");
			UI_add_answer("Mighty Pirate");
			}

		else if (response == "Mighty Pirate")
			{
			say("@Well, erm, ok. I am not really a mighty pirate. Though I bet there is a Guybrush Threepwood somewhere out there who is.@");
			say("@What I actually do is run the light station here on this island.@");
			UI_remove_answer("Mighty Pirate");
			UI_add_answer("Light Station");

			}
		else if (response == "Light Station")
			{
			say("@Well, it is more like a light house, for it provides light and I live here as well.@");
			UI_remove_answer("Light Station");
			UI_add_answer("What is your purpose?");
			}
		else if (response == "What is your purpose?")
			{
			say("@I am employed by the Nautical Guild to provide light to the seas so ships may avoid crashing into rocks.@");
			UI_remove_answer("What is your purpose?");
			UI_add_answer("Nautical Guild");
			UI_add_answer("What Rocks?");
			}
		else if (response == "Nautical Guild")
			{
			say("@The Nautical Guild is a shipping entity which employs many ships to sale the seas. Since the increase in pirate activity it has not been very active.@");
			say("@But they continue to pay me so I have no reason to complain.@");
			UI_remove_answer("Nautical Guild");
			UI_add_answer("Pirates");
			}
		else if (response == "Pirates")
			{
			say("@Some are ruthless, some are vile, some are simply drunk all day and night. They have been causing much ire amongst sailors.@");
			say("@So much so infact, that there have been a self-imposed sailing boycott. Tis the hopes of the Nautical Guild and sailors that with the lack of ships to plunder the pirates wilt go off and find other things to do.@");
			UI_remove_answer("Pirates");
			UI_add_answer("Are you not afraid?");
			}
		else if (response == "Are you not afraid?")
			{
			say("@The pirates leave me alone. As I provide a valuable seafaring tool with my light house they are content to leave me be.@");
			say("@And I am quite content with that.@");
			UI_remove_answer("Are you not afraid?");
			}
		else if (response == "What Rocks?")
			{
			say("@Well, the rocks are not so much near this location anymore. This island have slowly moved away from them.@");
			say("@Some of the farther mountains are still visible from here if your look hard enough, but regardless the tower is still an excellent aid for ship navigation.@");
			UI_remove_answer("What Rocks?");
			UI_add_answer("Moving Island");
			}
		else if (response == "Moving Island")
			{
			say("@I do not know what causes it, nor do I much care. If you truely desire to know I suggest you consult a geologist.@");
			UI_remove_answer("Moving Island");
			UI_add_answer("Geologist");
			}
		else if (response == "Geologist")
			{
			say("@It is some sort of specialized mage I believe. You could probably find one somewhere on the mainland.@");
			UI_remove_answer("Geologist");
			}
		else if (response == "The Whipplestick")
		{
			say("Guybrush nods. @I did indeed witness The Whipplestick attacked by multiple pirates vessels south of here. They had just checked in with me shortly before the attack.@");
			say("@I cannot say for certain how the ship sank but it did indeed end up on the depths of the ocean floor rather than in the hands of the pirates.@");
			say("@As I reported to the Nautical Guild, I would place the attack at appproximately 91 South 102 East.@");
			UI_remove_answer("The Whipplestick");
		}
		

		}
	UI_remove_npc_face(item);
	}
