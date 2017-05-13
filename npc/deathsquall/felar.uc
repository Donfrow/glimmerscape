/*
Felar the fisher on DeathSquall island
*/


void Felar object#(0x4b2) ()
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
				UI_item_say(item, "Fine weather");
			else if (n == 2)
				UI_item_say(item, "The fish are not biting");
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
        call Felar, TALK;
    }
    // avatar's script here
    abort;
}
else if (event == TALK)
{
	UI_show_npc_face(item);

if (UI_get_item_flag(item, MET)) 
	{
		say("@What brings you back?");
		UI_remove_answer("Name");
	}
else
	{

	say("@Greetings stranger.@");
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
			say("@Hope your battles go better than my fishing.@");
			
			break;
			}
		else if (response == "Name")
			{
			say("@I am Felar.@");
			UI_remove_answer("Name");
			}
		else if (response == "Job")
			{
			say("@I am a fisher here on DeathSquall Island.@");
			UI_remove_answer("Job");
			UI_add_answer("Fisher");
			UI_add_answer("DeathSquall Island");
			}
		else if (response == "Fisher")
			{
			say("@Yes, a fisher. This village used to be the largest fishery in the land but now all that is left is a few independent fishers.@");
			say("@Though we still do supply much of the fish, I might add.@");
			if(gflags[FISH_SPAWN_FIXED])
			{
				say("@Thankfully, the fish have once again started to bite. These last few months have been quite the test for us fisherman but thankfully that seems to be over.@");
			}
			else
			{
				say("He rubs his chin. @These last few months the fish have not been biting. It almost seems as if we have overfished the area. I do hope that is not the case.@");
				UI_add_answer("Overfished");
			}
			UI_remove_answer("Fisher");
			UI_add_answer("Fishery");
			}
		else if (response == "Overfished")
		{
			say("@I have not been able to catch as many fish as I have in the past. Perhaps after all these years of fishing these waters we have simply fished too many.@");
			say("@If that is indeed the case I do not know what I would do for a job.@");
			UI_remove_answer("Overfished");
		}
		else if (response == "Fishery")
		{
			say("@The Archibald Wheat and Fish company used to have a large operation on this island until the Archibald family was brutally murdered.@");
			say("@Since then the only fishers on the island work independently.@");
			UI_remove_answer("Fishery");
			UI_add_answer("Murder");
			UI_add_answer("Archibald");
		}
		else if (response == "Murder")
		{
			say("@I do not know much about it other than it was supposedly quite a mess.@");
			UI_remove_answer("Murder");
		}
		else if (response == "Archibald")
		{
			say("@Vela would be able to tell you more about the Archibald company and his family.@");
			UI_remove_answer("Archibald");
		}

		else if (response == "DeathSquall Island")
			{
			say("@This island is named after the mountain range which covers the north side of the island.@");
			UI_remove_answer("DeathSquall Island");
	
			}
		
		}
	UI_remove_npc_face(item);
	}
}
