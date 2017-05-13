/*
Bedic the castle healer in Dewtopia
*/
	
void Bedic_Insult()
{
UI_push_answers();
converse(["You must not be a very good healer", "Say nothing"])
{
	case "Say nothing" (remove):
	UI_clear_answers();
	UI_pop_answers();
	break;
	
	case "You must not be a very good healer" (remove):
	say("Bedic scowls at you. @At least I am not a good piece of refuse like you.@");
	add(["That was pathetic"]);
	remove(["Say nothing"]);
	
	case "That was pathetic" (remove):
	say("@As are you!@");
	gflags[BEDIC_INSULT] = true;
	karma = karma - 50;
	KarmaBadSprites();
	UI_clear_answers();
	UI_pop_answers();
	break;
	
}
}

void Bedic_Potion_Create_Convo object#()()
{
UI_show_npc_face(308);
say("@There. I have slightly modified the normal potions which I prepare for him. Please, take this potion to him. He is expecting one anyway@");
say("@Hopefully this shall have less adverse affects than the normal batches and help quell the approaching madness. I do suspect it will be some time to see if it actually helps.@");
UI_add_party_items(1, 1332, ANY, ANY); // Potion

	if(gflags[BEDIC_INSULT]) // Insult him, if you please
	{
	}
	else
	{
		Bedic_Insult();
	}

}


	
void Bedic object#(0x4fd)()
	{
	if (event == 0)
		{
		if (UI_get_schedule_type(item) == 14)
			{		// Sleeping.
			UI_item_say(item, "Zzzz@");
			return;
			}
		var n = UI_get_random(2);// 1-2.
		if (n == 1)
			UI_item_say(item, "Are you feeling all right?");
		else if (n == 2)
			UI_item_say(item, "Perhaps you could use some tonic?");
		return;
		}
	UI_show_npc_face(item);


UI_add_answer("Name");
UI_add_answer("Job");
UI_add_answer("Bye");

if (gflags[POTION_QUEST]) // After talking with Celena about Brunt and his elixer
{	
	UI_add_answer("Brunt's madness");
}
	
if (UI_get_item_flag(item, 28)) 
	{
	say("@I am glad to see you are still healthy.@");
	UI_remove_answer("Name");
	}
else
	{
	say("@Well met, stranger.@");
	UI_set_item_flag(item, 28, true);
	}
	// End of opening IF



		converse
		{
	if (response == "Bye")
		{
			say("@Be healthy.@");	
			break;
		}
		else if (response == "Name")
		{
			say("@I am Bedic.@");
			UI_remove_answer("Name");
		}
		else if (response == "Job")
		{
			say("@I am the healer for Lord Dew and his court.@");
			UI_remove_answer("Job");
			UI_add_answer("Healer");
		}
		else if (response == "Healer")
		{
			say("@I tend to the wounds and ailments of those in need, though I am only permitted to heal those of Lord Dew and his court.@");
			UI_remove_answer("Healer");
				

		}
		else if (response == "Brunt's madness")
		{
			if(gflags[HAS_POTION])
			{
				if(gflags[GAVE_BRUNT_POTION])
				{
					say("@I do hope we see some improvement in Brunt as time goes on otherwise I may have to come up with an entirely new concoction.@");
				}
				else
				{
					say("@Please, take the exilir I have prepared to Brunt.@");
				}
				UI_remove_answer("Brunt's madness");
			}
			else
			{
				say("Bedic looks concerned. @You say that Celena believes that Brunt is slowly going mad due to the elixer which I prepare for him? I certainly hope that is not the case.@");
				say("He ponders for a moment. @Though now that you bring it to my attention it does seem like he has been different lately.@");
				say("@Give me a moment and I shall prepare a potion that you may take to him.@");
				
				gflags[HAS_POTION] = true; // Lets you talk to Brunt about his madness
				
				script item
				{
					nohalt;
					actor frame SWING_1;
					call Loom_Squeel;
					wait 1;
					actor frame SWING_2;
					wait 1;
					call Loom_Squeel;
					actor frame SWING_3;
					wait 1;
					actor frame STAND;
					say "There we go";
					wait 6;
					call Bedic_Potion_Create_Convo;
				}
				
				break;
			}
		}


}
	UI_remove_npc_face(item);
	}
