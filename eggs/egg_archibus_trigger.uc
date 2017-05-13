void Archibus_Conversation()
{
	UI_set_item_frame_rot(-393, 32);
	UI_set_item_frame_rot(AVATAR, 0);
	UI_show_npc_face0(393, 0);
	say("@I have been waiting for you my love... wait a moment, you are a dissenter, not my love!@");
	UI_add_answer("Name");
	UI_add_answer("Job");
	UI_add_answer("Dissenter");
	UI_add_answer("Love");
	UI_add_answer("Bye");
	converse
	{
		if(response == "Bye")
		{
			say("@You shall not escape.@");
			UI_clear_item_flag(AVATAR, DONT_MOVE);
			UI_set_opponent(-393, AVATAR);
			UI_set_schedule_type(-393, IN_COMBAT);
			UI_set_alignment(-393, HOSTILE);
			break;
		}
		else if (response == "Name")
		{
			say("@A dissenter like you should already know I am Archibus.@");
			UI_remove_answer("Name");
			if(gflags[LEARN_OF_WORDS])
			{
				UI_add_answer("Words of Power");
			}
		}
		else if (response == "Words of Power")
		{
			say("@The MageLord was right. It was only a matter of time before one of your kind would try to get the words for their own nefarius ends. Know that you will have failed as you will not leave here alive.@");
			UI_remove_answer("Words of Power");
		}
		else if (response == "Job")
		{
			say("@Unlike you I actually look forward to helping the MageLord, therefore I work with him to achieve his goals, like our people should! It because of this I am his head scholar, something you could never hope to be.@");
			UI_remove_answer("Job");
		}
		else if (response == "Dissenter")
		{
			say("@The likes of you make a beastly blot upon our people. How dare you go against the mighty MageLord. Have you no shame?@");
			UI_remove_answer("Dissenter");
		}
		else if (response == "Love")
		{
			say("@The likes of you could never know of such things, I spit upon you!@");
			UI_remove_answer("Love");
		}
		
	}
}

void Archibus_Move()
{
	UI_si_path_run_usecode(-393, [2510, 54, 0], SCRIPTED, -393, Archibus_Conversation, 0);	
}

void egg_archibus_trigger object#()()
{
	if(UI_is_dead(-393))
	{
		
	}
	else
	{
		UI_set_item_flag(AVATAR, DONT_MOVE);
		UI_si_path_run_usecode(AVATAR, [2505, 60, 0], SCRIPTED, AVATAR, Archibus_Move, 1);
		//UI_si_path_run_usecode(-393, [2504, 54, 0], SCRIPTED, -393, Archibus_Conversation, 1);	
		script -393
		{
			say "My love...";
		}
	}
}