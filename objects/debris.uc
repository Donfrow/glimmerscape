void Jones_End_Clear_Convo object#()()
{
	UI_show_npc_face0(509, 0);
	say("An exhausted Jones looks at you. @It was hard work but we did it! Now we can enter a room that noone has entered in many generations!@");
	UI_show_npc_face1(416, 0);
	say("Suddenly you hear Marion yelling in the distance. @Jones! Buckles is acting up! I need your help to make him settle down!@");
	UI_show_npc_face0(509, 0);
	say("Jones grumbles. @I suppose I have to go take care of this. You are welcome to be the first to go down but please do not touch anything!@");
}

void Jones_Rubble_1 object#()()
{
	var debris = UI_create_new_object(201);
	UI_update_last_created([746, 2499, 0]);
}

void Jones_Rubble_2 object#()()
{
	var debris = UI_create_new_object(201);
	UI_set_item_frame(debris, 2);
	UI_update_last_created([750, 2507, 0]);
}

void Jones_Rubble_3 object#()()
{
	var debris = UI_create_new_object(201);
	UI_set_item_frame(debris, 7);
	UI_update_last_created([741, 2501, 0]);
}

void Jones_Rubble_4 object#()()
{
	var debris = UI_create_new_object(201);
	UI_set_item_frame(debris, 8);
	UI_update_last_created([749, 2508, 0]);
}

void Jones_Rubble_5 object#()()
{
	var debris = UI_create_new_object(201);
	UI_set_item_frame(debris, 15);
	UI_update_last_created([750, 2502, 0]);
}
void Jones_Rubble_6 object#()()
{
	var debris = UI_create_new_object(201);
	UI_set_item_frame(debris, 18);
	UI_update_last_created([741, 2509, 0]);
}

void Avatar_Clear_Debris()
{
	script AVATAR
	{
		nohalt;
		actor frame STAND;
		face SOUTH;
		say "Lets do this Jones!";
	}
}

void Jones_Complete object#()()
{
	UI_remove_from_area(202, 6, [749, 2508], [749, 2508]);
	UI_clear_item_flag(-446, DONT_MOVE);
}

void Jones_Clear_Debris()
{
	script -446
	{
		nohalt;
		face NORTH;
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		call Jones_Rubble_1;
		actor frame SWING_3;
		wait 1;
		say "Hard work!";
		call Lone_Tick_Sound;
		actor frame SWING_1;
		wait 1;
		call Jones_Rubble_1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		wait 1;
		call Lone_Tick_Sound;
		actor frame SWING_1;
		wait 1;
		call Jones_Rubble_4;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		wait 1;
		call Lone_Tick_Sound;
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		wait 1;
		call Jones_Rubble_6;
		call Lone_Tick_Sound;
		actor frame STAND;
		call Jones_Complete;
		wait 1;
		call Jones_End_Clear_Convo;
	}

	script AVATAR
	{
		face EAST;
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		call Jones_Rubble_1;
		actor frame SWING_3;
		wait 1;
		call Lone_Tick_Sound;
		actor frame SWING_1;
		wait 1;
		say "Indeed!";
		actor frame SWING_2;
		wait 1;
		call Jones_Rubble_2;
		actor frame SWING_3;
		wait 1;
		call Lone_Tick_Sound;
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		actor frame SWING_3;
		wait 1;
		call Jones_Rubble_5;
		call Lone_Tick_Sound;
		actor frame SWING_1;
		wait 1;
		actor frame SWING_2;
		wait 1;
		call Jones_Rubble_3;
		actor frame SWING_3;
		wait 1;
		actor frame STAND;
		call UnFreezeAvatar;
	}
	
}



void debris shape#(202)()
{
if(event == DOUBLECLICK)
{
	var pick = UI_get_readied(AVATAR, 1);
	var pick_readied = UI_get_item_shape(pick);
	var time = UI_game_hour();
	if(gflags[UNEARTH_STAIRCASE] && time >= 6 && time <= 17)
	{
		if(pick_readied == PICK)
		{
			UI_set_item_flag(AVATAR, DONT_MOVE);
			UI_set_item_flag(-446, DONT_MOVE);
			UI_si_path_run_usecode(AVATAR, [741, 2502, 0], SCRIPTED, AVATAR, Avatar_Clear_Debris,0);
			UI_si_path_run_usecode(-446, [747, 2509, 0], SCRIPTED, -446, Jones_Clear_Debris, 0);
		}
		else
		{
			AVATAR.say("@I need to use a pick!@");
		}
	}

}
}
