void Morghrim_Knockout()
{
	script AVATAR
	{
		say "No you don't...";
		actor frame SWING_1;
		wait 2;
		actor frame SWING_2;
		wait 2;
		call Torch_Sound;
		actor frame SWING_3;
		wait 2;
		actor frame STAND;
		wait 4;
		call UnFreezeAvatar;
	}
	script -177
	{
		wait 8;
		say "Oof";
		actor frame KNEEL;
		wait 2;
		actor frame LIE;
	}
}

void Move_Morghrim object#()()
{
	UI_move_object(-177, [2466, 3058, 0]);
}

void Past_Morghrim_Convo_End()
{
	UI_push_answers();
	UI_add_answer("Let him go");
	UI_add_answer("Prevent him from alerting the guard");	
	converse
	{
		if(response == "Let him go")
		{
			gflags[MORGHRIM_TELEPORT_ESCAPE] = true;
			UI_clear_answers();
			UI_pop_answers();
			break;		
		}
		else if (response == "Prevent him from alerting the guard")
		{
			gflags[MORGHRIM_KNOCK_OUT] = true;
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
	}
}

void Past_Morghrim_Convo_Side()
{
	UI_push_answers();
	UI_add_answer("Say nothing");
	UI_add_answer("Do not give into the Orb of Souls!");
	converse
	{
		if(response == "Say nothing")
		{
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
		else if (response == "Do not give into the Orb of Souls!")
		{
			say("@How do you know of such things? Someone within the MageLord's ranks must be passing information to your ilk! Know that your slip of the tongue will help us weed them out.@");
			UI_clear_answers();
			UI_pop_answers();
			break;
		}
	}
}

void Past_Morghrim_Convo()
{
	UI_set_item_frame_rot(-177, 32);
	UI_set_item_frame_rot(AVATAR, 48);
	UI_show_npc_face0(640, 0);
	say("@What in the world... who are you!?@");
	UI_add_answer("Avatar");
	UI_add_answer("Noone");
	UI_add_answer("Your long lost cousin");
	
	converse
	{
		if(response == "Avatar")
		{
			say("@I have not heard of this before, no doubt one of the dissentors in these troubled times!@");
			UI_clear_answers();
			UI_add_answer("Troubled times");
		}
		else if (response == "Noone")
		{
			say("@A very clever noone to have managed to get into the MageLord's castle in times like these...@");
			UI_clear_answers();
			UI_add_answer("Troubled times");
		}
		else if (response == "Your long lost cousin")
		{
			say("@How dare you try to mock me! How dare you break into the MageLord's castle at a time like this!@");
			UI_clear_answers();
			UI_add_answer("Troubled times");
		}
		else if (response == "Troubled times")
		{
			say("@No doubt you are one of the trouble makers. And as the MageLord's most trusted assistant it is my duty to alert the guard of your presence.@");
			UI_remove_answer("Troubled times");
			UI_add_answer("MageLord's assistant");
			UI_add_answer("Alert the guard");
		}
		else if (response == "MageLord's assistant")
		{
			say("@That is right. You have wandered into the room of Morghrim.@");
			Past_Morghrim_Convo_Side();
			UI_remove_answer("MageLord's assistant");
		}
		else if (response == "Alert the guard")
		{
			say("@You shall not prevent me from alerting the guards! I hope your enjoy the punishment the MageLord decides to give out to you. I know I shall enjoy my reward for catching you!@");
			Past_Morghrim_Convo_End();
			if(gflags[MORGHRIM_KNOCK_OUT]) // If the player prevents Morghrim from escaping
			{
				UI_si_path_run_usecode(AVATAR, [2462, 38, 0], SCRIPTED, AVATAR, Morghrim_Knockout, 1);
				break;
			}
			else // If the player lets Morghrim escape
			{
				targetx = 2465;
				targety = 39;
				script -177
				{
					nohalt;
					say "I shall alert the guards!";
					wait 2;
					actor frame KNEEL;
					wait 2;
					call Blue_Teleport_Ring;
					call Teleport_In_Sound;
					wait 2;
					call Move_Morghrim;
				}
				script AVATAR
				{
					nohalt;
					wait 7;
					say "I best get moving...";
					call UnFreezeAvatar;
				}
				break;
			}
		}
	}
}

void Past_Morghrim_Move()
{
	UI_si_path_run_usecode(-177, [2465, 39, 0], SCRIPTED, AVATAR, Past_Morghrim_Convo, 1);
}

void egg_morghrim_convo_past_trigger object#()()
{
	UI_set_item_flag(AVATAR, DONT_MOVE);
	UI_si_path_run_usecode(AVATAR, [2459, 38, 0], SCRIPTED, AVATAR, Past_Morghrim_Move, 1);
	NPC = -177;
	targetx = 2478;
	targety = 39;
	Generic_Move_NPC_General();
}